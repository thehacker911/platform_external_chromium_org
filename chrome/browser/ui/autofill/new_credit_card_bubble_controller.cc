// Copyright 2013 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "chrome/browser/ui/autofill/new_credit_card_bubble_controller.h"

#include <string>

#include "base/logging.h"
#include "base/strings/utf_string_conversions.h"
#include "chrome/browser/browser_process.h"
#include "chrome/browser/profiles/profile.h"
#include "chrome/browser/ui/autofill/data_model_wrapper.h"
#include "chrome/browser/ui/autofill/new_credit_card_bubble_view.h"
#include "chrome/browser/ui/browser_finder.h"
#include "chrome/browser/ui/chrome_pages.h"
#include "chrome/browser/ui/host_desktop.h"
#include "chrome/common/url_constants.h"
#include "components/autofill/core/browser/autofill_profile.h"
#include "components/autofill/core/browser/credit_card.h"
#include "grit/chromium_strings.h"
#include "grit/generated_resources.h"
#include "grit/theme_resources.h"
#include "ui/base/l10n/l10n_util.h"
#include "ui/base/resource/resource_bundle.h"

namespace autofill {

namespace {

static const int kMaxGeneratedCardTimesToShow = 5;
static const char kWalletGeneratedCardLearnMoreLink[] =
    "http://support.google.com/wallet/bin/answer.py?hl=en&answer=2740044";

}  // namespace

CreditCardDescription::CreditCardDescription() {}
CreditCardDescription::~CreditCardDescription() {}

NewCreditCardBubbleController::~NewCreditCardBubbleController() {
  Hide();
}

// static
void NewCreditCardBubbleController::Show(
    Profile* profile,
    scoped_ptr<CreditCard> new_card,
    scoped_ptr<AutofillProfile> billing_profile) {
  (new NewCreditCardBubbleController(profile))->SetupAndShow(
      new_card.Pass(),
      billing_profile.Pass());
}

const base::string16& NewCreditCardBubbleController::TitleText() const {
  return title_text_;
}

const CreditCardDescription& NewCreditCardBubbleController::CardDescription()
    const {
  return card_desc_;
}

const base::string16& NewCreditCardBubbleController::LinkText() const {
  return link_text_;
}

void NewCreditCardBubbleController::OnBubbleDestroyed() {
  delete this;
}

void NewCreditCardBubbleController::OnLinkClicked() {
  Browser* browser = chrome::FindTabbedBrowser(profile_, false,
                                               chrome::GetActiveDesktop());
  if (browser)
    chrome::ShowSettingsSubPage(browser, chrome::kAutofillSubPage);

  Hide();
}

NewCreditCardBubbleController::NewCreditCardBubbleController(Profile* profile)
    : profile_(profile),
      title_text_(l10n_util::GetStringUTF16(
          IDS_AUTOFILL_NEW_CREDIT_CARD_BUBBLE_TITLE)),
      link_text_(l10n_util::GetStringUTF16(
          IDS_AUTOFILL_NEW_CREDIT_CARD_BUBBLE_LINK)),
      weak_ptr_factory_(this) {}

base::WeakPtr<NewCreditCardBubbleView> NewCreditCardBubbleController::
    CreateBubble() {
  return NewCreditCardBubbleView::Create(this);
}

base::WeakPtr<NewCreditCardBubbleView> NewCreditCardBubbleController::
    bubble() {
  return bubble_;
}

void NewCreditCardBubbleController::SetupAndShow(
    scoped_ptr<CreditCard> new_card,
    scoped_ptr<AutofillProfile> billing_profile) {
  DCHECK(new_card);
  DCHECK(billing_profile);

  new_card_ = new_card.Pass();
  billing_profile_ = billing_profile.Pass();

  const base::string16 card_number =
      new_card_->GetRawInfo(CREDIT_CARD_NUMBER);
  ui::ResourceBundle& rb = ResourceBundle::GetSharedInstance();
  card_desc_.icon = rb.GetImageNamed(
      CreditCard::IconResourceId(CreditCard::GetCreditCardType(card_number)));
  card_desc_.name = new_card_->TypeAndLastFourDigits();

  AutofillProfileWrapper wrapper(billing_profile_.get(), 0);
  card_desc_.description = wrapper.GetDisplayText();

  bubble_ = CreateBubble();
  if (!bubble_) {
    // TODO(dbeam): Make a bubble on all applicable platforms.
    delete this;
    return;
  }

  bubble_->Show();
}

void NewCreditCardBubbleController::Hide() {
  if (bubble_)
    bubble_->Hide();
}

}  // namespace autofill
