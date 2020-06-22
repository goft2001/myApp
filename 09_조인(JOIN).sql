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
    

--외부조인 ( OUTER JOIN)

 -- 입력된 값이 없어도 null값을 넣어서 출력을 해줌 기준을 왼쪽 첫번째를 기준으로 하는 것이  left 오른쪽 첫번째로 하는 것이 right 모두 보여주는 것이 full
--LEFT OUTER JOIN
SELECT e.last_name 직원, e.department_id 부서번호, d.department_name 부서명
FROM EMPLOYEES e
left outer join departments d
on e. department_id = d.department_id;
        --50개 인출
--RIGHT OUTER JOIN
SELECT e.last_name 직원, e.department_id 부서번호, d.department_name 부서명
FROM EMPLOYEES e
right outer join departments d
on e. department_id = d.department_id;
    --인출된 행 50개
    
--FULL OUTER JOIN
SELECT e.last_name 직원, e.department_id 부서번호, d.department_name 부서명
FROM EMPLOYEES e
FULL outer join departments d
on e. department_id = d.department_id;
    -- 인출된 행 123개

--예제
    
SELECT c.country_name 국가, c.country_id 국가번호 , l.location_id 지역번호, l.city 도시
FROM countries c
left outer join locations l
on c.country_id = l.country_id
order by location_id desc;
   
   
 --교차조인  - 대게 테스트로 사용할 대용량의 테이블을 생성할 경우 사용된다.
 
 select c.country_name 국가, re.region_name 지역이름
 from countries c
 cross JOIN regions re;
 
 --리뷰 예제
 
--예제 1
select d.department_name 부서명, 
       d.manager_id      매니저번호, 
       e.last_name||' '||e.first_name 이름,
       e.phone_number     전화번호
       
from departments d
join employees e
    on d.manager_id = e.employee_id;
    
select *
from departments d
join employees e
    on d.department_id = e.department_id;

--예제 2
select e.employee_id 직원번호, e.hire_date 고용일자, j.job_id 직종, j.job_title 직책
from employees e
join jobs j
    on e.job_id=j.job_id;
    
--예제 3
select TO_CHAR(e.hire_date, 'yyyy')입사년도,
       ROUND(avg(e.salary))평균급여
from employees e
join jobs j         on e.job_id = j.job_id
where j.job_title = 'Sales Manager'
group by TO_CHAR(e.hire_date, 'yyyy')
order by 1;

--예제4  각각 도시의 모든 부서 직원들의 평균급여를 조회하고자 함. 
--부서와 로케이션 조인하고 부서와 임플로이 연결
select l.city, Round(avg(e.salary)),count(*)
from locations l
join departments d
        on l.location_id = d.location_id
join employees e
        on e.department_id = d.department_id
group by l.city
having count(*) <10
order by 2;

--예제 5 자신의 매니저 보다 급여를 많이 받는 직원들의 성(last_name), 급여(salary) 와 매니저의 last_name과 salary를 출력하라
--1. 자체 조인 직원&매니저
--2. 매니저의 급여, 직원의 급여 비교 후 직원의 급여가 클 경우 출력

select e.employee_id 직원번호, e.last_name 직원이름, e.salary 직원월급, m.last_name, m. salary
from employees e
join employees m
    on  e.manager_id  = m.employee_id
where e.salary > m.salary     ;   
