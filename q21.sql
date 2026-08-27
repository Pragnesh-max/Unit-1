-- P1.21: Salary Slip Generator with %ROWTYPE
-- Seed: emp_id = 100 + (19 MOD 20) = 119
SET SERVEROUTPUT ON;
DECLARE
    v_emp employees%ROWTYPE;
    v_id  NUMBER := 100 + MOD(19, 20);
    v_da  NUMBER(10,2);
    v_hra NUMBER(10,2);
    v_pf  NUMBER(10,2);
    v_net NUMBER(10,2);
BEGIN
    SELECT * INTO v_emp FROM employees WHERE employee_id = v_id;

    v_da  := v_emp.salary * 0.40;
    v_hra := v_emp.salary * 0.20;
    v_pf  := v_emp.salary * 0.12;
    v_net := v_emp.salary + v_da + v_hra - v_pf;

    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('               LJKU CORPORATE SALARY SLIP           ');
    DBMS_OUTPUT.PUT_LINE('                   ' || TO_CHAR(SYSDATE, 'Month YYYY'));
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Emp ID   : ' || v_emp.employee_id || ' | Name: ' || v_emp.first_name || ' ' || v_emp.last_name);
    DBMS_OUTPUT.PUT_LINE('Designation: ' || v_emp.job_id);
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE(RPAD('Basic Salary', 28) || ': Rs.' || LPAD(TO_CHAR(v_emp.salary, '99,99,999.00'), 14));
    DBMS_OUTPUT.PUT_LINE(RPAD('Dearness Allowance (40%)', 28) || ': Rs.' || LPAD(TO_CHAR(v_da, '99,99,999.00'), 14));
    DBMS_OUTPUT.PUT_LINE(RPAD('House Rent Allowance (20%)', 28) || ': Rs.' || LPAD(TO_CHAR(v_hra, '99,99,999.00'), 14));
    DBMS_OUTPUT.PUT_LINE(RPAD('Provident Fund (12%)', 28) || ': Rs.' || LPAD(TO_CHAR(v_pf, '99,99,999.00'), 14));
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE(RPAD('Net Pay', 28) || ': Rs.' || LPAD(TO_CHAR(v_net, '99,99,999.00'), 14));
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------');
END;
/