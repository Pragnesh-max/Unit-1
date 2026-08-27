-- P1.16: Department Lookup with %TYPE
-- Dept Seed: ((19 + 2) MOD 11 + 1) * 10 = 110
SET SERVEROUTPUT ON;
DECLARE
    v_id    departments.department_id%TYPE := (MOD(19 + 2, 11) + 1) * 10;
    v_dname departments.department_name%TYPE;
    v_loc   departments.location_id%TYPE;
BEGIN
    SELECT department_name, location_id
    INTO v_dname, v_loc
    FROM departments
    WHERE department_id = v_id;

    DBMS_OUTPUT.PUT_LINE('Dept ' || v_id || ': ' || v_dname || ' at location ' || v_loc);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Department ID ' || v_id || ' does not exist.');
END;
/
-- Explanation: Using %TYPE binds variable definitions dynamically to the database column dictionary.
-- If the DBA expands department_name to VARCHAR2(60), the PL/SQL engine inherits the new precision
-- at compilation time without altering the source code.