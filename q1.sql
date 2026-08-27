-- P1.1: My First PL/SQL Block
-- Roll No: 19 | Lucky Number Seed: 19 MOD 7 + 1 = 6
SET SERVEROUTPUT ON;
DECLARE
    v_name    VARCHAR2(50) := 'Pragnesh Makwana';
    v_roll_no NUMBER := 19;
    v_message VARCHAR2(100) := 'Welcome to PL/SQL!';
    v_lucky   NUMBER;
BEGIN
    v_lucky := MOD(v_roll_no, 7) + 1;
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Roll No: ' || v_roll_no);
    DBMS_OUTPUT.PUT_LINE('Message: ' || v_message);
    DBMS_OUTPUT.PUT_LINE('Lucky Number: ' || v_lucky);
END;
/
-- Observation: If SET SERVEROUTPUT ON is omitted, the block executes successfully
-- but Oracle suppresses all DBMS_OUTPUT output from the console buffer.