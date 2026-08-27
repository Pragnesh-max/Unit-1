-- P1.14: Mobile Recharge Receipt
-- Index Seed: 19 MOD 4 + 1 = 4 -> Price: 599
SET SERVEROUTPUT ON;
DECLARE
    c_gst     CONSTANT NUMBER := 18;
    v_plan    NUMBER := 599;
    v_gst_amt NUMBER(8,2);
    v_total   NUMBER(8,2);
BEGIN
    v_gst_amt := v_plan * (c_gst / 100);
    v_total := v_plan + v_gst_amt;

    DBMS_OUTPUT.PUT_LINE('===================================');
    DBMS_OUTPUT.PUT_LINE('       RECHARGE RECEIPT (JIO)      ');
    DBMS_OUTPUT.PUT_LINE('===================================');
    DBMS_OUTPUT.PUT_LINE(RPAD('Plan Name:', 16) || 'Unlimited 5G Data');
    DBMS_OUTPUT.PUT_LINE(RPAD('Base Price:', 16) || 'Rs. ' || TO_CHAR(v_plan, '99,999.99'));
    DBMS_OUTPUT.PUT_LINE(RPAD('GST @ 18%:', 16) || 'Rs. ' || TO_CHAR(v_gst_amt, '99,999.99'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Total Payable:', 16) || 'Rs. ' || TO_CHAR(v_total, '99,999.99'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Valid Upto:', 16) || TO_CHAR(SYSDATE + 28, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('===================================');
END;
/