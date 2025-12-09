# accounts_transaction Table Information

The `accounts_transaction` table is the core ledger for all accounting entries in the system. It is designed to be flexible, auditable, and scalable for future business and compliance needs.

## Table Structure (as of 2025-10-30)

| Column              | Type              | Description                                                      |
|---------------------|-------------------|------------------------------------------------------------------|
| tra_id              | INT, PK, AI       | Unique transaction ID                                            |
| tra_date            | DATE              | Transaction date (posting date)                                  |
| location_id         | INT               | Branch or location identifier                                    |
| ca_id               | INT               | Chart of account ID (ledger account)                             |
| cus_sup_id          | INT, NULL         | Customer or supplier ID (if applicable)                          |
| debit               | DECIMAL(15,2)     | Debit amount                                                     |
| credit              | DECIMAL(15,2)     | Credit amount                                                    |
| vat_id              | INT, NULL         | VAT category (if applicable)                                     |
| debit_vat_amount    | DECIMAL(15,2)     | VAT amount on debit side                                         |
| credit_vat_amount   | DECIMAL(15,2)     | VAT amount on credit side                                        |
| vat_filed_status    | TINYINT(1)        | 0 = Not filed, 1 = Filed                                         |
| ref_no              | VARCHAR(50), NULL | Reference number (invoice, bill, etc.)                           |
| source              | VARCHAR(50), NULL | Source module (sales, purchase, etc.)                            |
| source_id           | VARCHAR(50), NULL | Source document ID                                               |
| tra_type            | VARCHAR(50), NULL | Transaction type (manual, system, etc.)                          |
| memo                | TEXT, NULL        | Description or memo                                              |
| posted              | TINYINT(1)        | 0 = Not posted, 1 = Posted to ledger                             |
| approved            | TINYINT(1)        | 0 = Not approved, 1 = Approved                                   |
| approved_by         | INT, NULL         | User ID who approved                                             |
| approved_at         | DATETIME, NULL    | Approval timestamp                                               |
| reversed            | TINYINT(1)        | 0 = Normal, 1 = Reversed                                         |
| reversed_by         | INT, NULL         | User ID who reversed                                             |
| reversed_at         | DATETIME, NULL    | Reversal timestamp                                               |
| created_by          | INT, NULL         | User ID who created                                              |
| updated_by          | INT, NULL         | User ID who last updated                                         |
| created_at          | DATETIME          | Creation timestamp                                               |
| updated_at          | DATETIME          | Last update timestamp                                            |

## Indexes
- `idx_location_date (location_id, tra_date)`
- `idx_ca_id (ca_id)`
- `idx_cus_sup_id (cus_sup_id)`
- `idx_vat_id (vat_id)`

## Usage Notes
- All monetary values are stored as positive numbers; debit/credit logic is handled by the account type.
- The table supports full audit trails (created/updated/approved/reversed by whom and when).
- Designed for extensibility: new columns can be added for future compliance or reporting needs.
- Use `posted`, `approved`, and `reversed` flags to manage transaction workflow and integrity.

## Example Use Cases
- Journal entries, sales, purchases, payments, receipts, adjustments, etc.
- VAT reporting and reconciliation.
- Multi-branch/location accounting.
- Audit and compliance tracking.

---
_Last updated: 2025-10-30_