--  ������ �ּ��Դϴ�. ����Ű�� CTRL+/
/*
������ �ּ�
�� �ٴ� ���
*/
-- 1. ���̺��� ��� ��� ���� �о���� : *
SELECT*
FROM departments;
--2 . Ư�� ���� �о����
SELECT department_id, DEPARTMENT_NAME
FROM departments;
--3. ��� ������ ��� ( +,-,*,/)
SELECT employee_id,first_name salary
FROM EMPLOYEES;
SELECT employee_id, first_name, salary, salary+100,
        salary + (salary * 0.1)
from employees;

--4. ��(null)�̶�?
--���� �Էµ��� ����, ��밡������ ����, �˼� ���� ��
--�ΰ��� ����(0) �Ǵ� ����("") ���� �ٸ���.
SELECT LAST_NAME, JOB_ID, SALARY, commission_pct
from employees;

SELECT LAST_NAME, JOB_ID, SALARY, commission_pct, commission_pct+10

from employees;

--5. �ߺ��� �� ���� : distinct

select distinct job_id
from EMPLOYEES;

--���� 1
select employee_id, first_name, last_name
from employees;

--����2
select  first_name, salary, salary*1.1 AS ��������
from employees;

--����3
select employee_id �����ȣ, first_name �̸�, last_name ��
from employees;

--���� ������ (||)
SELECT LAST_NAME || ' is a ' || job_id as "���� ����"
FROM employees;
SELECT employee_id, first_name || ' ' || last_name 
FROM employees;

SELECT employee_id, first_name||' '||last_name, 
        email || '@company.com'
    
FROM employees;

