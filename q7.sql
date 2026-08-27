-- P1.7: Nested Blocks - Scope Explorer
SET SERVEROUTPUT ON;
<<outer_blk>>
DECLARE
    v_city VARCHAR2(30) := 'Ahmedabad';
    v_num  NUMBER := 100;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Outer Block -> City: ' || v_city || ', Num: ' || v_num);
    
    <<middle_blk>>
    DECLARE
        v_city VARCHAR2(30) := 'Ahmedabad';
        v_num  NUMBER := 200;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Middle Block -> City (Shadowed): ' || v_city || ', Num: ' || v_num);
        
        <<inner_blk>>
        DECLARE
            v_num NUMBER := 300;
        BEGIN
            DBMS_OUTPUT.PUT_LINE('Inner Block -> Num: ' || v_num);
            DBMS_OUTPUT.PUT_LINE('Accessing Outer from Inner -> City: ' || outer_blk.v_city || ', Num: ' || outer_blk.v_num);
        END inner_blk;
    END middle_blk;

    DBMS_OUTPUT.PUT_LINE('Back in Outer Block -> City: ' || v_city || ' (Unchanged)');
END outer_blk;
/