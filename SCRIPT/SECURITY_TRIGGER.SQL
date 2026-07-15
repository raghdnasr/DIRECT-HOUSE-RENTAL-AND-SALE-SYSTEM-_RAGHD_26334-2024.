Trigger to prevent database modifications on weekends (Security Rule)
CREATE OR REPLACE TRIGGER trg_prevent_weekend_changes
BEFORE INSERT OR UPDATE OR DELETE ON PROPERTY
DECLARE
    v_day VARCHAR2(15);
BEGIN
    SELECT TO_CHAR(SYSDATE, 'DAY') INTO v_day FROM DUAL;
    -- Note: Weekend days check (Saturday and Sunday)
    IF TRIM(v_day) IN ('SATURDAY', 'SUNDAY') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Database modifications are prohibited on weekends!');
    END IF;
END;
/

Trigger to automatically log price changes in the Audit table
CREATE OR REPLACE TRIGGER trg_audit_property_prices
AFTER UPDATE OF Price ON PROPERTY
FOR EACH ROW
BEGIN
    INSERT INTO PROPERTY_AUDIT (Audit_ID, Property_ID, Old_Price, New_Price, Changed_By, Change_Date)
    VALUES (
        SYS_GUID(), -- Generates a unique secure ID automatically
        :OLD.Property_ID,
        :OLD.Price,
        :NEW.Price,
        USER,
        SYSDATE
    );
END;
/