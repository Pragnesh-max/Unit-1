-- P1.23: Debug Challenge - Fix the Broken Block
-- Salary Seed: 19 * 1000 + 20000 = 39000
SET SERVEROUTPUT ON;
DECLARE
    -- BUG 1 FIXED: Replaced assignment '=' with ':='
    -- BUG 2 FIXED: Expanded VARCHAR2(5) to VARCHAR2(50) to prevent ORA-06502 buffer overflow
    v_name VARCHAR2(50) := 'Pragnesh Makwana';

    -- BUG 3 FIXED: CONSTANT must be initialized at declaration time
    c_bonus_rate CONSTANT NUMBER := 0.10;

    -- BUG 4 FIXED: Appended missing semicolon at the end of variable declaration
    v_sal NUMBER := (19 * 1000) + 20000;
    v_bonus NUMBER;

    -- BUG 5 FIXED: Added 'INTO v_fname' variable for PL/SQL SELECT query
    v_fname employees.first_name%TYPE;
BEGIN
    v_bonus := v_sal * c_bonus_rate;

    SELECT first_name INTO v_fname
    FROM employees
    WHERE employee_id = 100;

    DBMS_OUTPUT.PUT_LINE('Student Name : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Fetched Emp  : ' || v_fname);
    DBMS_OUTPUT.PUT_LINE('Calculated Bonus: Rs. ' || v_bonus);
END;
/