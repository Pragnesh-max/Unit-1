-- P1.20: Railway PNR and Ticket Generator
-- Roll: 19 | Base Fare: 19 * 50 + 200 = 1150 | Journey Offset: 19 MOD 30 + 1 = 20 days
SET SERVEROUTPUT ON;
DECLARE
    v_name       VARCHAR2(50) := 'Pragnesh Makwana';
    v_roll       NUMBER := 19;
    v_dob        DATE := TO_DATE('22-AUG-2008', 'DD-MON-YYYY');
    v_pnr        VARCHAR2(20);
    v_jdate      DATE;
    v_fare       NUMBER(10,2);
    v_age        NUMBER;
    v_final_fare NUMBER(10,2);
BEGIN
    v_pnr   := 'GJ' || TO_CHAR(SYSDATE, 'YYMM') || LPAD(v_roll, 4, '0');
    v_jdate := SYSDATE + (MOD(v_roll, 30) + 1);
    v_fare  := (v_roll * 50) + 200;
    v_age   := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);

    IF v_age >= 60 THEN
        v_final_fare := v_fare * 0.60;
    ELSE
        v_final_fare := v_fare;
    END IF;

    DBMS_OUTPUT.PUT_LINE('==================================================');
    DBMS_OUTPUT.PUT_LINE('            INDIAN RAILWAYS E-TICKET              ');
    DBMS_OUTPUT.PUT_LINE('==================================================');
    DBMS_OUTPUT.PUT_LINE(RPAD('PNR Number', 18) || ': ' || v_pnr);
    DBMS_OUTPUT.PUT_LINE(RPAD('Passenger Name', 18) || ': ' || v_name);
    DBMS_OUTPUT.PUT_LINE(RPAD('Age / Category', 18) || ': ' || v_age || ' yrs / ' || CASE WHEN v_age >= 60 THEN 'Senior Citizen' ELSE 'General' END);
    DBMS_OUTPUT.PUT_LINE(RPAD('Journey Date', 18) || ': ' || TO_CHAR(v_jdate, 'Day, DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Base Fare', 18) || ': Rs. ' || TO_CHAR(v_fare, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Payable Fare', 18) || ': Rs. ' || TO_CHAR(v_final_fare, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('==================================================');
END;
/