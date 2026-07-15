-- 1. USERS Table
CREATE TABLE USERS (
    User_ID NUMBER PRIMARY KEY,
    Full_Name VARCHAR2(100) NOT NULL,
    National_ID VARCHAR2(20) UNIQUE NOT NULL,
    Phone_Number VARCHAR2(15) NOT NULL,
    User_Type VARCHAR2(10) CHECK (User_Type IN ('Owner', 'Buyer'))
);

-- 2. PROPERTY Table
CREATE TABLE PROPERTY (
    Property_ID NUMBER PRIMARY KEY,
    Owner_ID NUMBER REFERENCES USERS(User_ID),
    Location VARCHAR2(100) NOT NULL,
    Price NUMBER(12, 2) NOT NULL,
    Status VARCHAR2(15) DEFAULT 'Available' CHECK (Status IN ('Available', 'Rented', 'Sold'))
);

-- 3. TRANSACTIONS Table
CREATE TABLE TRANSACTIONS (
    Transaction_ID NUMBER PRIMARY KEY,
    Property_ID NUMBER REFERENCES PROPERTY(Property_ID),
    Buyer_ID NUMBER REFERENCES USERS(User_ID),
    Transaction_Date DATE DEFAULT SYSDATE,
    Amount_Paid NUMBER(12, 2) NOT NULL
);