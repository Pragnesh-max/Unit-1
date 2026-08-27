-- Marks Seed: 19 MOD 30 + 60 = 79
SET SERVEROUTPUT ON;
DECLARE
    v_mark_seed NUMBER := MOD(19, 30) + 60;
    v_m1        NUMBER := v_mark_seed;
    v_m2        NUMBER := v_mark_seed;
    v_m3        NUMBER := v_mark_seed;
    v_m4        NUMBER := v_mark_seed;
    v_m5        NUMBER := NULL; -- Absent
    v_total     NUMBER;
    v_pct       NUMBER(5,2);
    v_passed    BOOLEAN;
BEGIN
    v_total := v_m1 + v_m2 + v_m3 + v_m4 + NVL(v_m5, 0);
    v_pct := ROUND((v_total / 500) * 100, 2);
    v_passed := (v_pct >= 40);

    DBMS_OUTPUT.PUT_LINE('Subject Marks: ' || v_m1 || ', ' || v_m2 || ', ' || v_m3 || ', ' || v_m4 || ', Absent(NULL)');
    DBMS_OUTPUT.PUT_LINE('Total Marks  : ' || v_total || '/500');
    DBMS_OUTPUT.PUT_LINE('Percentage   : ' || v_pct || '%');
    
    -- Oracle Limitation: BOOLEAN data types cannot be printed directly via DBMS_OUTPUT.PUT_LINE.
    -- It requires transformation via CASE or IF.
    DBMS_OUTPUT.PUT_LINE('Status       : ' || CASE WHEN v_passed THEN 'PASS' ELSE 'FAIL' END);
END;
/
