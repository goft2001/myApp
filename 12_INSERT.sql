--day 6






--DML �۾� : �����ͺ��̽��� �����͸� �Է�, ����, �����ϴ� ��ɾ��̴�.
--�����ͺ��̽��� ������ �����ϴ� �۾��� ���������� ���Ǳ�� �����ؾ� �Ѵ�.

--INSERT: �� ���� �Է��ϱ�
--1. ������ ���� ���������� Ȯ�� (DESC + ���̺�)
DESC departments;   --describe ���� (���)


--��ü ���� �� �Է��ϴ� ��� 1
INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES ( 71, '���ߺ� 1', 100, 1700);

SELECT *
FROM departments;

commit;

--���� �̸��� ���� ��� ��ü ���� �� �Է��ؾ� ��
INSERT INTO departments
VALUES (72, '���ߺ� 2', 100, 1700);

COMMIT;

--���� ������ �ٲܰ��
INSERT INTO departments (department_name, manager_id, locations_id, department_id)
VALUES ('���ߺ� 3', 100, 1700, 73);

COMMIT;


--�ڵ����� �ΰ� �Է�
INSERT INTO departments (department_id, department_name )
VALUES (74, '���ߺ� 4');
COMMIT;
DESC departments;


--SYSDATE ���� ��¥ �Է�
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES (1, '�浿', 'ȫ', 'hong@naver.com', SYSDATE, 'IT_PROG');
COMMIT;

SELECT*
FROM employees;

DESC employees;


--��¥ �Է��ϱ�
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES (2, '�浿', '��', 'kang@naver.com', TO_DATE('2020-04-05','YYYY-MM-DD'), 'IT_PROG');
COMMIT;


--����ڷκ��� �����Է¹ޱ�
INSERT INTO department (department_id, department_name )
VALUES (&id, '&name');  -- 75 ���ߺ� 5
COMMIT;


--���̺� �����
CREATE TABLE XX_EMP (
    EMPNO NUMBER,
    ENAME VARCHAR2(100),
    SAL    NUMBER);
 
--���̺� ��ü�� ī���ؼ� �Է��ϴ� ���    
INSERT INTO XX_EMP (EMPNO, ENAME, SAL)
SELECT employee_id, first_name, salary
FROM employees;


-- INSERT�� �����߿� ������ ���� ���
-- �⺻Ű�� �̹� �ִ� (�ߺ���) ���� �Է��� ���
INSERT INTO departments (department_id, department_name, manager_id, locatoin_id )
VALUES (10, '���ߺ� 10', 100, 1700); 


--2 FK(�ܷ�Ű)�� �������� ���� ���� �Է�
INSERT INTO departments (department_id, department_name, manager_id, locatoin_id )
VALUES (5, '���ߺ� 5', 100, 1); 


--3 �������� ������ �ٸ���
INSERT INTO departments (department_id, department_name, manager_id, locatoin_id )
VALUES (5, '���ߺ� 5', 100, 'D1'); 

INSERT INTO copy_dept (department_id, department_name, manager_id, location_id)
VALUES (5, '���ߺ� 5', 100, 10);


--4 �������� ����� ���� ������
INSERT INTO departments (department_id, department_name, manager_id, locatoin_id )
VALUES (5, '���ߺ� 5���ߺ� 5���ߺ� 5���ߺ� 5���ߺ� 5���ߺ� 5���ߺ� 5���ߺ� 5', 100, 'D1'); 


--5 ���̺��� ī���ϱ�
CREATE TABLE COPY_DEPT
AS
SELECT * FROM departments;


--����1)
-- departments ���̺� ������ ���� ������ depatment_id, department_name,
--manager_id�� 200, location_id�� 1700�� ���� 3�� �Է��ϼ���.
INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (271, 'Sample Dept 1', 200, 1700);

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (272, 'Sample Dept 2', 200, 1700);

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (273, 'Sample Dept 3', 200, 1700);
COMMIT;


--����2)
--�Ʒ��� ���� ���̺��� ������ SELECT���� �̿��Ͽ� departments ���̺� ������ ���� �Է��Ͻÿ�.
CREATE TABLE copy_departments ( department_id number(4,0),
                                department_name varchar2(30 byte),
                                manager_id number(6,0),
                                location_id number(4,0));
                            
INSERT INTO copy_departments
SELECT * FROM departments;












