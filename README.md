# DIRECT-HOUSE-RENTAL-AND-SALE-SYSTEM-_RAGHD_26334-2024.
# DirectHouse_DB 🏠

A secure, automated, and fully normalized Oracle Database Management System designed to connect property owners directly with buyers, eliminating informal brokers, reducing transaction costs, and ensuring complete data transparency.

---

## 📌 Project Overview
*DirectHouse_DB* is a real estate database solution built using *Oracle SQL & PL/SQL*. The system focuses on database normalization (3NF), robust transactional integrity, and advanced security auditing to prevent unauthorized data manipulation and track price fluctuations.

---

## ⚙️ Key Features

### 1. Database Normalization (3NF)
The schema is strictly designed under the *Third Normal Form (3NF)* to eliminate redundancy and maintain data integrity across all entities.

### 2. Advanced PL/SQL Automation
* *Stored Procedures:* Automated update of property availability and statuses once a transaction is successfully processed.
* *Stored Functions:* Safe financial calculations (e.g., total payments) with built-in *Exception Handling* to prevent runtime failures.

### 3. Database Security & Auditing (Triggers)
* *Weekend Security Block (trg_prevent_weekend_changes):* Prevents any DDL/DML modifications during weekends (Saturdays & Sundays) to enforce strict business hour policies.
* *Price Audit Trail (trg_audit_property_prices):* Automatically tracks price modifications by logging the Old_Price, New_Price, the user who made the change (Changed_By), and the timestamp into the dedicated PROPERTY_AUDIT table.

---

## 📊 Database Schema (ERD)

The database consists of 4 main tables:

1. *USERS*: Stores system users (Owners, Buyers, Admins).
2. *PROPERTY*: Contains property details, linked to owners.
3. *PROPERTY_TRANSACTIONS*: Records purchase and rent history.
4. *PROPERTY_AUDIT*: An independent logging table populated automatically via database triggers.

### Entity Relationship Summary:
* USERS (1) <---> (M) PROPERTY
* PROPERTY (1) <---> (M) PROPERTY_TRANSACTIONS
* USERS (1) <---> (M) PROPERTY_TRANSACTIONS

---

## 🚀 How to Run the Scripts

1. *Create Tables & Schema:* Run the DDL scripts to generate tables with their primary and foreign key constraints.
2. *Insert Sample Data:* Populate the database with test data.
3. *Compile PL/SQL Objects:* Compile the stored Procedures, Functions, and Triggers in your Oracle SQL Developer / SQL*Plus environment.
4. *Test Security Triggers:* Try modifying property prices on a weekend to test the security trigger restrictions, or update a price to see the audit trail in action.

---

## 🛠️ Tech Stack
* *Database Engine:* Oracle Database
* *Languages:* SQL, PL/SQL
* *Tools:* SQL Server Management Studio / Oracle SQL Developer / Command Line
