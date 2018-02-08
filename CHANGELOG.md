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
- Multilang string: 
    - `DELETE`   
    - `DELETE_SHIPPING_ADDRESS`
- Feature: a user has the possibility to delete a shipping address


### Changed

### Deprecated

### Removed

### Fixed
- Cover unit price with rights to see check [0006687](https://bugs.oxid-esales.com/view.php?id=6687)
- Fix zoom picture if allow_url_fopen disabled [PR-111](https://github.com/OXID-eSales/flow_theme/pull/111)
- Email Templates contains some untranslated Idents [0006437](https://bugs.oxid-esales.com/view.php?id=6437)
- Updated deprecated price functions in basketcontents [PR-89](https://github.com/OXID-eSales/flow_theme/pull/89)

### Security

## [2.3.3] - 30-11-2017

### Fixed
- [Guestbook option remains in footer settings of the Flow theme](https://bugs.oxid-esales.com/view.php?id=6696)

[3.0.0]: https://github.com/OXID-eSales/flow_theme/compare/v3.0.0...HEAD
[2.3.3]: https://github.com/OXID-eSales/flow_theme/compare/v2.3.2...v2.3.3