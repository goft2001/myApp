--��������

--Abel �������� �޿��� �� ���� �޴� ������?
--Abel�� �޿� Ȯ��
SELECT salary
FROM employees
WHERE last_name = 'Abel' ; 

--���������� ���
-- ������ �����ڿ��� ����� �����ϴ� (=,>,>,<=,=>,<>,!=)
select *
from employees
where salary> ( SELECT salary
FROM employees
WHERE last_name = 'Abel'  );

select employee_id, last_name, salary
from employees
where salary <= ( SELECT salary
                FROM employees
                WHERE last_name = 'Abel'  );

--������ ���� ���

select employee_id, last_name, salary
from employees
where salary > ( SELECT salary
                FROM employees
                WHERE department_id = 30 );
                
                
-- �׷��Լ��� ���������� �̿�
-- �׷��Լ� ���� max�� ���� ���� �޿��� �޴� ����� �˼�����


select *
from employees
where salary = (SELECT MAX(salary) from employees);


--���� 2 ��� 'Bull'��last_name �� ���� ����� �μ����� Bull���� ���� �޿��� �޴� ������� ����϶�.(�������� ���)

select employee_id ������ȣ, last_name �̸�,department_id �μ���ȣ, salary �޿�
from employees
where department_id = (select department_id
                        from employees
                        where last_name = 'Bull') and
salary >(select salary
                from employees
                where last_name = 'Bull');

--���� 3 
select last_name �̸�, salary �޿�, manager_id
from employees
where manager_id = ( select employee_id from  employees where last_name = 'Russell');

--���� 4
select *
from employees
where job_id = (select job_id from jobs where job_title = 'Stock Manager');



--������ ��������
--������ (in,any,all)
select salary from employees where department_id=90;

--IN
select employee_id, first_name, last_name, salary
from employees
where salary in (select salary from employees where department_id=90); --OR �� ����Ǿ��ٰ� �����ϸ��

-- ANY : �ϳ��� ���Ǹ� �����ص� ��
SELECT EMPLOYEE_id,first_name, last_name, salary
from employees
where salary >= any (select salary from employees where department_id=90);  -- any �� all ���� ��쿡�� �񱳸� ����


--ALL : ��� ������ �����ؾ� ��
-- ANY : �ϳ��� ���Ǹ� �����ص� ��
SELECT EMPLOYEE_id,first_name, last_name, salary
from employees
where salary >= ALL (select salary from employees where department_id=90);  -- any �� all ���� ��쿡�� �񱳸� ����

--���� 1 ) �μ���ȣ(department_id)�� 20���� �������� �Ŵ������̵�(manager_id)�� ���� �Ŵ����� ������ �������� ����϶�.(�� 20�� �μ��� ������ ����!)
SELECT EMPLOYEE_id,first_name, job_id ���� , salary �޿�
from employees
where manager_id IN(select manager_id
                    from employees
                    where department_id =20)
                    AND
                   department_id != 20;

--���� 2) job_id�� 'ST_MAN'�� ������ �� ��� ������ ���ٵ� �޿��� ���� �������� ����϶�(ANY)

select employee_id, last_name, job_id, salary
from employees
where salary >any(select salary from employees where job_id ='ST_MAN');

--���� 3)
select employee_id, last_name, job_id, salary
from employees
where salary < ALL (SELECT salary from employees where job_id = 'IT_PROG');
-- IT_PROG �����߿� ���� ���� �޿����ٵ� ���� �޿��� �޴� ���� ��ȸ


--���߿�-������ ������ ���ƾ���

--���߿� ��������
SELECT employee_id,first_name,job_id,salary,manager_id
FROM employees
where (manager_id , job_id) in(select manager_id , job_id 
                                from employees
                                where first_name = 'Bruce')
    AND first_name !='Bruce' ; 
    
--�μ����� �ּ� �޿��� �޴� ����� �μ���ȣ, �����ȣ, �̸�, �޿����� �˻�
--����1
select department_id �μ���ȣ, employee_id �����ȣ, first_name �̸�, salary �޿�
from employees
where (department_id,salary)  IN (SELECT department_id, MIN(salary)
                                  from employees
                                  group by department_id)
order by department_id;

--����2
select first_name �̸�, job_id, salary, department_id
from employees
where (job_id,salary)  IN (SELECT job_id, MIN(salary)
                                  from employees
                                  group by job_id)
order by salary desc;