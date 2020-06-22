-- ���տ�����(UNION �� ) 

-- UNION : ������ �ߺ� ����
SELECT employee_id, job_id
from employees
UNION
select employee_id, job_id
from job_history;

-- UNION ALL : ������
SELECT employee_id, job_id
from employees
UNION ALL
select employee_id, job_id
from job_history;


-- INTERSECT : ������
SELECT employee_id, job_id
from employees
INTERSECT
select employee_id, job_id
from job_history;

-- MINUS : ������
SELECT employee_id, job_id
from employees
MINUS
select employee_id, job_id
from job_history;

-- ���� ) employees ���̺��� department_id ���հ� departments ���̺��� department_id ������ UNION �����ڸ� �̿��� ���� ������.

SELECT department_id 
FROM employees
union ALL
SELECT department_id
FROM departments;

--���� 2 ) employees ���̺��� department_id ���հ� departments ���̺��� department_id ������ �������� INTERSECT �����ڸ� �̿��� ����� ������
select department_id
from employees
intersect
select department_id
from departments;

--���� 3 departments ���̺��� department_id ���տ��� employees ���̺��� department_id ������ MINUS �����ڸ� �̿��� �� ������

select department_id
from departments
MINUS
select department_id
from employees;