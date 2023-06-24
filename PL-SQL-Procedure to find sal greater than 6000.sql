CREATE OR REPLACE PROCEDURE display_employee_info(EMP_NO NUMBER)
IS
BEGIN
  FOR emp IN (SELECT * FROM EMP WHERE ENAME LIKE '%A%' AND SAL > 60000) LOOP
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp.EMPNO);
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || emp.ENAME);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || emp.SAL);
    DBMS_OUTPUT.NEW_LINE;
  END LOOP;
END;

BEGIN
  display_employee_info(1000);
END;
