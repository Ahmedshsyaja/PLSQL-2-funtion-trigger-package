CREATE OR REPLACE FUNCTION FIND_COUNT(num1 IN OUT NUMBER, REM IN OUT NUMBER)
RETURN NUMBER
IS
  result NUMBER := 0;
BEGIN
  WHILE num1 > 0 LOOP
    REM := MOD(num1, 10);
    result := result * 10;
    result := result + REM;
    num1 := TRUNC(num1 / 10);
  END LOOP;
  RETURN result;
END;

DECLARE
  param1 NUMBER := 897;
  param2 NUMBER := 5;
  result NUMBER;
BEGIN
  result := FIND_COUNT(param1, param2);
  DBMS_OUTPUT.PUT_LINE('Palindrome ' || result);
END;
