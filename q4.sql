-- P1.4: SELECT INTO - Employee Data Fetcher
-- Valid ID Seed: 100 + (19 MOD 7) = 105 | Invalid ID Seed: 19
SET SERVEROUTPUT ON;
DECLARE
    v_fname employees.first_name%TYPE;
    v_sal   employees.salary%TYPE;
    v_id    NUMBER := 100 + MOD(19, 7);
BEGIN
    -- Test Valid ID
    SELECT first_name, salary INTO v_fname, v_sal
    FROM employees
    WHERE employee_id = v_id;

    DBMS_OUTPUT.PUT_LINE('Employee: ' || v_fname || ' earns Rs. ' || v_sal || ' per month.');

    -- Test Non-Existent ID
    v_id := 19;
    SELECT first_name, salary INTO v_fname, v_sal
    FROM employees
    WHERE employee_id = v_id;

    DBMS_OUTPUT.PUT_LINE('Employee: ' || v_fname || ' earns Rs. ' || v_sal || ' per month.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found check the ID: ' || v_id);
END;
/