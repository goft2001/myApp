--조인
select e.employee_id, e.department_id, d.department_name
from employees e
join departments d
on e.department_id = d.department_id;  --무조건 합치고, on 절에다가 기본키 외래키 합치되는 걸 적어줌.


-- 네추럴 조인 : ON 절 생략
SELECT employee_id, first_name, job_id, job_title
FROM employees 
NATURAL JOIN jobs;

--기본 동등조인
select e.employee_id,j.job_id,j.job_title
from employees e
join jobs j
on e.job_id = j.job_id ;

--where 절 추가
select e.employee_id, e.department_id, d.department_name
from employees e
join departments d
on e.department_id = d.department_id 
where d.department_id = 50;

-- 3개 테이블 조인
select e.employee_id, d.department_name, lo.city
from employees e
join departments d on e.department_id = d.department_id 
join locations lo on  d.location_id =lo.location_id;


--예제
select d.department_name 부서명 , l.city 도시명, c.country_name 국가명
from departments d 
join locations l  on   d.location_id = l.location_id
join countries c   on    l.country_id = c.country_id
where (l.city = 'Seattle' OR l.city = 'London')
            and c.country_name like 'United%'
order by 2 ;

--자체조인
select e.last_name 직원,e.employee_id  직원번호,  m.last_name 매니저, m.employee_id 직원번호2
from employees e
join employees m
    on e.manager_id = m.employee_id;


