-- P1.22: Kirana Store Bill with NULL Coupon
-- Qty Seed: 19 MOD 5 + 2 = 6 | Price Seed: 19 * 100 + 400 = 2300
SET SERVEROUTPUT ON;
DECLARE
    v_qty      NUMBER := MOD(19, 5) + 2;
    v_price    NUMBER := (19 * 100) + 400;
    v_coupon   NUMBER := NULL; -- Run 1: NULL, Run 2: Set to 10
    v_gross    NUMBER(10,2);
    v_disc     NUMBER(10,2);
    v_taxable  NUMBER(10,2);
    v_cgst     NUMBER(10,2);
    v_sgst     NUMBER(10,2);
    v_total    NUMBER(10,2);
BEGIN
    v_gross   := v_qty * v_price;
    v_disc    := v_gross * NVL(v_coupon, 0) / 100;
    v_taxable := v_gross - v_disc;
    v_cgst    := v_taxable * 0.09;
    v_sgst    := v_taxable * 0.09;
    v_total   := ROUND(v_taxable + v_cgst + v_sgst);

    DBMS_OUTPUT.PUT_LINE('------------------------------------');
    DBMS_OUTPUT.PUT_LINE('          KIRANA STORE BILL         ');
    DBMS_OUTPUT.PUT_LINE('------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Quantity  : ' || v_qty || ' @ Rs. ' || v_price);
    DBMS_OUTPUT.PUT_LINE('Gross Amt : Rs. ' || v_gross);
    DBMS_OUTPUT.PUT_LINE('Status    : ' || NVL2(v_coupon, 'Coupon Applied: ' || v_coupon || '%', 'No Coupon Applied'));
    DBMS_OUTPUT.PUT_LINE('Discount  : Rs. ' || v_disc);
    DBMS_OUTPUT.PUT_LINE('Taxable   : Rs. ' || v_taxable);
    DBMS_OUTPUT.PUT_LINE('CGST (9%) : Rs. ' || v_cgst);
    DBMS_OUTPUT.PUT_LINE('SGST (9%) : Rs. ' || v_sgst);
    DBMS_OUTPUT.PUT_LINE('Net Total : Rs. ' || v_total);
    DBMS_OUTPUT.PUT_LINE('------------------------------------');
END;
/