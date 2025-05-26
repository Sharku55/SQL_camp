CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10) RETURNS TABLE (number integer) AS $$
DECLARE 
    fib1 integer := 0;
    fib2 integer := 1;
BEGIN
    number := fib1;
    RETURN NEXT;
    number := fib2;
    RETURN NEXT;

    WHILE number < pstop LOOP
        number := fib1 + fib2;
        fib1 := fib2;
        fib2 := number;

        IF number < pstop THEN 
            RETURN NEXT;
        END IF;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
