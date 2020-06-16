--�׷��Լ�

SELECT COUNT(*)
FROM EMPLOYEES; 

SELECT salary
from employees
order by salary desc;


--MAX MIN
SELECT MAX(salary), min(salary)
from employees;

-- ���ڿ��� ����
SELECT MAX(first_name), min(first_name)
from employees;

-- ��¥�� ����

SELECT MAX(hire_date), min(hire_date)

from employees;

--sum,avg : �հ�� ���
select sum(salary),round(avg(salary))
from employees;

--count
select count(*)  -- ���� ���̺��� ��� ���� ����
from employees;

select count(nvl(commission_pct,0)) --null ���� ������ ���� ����
from employees;

select count(department_id)  --null ���� ������ ���� ����
from employees;


select count(distinct department_id)  --�μ��� ����
from employees;

--90�� �μ��� ������ ����
select count(employee_id)
from employees
where department_id = 90;

select avg(commission_pct)  --�ΰ��� ������ ���
from employees;

--group by�� ������ �����Լ� ���

select department_id , round(avg(salary)) ��ձ޿�
from employees
group by department_id;

select department_id �μ���ȣ, job_id ,round(avg(salary)) ��ձ޿�, sum(salary) �ѱ޿��հ�, count(*) �μ����������ο���
from employees
group by department_id, job_id;


-- ���� 1 

select department_id �μ���, count(employee_id) ������ , max(salary) �ִ�޿�, min(salary) �ּұ޿�, 
sum(salary) �޿��հ�, round(avg(salary)) �޿����
from employees
group by department_id 
order by �޿��հ� DESC;

--���� 2

select department_id �μ���ȣ, job_id ����, manager_id ����ȣ, sum(salary) �����հ�, count(*) ������
from employees
group by department_id, job_id, manager_id
order by �μ���ȣ;

--���� 3 

select round (avg(Max(salary))), avg(min(salary))
from employees
group by department_id;


-- Having �� : �׷��Լ��� �̿��� ������
SELECT department_id �μ���ȣ, sum(salary) �޿��հ�
FROM employees
where sum(salary) > 100000
group by department_id
order by department_id;   -- ������

SELECT department_id �μ���ȣ, sum(salary) �޿��հ�
FROM employees
group by department_id
HAVING sum(salary) > 100000
order by department_id;


--���� 1 
select job_id ����, sum(salary) �޿��հ�
from employees
where job_id !='AC_MGR'
group by job_id
having AVG(salary) >10000
order by    �޿��հ� DESC;

--���� 2
select DEPARTMENT_ID �μ���ȣ, round(avg(salary)) ��ձ޿�
from employees
WHERE department_id != 40
group by department_id
Having avg(salary)<7000;


--���� 3
select job_id ����, suM(salary)�޿��հ�
from employees
where job_id not like '%REP%'
group by job_id
Having SUM(SALARY) >=13000
order by �޿��հ� DESC;

