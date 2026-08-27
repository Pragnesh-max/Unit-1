-- P1.6: Bank Interest Calculator - SI and CI
-- P = 19 * 1000 = 19000 | Rate = 8 * 0.5 + 4 = 8.0% | Years = 3
SET SERVEROUTPUT ON;
DECLARE
    v_p        NUMBER := 19 * 1000;
    v_r        NUMBER := (8 * 0.5) + 4;
    v_t        NUMBER := 3;
    v_si       NUMBER(12,2);
    v_ci       NUMBER(12,2);
    v_amt_si   NUMBER(12,2);
    v_amt_ci   NUMBER(12,2);
    v_diff_pct NUMBER(8,2);
BEGIN
    v_si := (v_p * v_r * v_t) / 100;
    v_amt_si := v_p + v_si;

    v_amt_ci := v_p * POWER((1 + v_r / 100), v_t);
    v_ci := v_amt_ci - v_p;

    v_diff_pct := ((v_ci - v_si) / v_si) * 100;

    DBMS_OUTPUT.PUT_LINE('Principal       : Rs. ' || TO_CHAR(v_p, '99,99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Rate of Interest: ' || v_r || '% for ' || v_t || ' Years');
    DBMS_OUTPUT.PUT_LINE('Simple Interest : Rs. ' || TO_CHAR(v_si, '99,99,999.00') || ' | Total: Rs. ' || TO_CHAR(v_amt_si, '99,99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Compound Interest: Rs. ' || TO_CHAR(v_ci, '99,99,999.00') || ' | Total: Rs. ' || TO_CHAR(v_amt_ci, '99,99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Difference (CI vs SI): ' || v_diff_pct || '%');

    IF v_diff_pct > 10 THEN
        DBMS_OUTPUT.PUT_LINE('Tip: FD is better than savings account for this amount.');
    END IF;
END;
/