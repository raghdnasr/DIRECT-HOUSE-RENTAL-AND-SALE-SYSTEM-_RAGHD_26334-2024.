Procedure to update property status to 'Sold' after transaction
CREATE OR REPLACE PROCEDURE update_property_status (
    p_property_id IN INT,
    p_new_status IN VARCHAR2
) AS
BEGIN
    UPDATE PROPERTY
    SET Status = p_new_status
    WHERE Property_ID = p_property_id;
    COMMIT;
END;
/

-- 2. Function with Exception Handling to get total payments for a buyer
CREATE OR REPLACE FUNCTION get_total_payments (
    p_buyer_id IN INT
) RETURN NUMBER AS
    v_total NUMBER(10,2) := 0;
BEGIN
    SELECT SUM(Amount_Paid)
    INTO v_total
    FROM PROPERTY_TRANSACTIONS
    WHERE Buyer_ID = p_buyer_id;
    
    IF v_total IS NULL THEN
        v_total := 0;
    END IF;
    
    RETURN v_total;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred.');
        RETURN -1;
END;
/