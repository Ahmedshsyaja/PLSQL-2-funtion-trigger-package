CREATE OR REPLACE PROCEDURE Minmax(EMP_NO NUMBER)
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
END;

BEGIN
  Minmax(7369);
END;
