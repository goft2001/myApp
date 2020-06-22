--����
select e.employee_id, e.department_id, d.department_name
from employees e
join departments d
on e.department_id = d.department_id;  --������ ��ġ��, on �����ٰ� �⺻Ű �ܷ�Ű ��ġ�Ǵ� �� ������.


-- ���߷� ���� : ON �� ����
SELECT employee_id, first_name, job_id, job_title
FROM employees 
NATURAL JOIN jobs;

--�⺻ ��������
select e.employee_id,j.job_id,j.job_title
from employees e
join jobs j
on e.job_id = j.job_id ;

--where �� �߰�
select e.employee_id, e.department_id, d.department_name
from employees e
join departments d
on e.department_id = d.department_id 
where d.department_id = 50;

-- 3�� ���̺� ����
select e.employee_id, d.department_name, lo.city
from employees e
join departments d on e.department_id = d.department_id 
join locations lo on  d.location_id =lo.location_id;


--����
select d.department_name �μ��� , l.city ���ø�, c.country_name ������
from departments d 
join locations l  on   d.location_id = l.location_id
join countries c   on    l.country_id = c.country_id
where (l.city = 'Seattle' OR l.city = 'London')
            and c.country_name like 'United%'
order by 2 ;

--��ü����
select e.last_name ����,e.employee_id  ������ȣ,  m.last_name �Ŵ���, m.employee_id ������ȣ2
from employees e
join employees m
    on e.manager_id = m.employee_id;
    

--�ܺ����� ( OUTER JOIN)

 -- �Էµ� ���� ��� null���� �־ ����� ���� ������ ���� ù��°�� �������� �ϴ� ����  left ������ ù��°�� �ϴ� ���� right ��� �����ִ� ���� full
--LEFT OUTER JOIN
SELECT e.last_name ����, e.department_id �μ���ȣ, d.department_name �μ���
FROM EMPLOYEES e
left outer join departments d
on e. department_id = d.department_id;
        --50�� ����
--RIGHT OUTER JOIN
SELECT e.last_name ����, e.department_id �μ���ȣ, d.department_name �μ���
FROM EMPLOYEES e
right outer join departments d
on e. department_id = d.department_id;
    --����� �� 50��
    
--FULL OUTER JOIN
SELECT e.last_name ����, e.department_id �μ���ȣ, d.department_name �μ���
FROM EMPLOYEES e
FULL outer join departments d
on e. department_id = d.department_id;
    -- ����� �� 123��

--����
    
SELECT c.country_name ����, c.country_id ������ȣ , l.location_id ������ȣ, l.city ����
FROM countries c
left outer join locations l
on c.country_id = l.country_id
order by location_id desc;
   
   
 --��������  - ��� �׽�Ʈ�� ����� ��뷮�� ���̺��� ������ ��� ���ȴ�.
 
 select c.country_name ����, re.region_name �����̸�
 from countries c
 cross JOIN regions re;
 
 --���� ����
 
--���� 1
select d.department_name �μ���, 
       d.manager_id      �Ŵ�����ȣ, 
       e.last_name||' '||e.first_name �̸�,
       e.phone_number     ��ȭ��ȣ
       
from departments d
join employees e
    on d.manager_id = e.employee_id;
    
select *
from departments d
join employees e
    on d.department_id = e.department_id;

--���� 2
select e.employee_id ������ȣ, e.hire_date �������, j.job_id ����, j.job_title ��å
from employees e
join jobs j
    on e.job_id=j.job_id;
    
--���� 3
select TO_CHAR(e.hire_date, 'yyyy')�Ի�⵵,
       ROUND(avg(e.salary))��ձ޿�
from employees e
join jobs j         on e.job_id = j.job_id
where j.job_title = 'Sales Manager'
group by TO_CHAR(e.hire_date, 'yyyy')
order by 1;

--����4  ���� ������ ��� �μ� �������� ��ձ޿��� ��ȸ�ϰ��� ��. 
--�μ��� �����̼� �����ϰ� �μ��� ���÷��� ����
select l.city, Round(avg(e.salary)),count(*)
from locations l
join departments d
        on l.location_id = d.location_id
join employees e
        on e.department_id = d.department_id
group by l.city
having count(*) <10
order by 2;

--���� 5 �ڽ��� �Ŵ��� ���� �޿��� ���� �޴� �������� ��(last_name), �޿�(salary) �� �Ŵ����� last_name�� salary�� ����϶�
--1. ��ü ���� ����&�Ŵ���
--2. �Ŵ����� �޿�, ������ �޿� �� �� ������ �޿��� Ŭ ��� ���

select e.employee_id ������ȣ, e.last_name �����̸�, e.salary ��������, m.last_name, m. salary
from employees e
join employees m
    on  e.manager_id  = m.employee_id
where e.salary > m.salary     ;   
