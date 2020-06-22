--day6



--DELETE ������ ����
-- WHERE ���� ���ǿ� �ش��ϴ� ������� �����͸� �����Ѵ�
-- ���̺��� �����ص� ���̺��� �������� ������ ������ �ʴ´�.

--71��~75�� �μ���ȣ ����
DELETE FROM departments
WHERE department_id BETWEEN 71 AND 75;
COMMIT;


--employees ���̺� id 1�� 2�� ����
DELETE FROM employees
WHERE employee_id IN (1, 2);
COMMIT;


--���̺� ��ü ���� : ���̺��� �״�� �ְ� �����͸� ���� ( ROLLBACK ����)
DELETE FROM copy_departments;
ROLLBACK;


--TRUNCATE : ��ü ����(ROLLBACK �Ұ���)
TRUNCATE TABLE copy_departments;
ROLLBACK;


--DROP TABLE : ���̺� ����
DROP TABLE copy_departments;
DROP TABLE copy_dept;
DROP TABLE xx_emp;


--SAVE POINT(���̺� ����Ʈ) : �߰����� (ROLLBACK TO SAVEPOINT�ϸ� savepoint ���·� ���ƿ�)
SELECT * FROM copy_emp
WHERE employee_id = 108;  --salary 12008

UPDATE copy_emp
SET salary = salary + 10
WHERE employee_id = 108;
-- salary ���� 12018
-- ���̺� ����Ʈ �����
SAVEPOINT A;


UPDATE copy_emp
SET salary = salary + 20
WHERE employee_id = 108;


--���̺�����Ʈ�� �ѹ�
ROLLBACK TO SAVEPOINT A;
--salary ���� 12018
--�ѹ�
ROLLBACK;

COMMIT;




