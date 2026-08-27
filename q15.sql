-- P1.15: Department Statistics with SELECT INTO
-- Dept Seed: (19 MOD 6 + 1) * 10 = 20
SET SERVEROUTPUT ON;
DECLARE
    v_dept employees.department_id%TYPE := (MOD(19, 6) + 1) * 10;
    v_cnt  NUMBER;
    v_avg  NUMBER(10,2);
    v_max  NUMBER(10,2);
BEGIN
    SELECT COUNT(*), ROUND(AVG(salary), 2), MAX(salary)
    INTO v_cnt, v_avg, v_max
    FROM employees
    WHERE department_id = v_dept;

    DBMS_OUTPUT.PUT_LINE('Department ID  : ' || v_dept);
    DBMS_OUTPUT.PUT_LINE('Total Employees: ' || v_cnt);
    DBMS_OUTPUT.PUT_LINE('Average Salary : Rs. ' || NVL(v_avg, 0));
    DBMS_OUTPUT.PUT_LINE('Maximum Salary : Rs. ' || NVL(v_max, 0));
END;
/
-- Explanation: SELECT INTO with COUNT(*) never throws NO_DATA_FOUND because aggregate
-- functions without a GROUP BY always return exactly one row (COUNT yields 0 for no matches).