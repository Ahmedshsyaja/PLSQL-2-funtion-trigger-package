CREATE OR REPLACE FUNCTION ARM(NUM1 IN NUMBER)
RETURN NUMBER
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
    RETURN 1;
  ELSE
    RETURN 0;
  END IF;
END;

DECLARE
  result NUMBER := 153;
BEGIN
  result := ARM(result);
  IF result = 1 THEN
    DBMS_OUTPUT.PUT_LINE('Number Is Armstrong');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Number Is not Armstrong');
  END IF;
END;
