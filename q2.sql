-- P1.2: Variables and Data Types
SET SERVEROUTPUT ON;
DECLARE
    v_name       VARCHAR2(50) := 'Pragnesh Makwana';
    v_marks      NUMBER(5,2) := 415.00;
    v_percentage NUMBER(5,2);
    v_dob        DATE := TO_DATE('22-AUG-2008', 'DD-MON-YYYY');
    v_passed     BOOLEAN;
BEGIN
    v_percentage := ROUND((v_marks / 500) * 100, 2);
    v_passed := (v_percentage >= 40.00);

    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Marks: ' || v_marks || '/500');
    DBMS_OUTPUT.PUT_LINE('Percentage: ' || v_percentage || '%');
    DBMS_OUTPUT.PUT_LINE('DOB: ' || TO_CHAR(v_dob, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Today: ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY'));
    
    IF v_passed THEN
        DBMS_OUTPUT.PUT_LINE('Result: PASS');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Result: FAIL');
    END IF;
END;
/