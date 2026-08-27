-- P1.9: Torrent Power Electricity Bill
-- Units Seed: 19 * 10 + 50 = 240 units
SET SERVEROUTPUT ON;
DECLARE
    v_name     VARCHAR2(50) := 'Pragnesh Makwana';
    v_units    NUMBER := (19 * 10) + 50;
    c_rate     CONSTANT NUMBER := 5;
    c_fixed    CONSTANT NUMBER := 70;
    v_energy   NUMBER(10,2);
    v_total    NUMBER(10,2);
BEGIN
    v_energy := v_units * c_rate;
    v_total := v_energy + c_fixed;

    DBMS_OUTPUT.PUT_LINE('--- TORRENT POWER ELECTRICITY BILL ---');
    DBMS_OUTPUT.PUT_LINE('Consumer Name : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Units Consumed: ' || v_units || ' kWh');
    DBMS_OUTPUT.PUT_LINE('Energy Charge : Rs. ' || v_energy);
    DBMS_OUTPUT.PUT_LINE('Fixed Charge  : Rs. ' || c_fixed);
    DBMS_OUTPUT.PUT_LINE('Total Payable : Rs. ' || v_total);
END;
/