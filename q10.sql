
-- Celsius Seed: 19 MOD 20 + 25 = 44 C
SET SERVEROUTPUT ON;
DECLARE
    v_celsius    NUMBER := MOD(19, 20) + 25;
    v_fahrenheit NUMBER(5,1);
    v_kelvin     NUMBER(5,2);
    v_f_rev      NUMBER := 98.6;
    v_c_rev      NUMBER;
BEGIN
    v_fahrenheit := ROUND(v_celsius * 9 / 5 + 32, 1);
    v_kelvin := v_celsius + 273.15;

    DBMS_OUTPUT.PUT_LINE('Celsius: ' || v_celsius || ' C');
    DBMS_OUTPUT.PUT_LINE('Fahrenheit: ' || v_fahrenheit || ' F');
    DBMS_OUTPUT.PUT_LINE('Kelvin: ' || v_kelvin || ' K');

    -- Reverse Conversion
    v_c_rev := (v_f_rev - 32) * 5 / 9;
    DBMS_OUTPUT.PUT_LINE('Reverse: ' || v_f_rev || ' F = ' || ROUND(v_c_rev, 2) || ' C');

    -- Note on Precedence: C*9/5+32 and C*(9/5)+32 yield the exact same result
    -- because multiplication and division share equal precedence and evaluate left-to-right.
END;
/
