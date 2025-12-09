## System Overview

- Each module (`accounts/`, `admin/`, `reports/`) runs as a standalone PHP bundle sharing `db.php`, `auth.php`, `UserLog()` logging, and the MySQL `acc` schema from `my_acc_book.sql`.
- Multi-tenant context comes from `client_registration` via the `client_cook` cookie; `auth.php` enforces session/device cookie `DR{usr_id}` and exposes `$con`, `$user_id`, `$location_id`, `$client_name`, `$is_vat_registered`.
- The unified ledger is `accounts_transaction` (see `information.md`): link source tables with `source` + `source_id`, and favor `status`/`reversed`/`log_old_period` flags over hard deletes.
- Layout, navigation, and shared JS/CSS load through module-specific `header.php`/`footer.php`; include them to get Select2, DataTables, datepicker, `notify`, and `attachProcessingForm()` helpers.

## Server-Side Conventions

- Always include `db.php` and `auth.php` in pages and AJAX endpoints so connection, session guards, and `$location_id` scoping are available.
- Scope every query by `$location_id` to maintain tenant isolation; mirror the patterns in `accounts/ajax/fetch_account_list.php` and `reports/report_sales_monthly.php`.
- Normalize UI dates with `save_date()` (or `toDB`/`toUser` helpers in module headers) before persisting to MySQL.
- Journal actions (`accounts/journal_entry.php`) are the template: validate totals, write `accounts_journal` + `accounts_journal_detail`, mirror entries into `accounts_transaction`, and log via `UserLog()`.
- When adding debit/credit features, compute VAT amounts alongside bases and persist to `accounts_transaction.debit_vat_amount` / `credit_vat_amount` like `accounts/journal/save_journal.php`.
- Wrap bulk SQL work with `exec_or_fail()`-style guards, log failures with `error_log()`, and return friendly messages to the UI.

## Front-End Patterns

- Forms rely on Bootstrap + jQuery; give every date field the `date_input` class so `accounts/footer.php` wires up validation and the Bootstrap datepicker.
- Selects are upgraded with Select2; inside modals call `.select2({ dropdownParent: modal })` as shown when adding journal lines.
- Dynamic dropdowns come from HTML snippets served by AJAX endpoints (e.g., `fetch_account_list.php`, `fetch_contacts.php`); reuse this approach rather than hard-coding options.
- Keep client-side validations (balancing debits/credits, enforcing contact types) in sync with PHP checks before posting forms.
- Tables default to `#example` DataTables instances; Excel exports hinge on `assets/export.js` and `xlsx.full.min.js`—provide an `#exportButton` with a `filename` attribute to hook in.
- Surface feedback with the shared `notify(type, title, msg)` helper instead of bespoke alerts.

## Workflows & Utilities

- Develop under XAMPP/Apache + PHP pointed at the `acc` database; use `my_acc_book.sql` to seed or refresh schemas.
- Device registration (`device_registration.php`, `auth.php`) issues encrypted `DR{usr_id}` cookies; preserve this flow when touching authentication.
- Permissions live in `user_license` (columns like `accounts`, `store`, `admin`); gate new screens the same way as `index.php` and module headers.
- Call `attachProcessingForm()` for `.processing_form` wrappers with `.processing_button` submits to prevent double posts.
- Log significant actions with `UserLog(module, action, detail)` to keep `user_log` auditable and consistent with existing module IDs.
- Inspect per-module `error_log/` folders for runtime issues; avoid dumping raw errors to the browser outside debug work.

## Gotchas

- `accounts/temp/` holds legacy experiments—only copy code from there intentionally into live modules.
- Many endpoints return plain-text status strings (e.g., `Journal saved.`); confirm expected formats before switching a consumer to JSON.
- VAT behavior hinges on `$is_vat_registered`; wrap VAT-specific UI and SQL paths with the same check to avoid PHP notices.
- `accounts_journal.loc_no` must stay sequential per location; keep using the MAX+1 pattern and wrap in transactions if concurrency increases.
- Several assets load from CDNs (Font Awesome, Bootstrap Icons, datepicker); mirror them locally if the deployment needs to run offline.
