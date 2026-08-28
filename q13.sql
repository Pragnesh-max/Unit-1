-- Amount Seed: 19 * 137 + 1000 = 3603
SET SERVEROUTPUT ON;
DECLARE
    v_amt   NUMBER := (19 * 137) + 1000;
    v_rem   NUMBER;
    v_n500  NUMBER;
    v_n200  NUMBER;
    v_n100  NUMBER;
BEGIN
    v_n500 := TRUNC(v_amt / 500);
    v_rem  := MOD(v_amt, 500);

    v_n200 := TRUNC(v_rem / 200);
    v_rem  := MOD(v_rem, 200);

    v_n100 := TRUNC(v_rem / 100);
    v_rem  := MOD(v_rem, 100);

    DBMS_OUTPUT.PUT_LINE('Withdrawal Amount: Rs. ' || v_amt);
    DBMS_OUTPUT.PUT_LINE('Rs. 500 Notes    : ' || v_n500);
    DBMS_OUTPUT.PUT_LINE('Rs. 200 Notes    : ' || v_n200);
    DBMS_OUTPUT.PUT_LINE('Rs. 100 Notes    : ' || v_n100);
    DBMS_OUTPUT.PUT_LINE('Undispensed Cash : Rs. ' || v_rem);
END;
/
