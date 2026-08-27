-- P1.8: Student ID Card Generator
SET SERVEROUTPUT ON;
DECLARE
    v_full_name  VARCHAR2(50) := 'Pragnesh Makwana';
    v_roll_no    NUMBER := 19;
    v_dob        DATE := TO_DATE('22-08-2008', 'DD-MM-YYYY');
    v_upper_name VARCHAR2(50);
    v_first_name VARCHAR2(30);
    v_id_card    VARCHAR2(30);
    v_age        NUMBER;
    v_disp_name  VARCHAR2(50);
BEGIN
    v_upper_name := UPPER(v_full_name);
    v_first_name := SUBSTR(v_upper_name, 1, INSTR(v_upper_name, ' ') - 1);
    v_id_card := 'LJICA' || TO_CHAR(v_dob, 'YYYY') || LPAD(v_roll_no, 3, '0');
    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);

    IF LENGTH(v_upper_name) > 20 THEN
        v_disp_name := SUBSTR(v_upper_name, 1, INSTR(v_upper_name, ' ')) || SUBSTR(v_upper_name, INSTR(v_upper_name, ' ') + 1, 1) || '.';
    ELSE
        v_disp_name := v_upper_name;
    END IF;

    DBMS_OUTPUT.PUT_LINE('+----------------------------------------+');
    DBMS_OUTPUT.PUT_LINE('|      LJICA STUDENT IDENTITY CARD       |');
    DBMS_OUTPUT.PUT_LINE('+----------------------------------------+');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('Student ID', 14) || ': ' || RPAD(v_id_card, 22) || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('Name', 14) || ': ' || RPAD(v_disp_name, 22) || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('First Name', 14) || ': ' || RPAD(v_first_name, 22) || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('DOB', 14) || ': ' || RPAD(TO_CHAR(v_dob, 'DD-MON-YYYY'), 22) || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('Age', 14) || ': ' || RPAD(TO_CHAR(v_age) || ' Years', 22) || ' |');
    DBMS_OUTPUT.PUT_LINE('+----------------------------------------+');
END;
/