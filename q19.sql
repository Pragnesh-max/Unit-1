-- P1.19: Bank Branch Hierarchy Nested Scope
-- Deposit Seed: 19 * 1000 = 19000 | Branch: Ahmedabad
SET SERVEROUTPUT ON;
<<bank>>
DECLARE
    v_bank_name     VARCHAR2(30) := 'LJ Bank';
    v_total_deposit NUMBER := 0;
BEGIN
    <<branch>>
    DECLARE
        v_branch VARCHAR2(30) := 'Ahmedabad';
        v_dep    NUMBER := 19 * 1000;
    BEGIN
        bank.v_total_deposit := bank.v_total_deposit + v_dep;

        <<counter>>
        DECLARE
            v_token NUMBER := 101;
        BEGIN
            DBMS_OUTPUT.PUT_LINE(bank.v_bank_name || ' | ' || branch.v_branch || ' | Token ' || v_token);
        END counter;

        -- Attempting to run: DBMS_OUTPUT.PUT_LINE(v_token);
        -- Results in PLS-00201: identifier 'V_TOKEN' must be declared (Scope Violation).
    END branch;

    DBMS_OUTPUT.PUT_LINE('Final Total Deposit at ' || v_bank_name || ': Rs. ' || v_total_deposit);
END bank;
/