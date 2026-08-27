-- P1.3: Constants, NULL and NVL
-- Base Price Seed: 19 * 500 + 1000 = 10500
SET SERVEROUTPUT ON;
DECLARE
    c_gst_rate CONSTANT NUMBER := 18;
    v_base_price NUMBER := (19 * 500) + 1000;
    v_cgst       NUMBER(10,2);
    v_sgst       NUMBER(10,2);
    v_total      NUMBER(10,2);
    v_city       VARCHAR2(50) := NULL;
BEGIN
    -- Part A: GST Calculation
    v_cgst := v_base_price * (9 / 100);
    v_sgst := v_base_price * (9 / 100);
    v_total := v_base_price + v_cgst + v_sgst;

    DBMS_OUTPUT.PUT_LINE('--- Part A: GST Calculation ---');
    DBMS_OUTPUT.PUT_LINE('Base Price: Rs.' || v_base_price);
    DBMS_OUTPUT.PUT_LINE('CGST (9%): Rs.' || v_cgst);
    DBMS_OUTPUT.PUT_LINE('SGST (9%): Rs.' || v_sgst);
    DBMS_OUTPUT.PUT_LINE('Total Price: Rs.' || v_total);

    -- Part B: NVL vs NVL2
    DBMS_OUTPUT.PUT_LINE('--- Part B: NVL vs NVL2 ---');
    DBMS_OUTPUT.PUT_LINE('NVL Replacement: ' || NVL(v_city, 'Ahmedabad'));
    DBMS_OUTPUT.PUT_LINE('NVL2 Check: ' || NVL2(v_city, 'City Known: ' || v_city, 'City Unknown'));
END;
/