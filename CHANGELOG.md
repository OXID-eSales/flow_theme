# Change Log for OXID eSales Flow Theme

All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [3.0.0] - Unreleased

### Added
- Template:
    - `page/account/delete_my_account_confirmation.tpl`
    - `form/fieldset/delete_shipping_address_modal.tpl`    
- Block:
    - `account_order_history_cart_items` in page/account/order.tpl
    - `account_dashboard_delete_my_account` in page/account/dashboard.tpl
    - `account_delete_my_account_confirmation` in page/account/delete_my_account_confirmation.tpl
    - `account_delete_my_account_confirmation_header_message` in page/account/delete_my_account_confirmation.tpl
    - `account_delete_my_account_confirmation_warning_message` in page/account/delete_my_account_confirmation.tpl
    - `account_delete_my_account_confirmation_form` in page/account/delete_my_account_confirmation.tpl
    - `account_delete_my_account_confirmation_form_button_set` in page/account/delete_my_account_confirmation.tpl
    - `details_productmain_price` in page/details/inc/priceinfo.tpl
- Multilang string: 
    - `DD_DELETE`   
    - `DD_DELETE_SHIPPING_ADDRESS`
- Feature: a user has the possibility to delete a shipping address
- Feature: a user has the possibility to disable product recommendations
- Feature: show unit price near the product full price [PR-116](https://github.com/OXID-eSales/flow_theme/pull/116)
- Additional information added to Google Tracking id hint
    - The shop owner is responsible for the legal use of this function. An adaptation of the privacy policy is mandatory.

### Changed

### Deprecated

### Removed

### Fixed
- Cover unit price with rights to see check [0006687](https://bugs.oxid-esales.com/view.php?id=6687)
- Fix zoom picture if allow_url_fopen disabled [PR-111](https://github.com/OXID-eSales/flow_theme/pull/111)
- Email Templates contains some untranslated Idents [0006437](https://bugs.oxid-esales.com/view.php?id=6437)
- Updated deprecated price functions in basketcontents [PR-89](https://github.com/OXID-eSales/flow_theme/pull/89)
- Single quote was impossible in form validation translations [PR-119](https://github.com/OXID-eSales/flow_theme/pull/119)
- Fix translations COOKIE_NOTE_CLOSE and ADD_RECOMM_ADDRECOMMLINK2 [PR-117](https://github.com/OXID-eSales/flow_theme/pull/117)
- Fix double evaluation of Javascript on details page [PR-118](https://github.com/OXID-eSales/flow_theme/pull/118)

### Security

## [2.3.3] - 30-11-2017

### Fixed
- [Guestbook option remains in footer settings of the Flow theme](https://bugs.oxid-esales.com/view.php?id=6696)

[3.0.0]: https://github.com/OXID-eSales/flow_theme/compare/v3.0.0...HEAD
[2.3.3]: https://github.com/OXID-eSales/flow_theme/compare/v2.3.2...v2.3.3