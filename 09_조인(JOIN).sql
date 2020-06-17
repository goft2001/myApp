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


