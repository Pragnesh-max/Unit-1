-- P1.18: Messy Name Cleaner
SET SERVEROUTPUT ON;
DECLARE
    v_raw   VARCHAR2(100) := '   prAGNeSH    mAKwaNa   ';
    v_clean VARCHAR2(100);
    v_first VARCHAR2(50);
    v_last  VARCHAR2(50);
    v_email VARCHAR2(100);
BEGIN
    -- Double REPLACE ensures multiple spaces collapse to single whitespace
    v_clean := INITCAP(REPLACE(REPLACE(TRIM(v_raw), '   ', ' '), '  ', ' '));
    v_first := SUBSTR(v_clean, 1, INSTR(v_clean, ' ') - 1);
    v_last  := SUBSTR(v_clean, INSTR(v_clean, ' ') + 1);
    v_email := LOWER(v_first || '.' || v_last || '@ljku.edu.in');

    DBMS_OUTPUT.PUT_LINE('Raw String     : [' || v_raw || '] (Length: ' || LENGTH(v_raw) || ')');
    DBMS_OUTPUT.PUT_LINE('Cleaned Name   : ' || v_clean || ' (Length: ' || LENGTH(v_clean) || ')');
    DBMS_OUTPUT.PUT_LINE('First Name     : ' || v_first);
    DBMS_OUTPUT.PUT_LINE('Last Name      : ' || v_last);
    DBMS_OUTPUT.PUT_LINE('College Email  : ' || v_email);
END;
/