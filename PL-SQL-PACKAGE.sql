CREATE OR REPLACE PACKAGE OVER
IS
  PROCEDURE ARM(NUM1 IN NUMBER);
  PROCEDURE FIND_COUNT(num1 IN OUT NUMBER, REM IN OUT NUMBER);
  FUNCTION Minmax(EMP_NO NUMBER) RETURN NUMBER;
END OVER;

CREATE OR REPLACE PACKAGE BODY OVER
IS
  PROCEDURE ARM(NUM1 IN NUMBER)
  IS
    NUM2 NUMBER := 0;
    REM NUMBER := 0;
    RESULT NUMBER := 0;
  BEGIN
    NUM2 := NUM1;
    WHILE NUM2 > 0 LOOP
      REM := MOD(NUM2, 10);
      REM := REM * REM * REM;
      RESULT := RESULT + REM;
      NUM2 := TRUNC(NUM2 / 10);
    END LOOP;
    IF RESULT = NUM1 THEN
      DBMS_OUTPUT.PUT_LINE('Number Is Armstrong ' || NUM1);
    ELSE
      DBMS_OUTPUT.PUT_LINE('Number Is not Armstrong ' || NUM1);
    END IF;
  END ARM;

  PROCEDURE FIND_COUNT(num1 IN OUT NUMBER, REM IN OUT NUMBER)
  IS
    result NUMBER := 0;
  BEGIN
    WHILE num1 > 0 LOOP
      REM := MOD(NUM1, 10);
      result := result * 10;
      result := result + REM;
      num1 := TRUNC(num1 / 10);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('PALINDROME IS ' || RESULT);
    num1 := result;
  END FIND_COUNT;

  FUNCTION Minmax(EMP_NO NUMBER) RETURN NUMBER
  IS
    MIN_V NUMBER;
    MAX_V NUMBER;
  BEGIN
    SELECT MIN(SAL), MAX(SAL)
    INTO MIN_V, MAX_V
    FROM EMP
    WHERE EMPNO = EMP_NO;
    DBMS_OUTPUT.PUT_LINE('The lowest salary of employee ' || EMP_NO || ' is ' || MIN_V);
    DBMS_OUTPUT.PUT_LINE('The highest salary of employee ' || EMP_NO || ' is ' || MAX_V);
    RETURN 0;
  END Minmax;
END OVER;

DECLARE
  param1 NUMBER := 897;
  param2 NUMBER := 5;
  result NUMBER := 7369;
  result1 NUMBER := 153;
BEGIN
  OVER.FIND_COUNT(param1, param2);
  OVER.ARM(result1);
  RESULT := OVER.Minmax(result);
END;
