-- 1. INSERT INTO USERS
INSERT INTO USERS (User_ID, Full_Name, National_ID, Phone_Number, User_Type) 
VALUES (101, 'Ahmed Ali', '1234567890', '+250788111222', 'Owner');

INSERT INTO USERS (User_ID, Full_Name, National_ID, Phone_Number, User_Type) 
VALUES (102, 'Fatima Omar', '1234567891', '+250788333444', 'Owner');

INSERT INTO USERS (User_ID, Full_Name, National_ID, Phone_Number, User_Type) 
VALUES (201, 'John Doe', '1234567892', '+250788555666', 'Buyer');

INSERT INTO USERS (User_ID, Full_Name, National_ID, Phone_Number, User_Type) 
VALUES (202, 'Sarah Smith', '1234567893', '+250788777888', 'Buyer');


-- 2. INSERT INTO PROPERTY
INSERT INTO PROPERTY (Property_ID, Owner_ID, Location, Price, Status) 
VALUES (501, 101, 'Kigali, Nyarugenge', 150000, 'Available');

INSERT INTO PROPERTY (Property_ID, Owner_ID, Location, Price, Status) 
VALUES (502, 102, 'Kigali, Gasabo', 85000, 'Available');

INSERT INTO PROPERTY (Property_ID, Owner_ID, Location, Price, Status) 
VALUES (503, 101, 'Kigali, Kicukiro', 120000, 'Available');


-- 3. INSERT INTO PROPERTY_TRANSACTIONS
INSERT INTO PROPERTY_TRANSACTIONS (Transaction_ID, Property_ID, Buyer_ID, "Date", Amount_Paid) 
VALUES (901, 501, 201, TO_DATE('2026-07-10', 'YYYY-MM-DD'), 150000);

INSERT INTO PROPERTY_TRANSACTIONS (Transaction_ID, Property_ID, Buyer_ID, "Date", Amount_Paid) 
VALUES (902, 502, 202, TO_DATE('2026-07-14', 'YYYY-MM-DD'), 85000);


-- 4. INSERT INTO PROPERTY_AUDIT
INSERT INTO PROPERTY_AUDIT (Audit_ID, Property_ID, Old_Price, New_Price, Changed_By, Change_Date) 
VALUES (1, 501, 140000, 150000, 'ADMIN', TO_DATE('2026-07-09', 'YYYY-MM-DD'));

INSERT INTO PROPERTY_AUDIT (Audit_ID, Property_ID, Old_Price, New_Price, Changed_By, Change_Date) 
VALUES (2, 502, 80000, 85000, 'ADMIN', TO_DATE('2026-07-13', 'YYYY-MM-DD'));