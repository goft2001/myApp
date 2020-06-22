-- �ܼ��� view ����� EMP_V1
-- �ϳ��� �������̺� ���, �Լ��� �׷� ��� ����, DML ��밡��

DROP VIEW EMP_V1; --�̸� �� ���� ���

--employees ���̺��� �ʿ��� ������ ��� ��� ����
CREATE VIEW EMP_V1
AS 
SELECT employee_id, last_name, email, hire_date, job_id
FROM employees;

--���̺�ó�� select �� ���
select*from emp_v1;
desc emp_v1;


--���̺�ó�� DML ��밡�� (��� ������ ���̺� => ���� ���̺� �Էµ�)
INSERT INTO EMP_V1 (employee_id, last_name, email, hire_date, job_id)
VALUES (333, 'David','DAVID',SYSDATE,'IT_PROG');
--�信 �Էµ� ������ Ȯ��
Select * FROM emp_v1;
SELECT * FROM employees;
DESC employees;
--�����ϱ�
delete from emp_v1
where employee_id = 333;
commit;

CREATE view EMP_V2
AS
SELECT employee_id ������ȣ , last_name �̸�,  email, hire_date, job_id
from employees;

select*from emp_v2;

--����° �� �����
CREATE view EMP_V3(������ȣ, �̸�, �̸���, �������, ����)
AS
SELECT employee_id , last_name,  email, hire_date, job_id
from employees;

select*from emp_v1;
select*from emp_v2;
select*from emp_v3;
select*from employees;



--dml ��� 3��° �信��
insert into emp_v3 ( ������ȣ, �̸�, �̸���, �������, ����)
values (334, 'LaLa', 'LALA', SYSDATE, 'IT_PROG');

--������ �� �����
--�׷��Լ��� ����� ��� DML ��� �Ұ�
-- or replace�� ����Ͽ� ������ ������ �����
CREATE or REPLACE VIEW �μ���_����_����
AS
SELECT department_id �μ���ȣ, COUNT(employee_id) ������ , max(salary) �ְ�޿�, min(salary) �����޿�
        ,round(AVG(salary)) ��ձ޿�
from employees
group by department_id
ORDER BY �μ���ȣ;

select*from �μ���_����_����;

-- �б� ���� �� (�ɼ� with READ ONLY)
CREATe or REPLACE VIEW EMP_V_READ
AS
SELECT employee_id, last_name, email, hire_date,job_id
FROM employees
where department_id = 90
with read only; -- �б� ����

SELECT
    *
FROM emp_v_read;

--DML ���Ұ�
DELETE FROM EMP_V_READ;

--üũ �ɼ� ��
CREATE OR REPLACE VIEW emp_v_check
AS
SELECT employee_id, last_name, email, hire_date,job_id, department_id
FROM employees
where department_id = 90
with CHECK OPTION;   -- WHERE ���� ���ǿ����� ���� �� �Է� ����

SELECT * FROM emp_v_check;
---- üũ �ɼ��϶� 90�� �μ��϶��� �����̳� �Է��� ������.
insert into emp_v_check (employee_id, last_name, email, hire_date, job_id, department_id)
values ( 444, '�˸�', 'ALL', SYSDATE, 'IT_PROG', 90);

