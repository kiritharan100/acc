# ACC Application Context

## Overview
- PHP/MySQL multi-module app (Accounts, Admin, Reports) served under `c:\xampp\htdocs\acc`. Uses Bootstrap/jQuery UI with custom themes (`assets/`).
- Database connection in `db.php` targets MySQL schema `acc` on localhost; session-handling and client selection are centralized in `header.php` (root) and `accounts/header.php`.
- Device-based login guard lives in `auth.php`/`device_registration.php` using tokens stored in `user_device`; mismatched tokens force logout.

## Key Entry Points
- `index.php`: Home switchboard, checks allocated modules/locations via `user_license` and `user_location`, shows Chrome/Edge warning modal.
- `login.php`: Auth form plus SMS helper (uses smslenz.lk credentials) and session bootstrap.
- `accounts/index.php`: Accounts dashboard (placeholders for KPI/charts) under accounts header/footer.
- `admin/index.php`: Admin dashboard scaffold; other admin pages include `manage_user.php`, `client_list.php`, `setting.php`.

## Accounts Module Highlights
- Header/footer: `accounts/header.php` enforces auth, picks client via `client_cook`, provides date helpers; `accounts/footer.php` wires jQuery UI, Select2, datepicker, export, and form “processing…” UX.
- COA: `accounts/new_chart_of_accounts.php` with AJAX handler `accounts/ajax/chart_of_accounts_handler.php`; VAT and contacts fetched via supporting AJAX scripts.
- Accounting periods: `accounts/accounting_periods.php` with CRUD/lock endpoints in `accounts/ajax_accounting_period/`.
- Journals: `accounts/journal/save_journal.php`, `get_journal_details.php`, `delete_journal.php`, `restore_journal.php`.
- Master data: `accounts/manage_customer.php`, `accounts/manage_supplier.php`.
- Legacy/experimental: `accounts/temp/` contains older ledgers, P&L, day-end, credit sales, etc.

## Admin/Reports
- `admin/`: client/user management, user log report, settings; mirrors accounts header/footer pattern.
- `reports/`: legacy reporting pages (sales monthly, user logs, etc.).

## Database Snapshot (from `schema_with_data.sql`)
- Core tables: `accounts_transaction` (ledger with debit/credit, VAT amounts, audit flags), `accounts_journal` + `accounts_journal_detail` (batches/lines), `accounts_coa_main` (629 seeded accounts), `accounts_coa_category` (139 category definitions), `accounts_coa_client` (client-specific accounts), `accounts_accounting_period` (period ranges with lock flag), `accounts_vat_cat` (VAT options).
- Contacts: `accounts_manage_customer` (24 rows), `accounts_manage_supplier` (7 rows).
- Security/session: `user_license` (module flags, passwords, tokens), `user_location`, `user_device` (device tokens), `login_attempts`, `user_log` (1830 entries).
- Client/company: `client_registration` (3 rows) + backup; `letter_head` holds org info; `product_master` seeded list.
- Legacy acc_* tables (cheque/receipt/customer_payment/transaction) appear alongside the newer `accounts_*` set.

## Utilities
- `db_copy.php` regenerates `schema.sql` (structure) and `schema_with_data.sql` (structure + inserts) by introspecting the live DB.
- Schema-only copy: `schema.sql`; ledger column notes: `information.md`.
- Config hints: `Config.txt` lists seed expectations for product/pump/operator data.

## Security Notes
- SMS API credentials are hard-coded in `login.php` and `auth.php` (smslenz.lk); rotate/remove for production.
- Auth depends on matching device token cookie (`ACC{user_id}`) with `user_device.token`; mismatch redirects to login with `multiple_sign_in`.

### URL Signing (HMAC-SHA256)
- Defined globally in `main_functions.php` with `URL_SIGN_SECRET` (set this to a strong random string).
- `generate_signed_url($baseUrl, array $params)` sorts params, builds a query string, computes `hash_hmac('sha256', ...)`, and appends `&sig=...`.
- `verify_signed_request(array $request)` extracts `sig`, recalculates the HMAC, and compares via `hash_equals`; returns true/false.
- Example: `$url = generate_signed_url('/accounts/journal/journal_pdf.php', ['id' => 25]);`  
  On target: `if (!verify_signed_request($_GET)) { http_response_code(400); exit('Invalid signature'); } $id = (int)($_GET['id'] ?? 0);`
- `accounts/journal/journal_pdf.php` now requires a valid signature; `accounts/journal/get_journal_details.php` returns `pdf_url` pre-signed for the modal link in `journal_entry.php`.

## Quick Paths
- Root UI: `index.php`, `header.php`, `footer.php`
- Accounts UI: `accounts/index.php`, `accounts/header.php`, `accounts/footer.php`
- Admin UI: `admin/index.php`
- DB dumps: `schema.sql`, `schema_with_data.sql`
