--그룹함수

SELECT COUNT(*)
FROM EMPLOYEES; 

SELECT salary
from employees
order by salary desc;


--MAX MIN
SELECT MAX(salary), min(salary)
from employees;

-- 문자열에 적용
SELECT MAX(first_name), min(first_name)
from employees;

-- 날짜에 적용

SELECT MAX(hire_date), min(hire_date)

from employees;

--sum,avg : 합계와 평균
select sum(salary),round(avg(salary))
from employees;

--count
select count(*)  -- 직원 테이블의 모든 행의 개수
from employees;

select count(nvl(commission_pct,0)) --null 값을 제외한 행의 개수
from employees;

select count(department_id)  --null 값을 제외한 행의 개수
from employees;


select count(distinct department_id)  --부서의 개수
from employees;

--90번 부서의 직원의 숫자
select count(employee_id)
from employees
where department_id = 90;

select avg(commission_pct)  --널값은 제외한 평균
from employees;

--group by로 나눠서 집계함수 사용

select department_id , round(avg(salary)) 평균급여
from employees
group by department_id;

select department_id 부서번호, job_id ,round(avg(salary)) 평균급여, sum(salary) 총급여합계, count(*) 부서별직업별인원수
from employees
group by department_id, job_id;


-- 예제 1 

select department_id 부서명, count(employee_id) 직원수 , max(salary) 최대급여, min(salary) 최소급여, 
sum(salary) 급여합계, round(avg(salary)) 급여평균
from employees
group by department_id 
order by 급여합계 DESC;

--예제 2

select department_id 부서번호, job_id 직업, manager_id 상사번호, sum(salary) 월급합계, count(*) 직원수
from employees
group by department_id, job_id, manager_id
order by 부서번호;

--예제 3 

select round (avg(Max(salary))), avg(min(salary))
from employees
group by department_id;


-- Having 절 : 그룹함수를 이용한 조건절
SELECT department_id 부서번호, sum(salary) 급여합계
FROM employees
where sum(salary) > 100000
group by department_id
order by department_id;   -- 오류남

SELECT department_id 부서번호, sum(salary) 급여합계
FROM employees
group by department_id
HAVING sum(salary) > 100000
order by department_id;


--예제 1 
select job_id 직종, sum(salary) 급여합계
from employees
where job_id !='AC_MGR'
group by job_id
having AVG(salary) >10000
order by    급여합계 DESC;

--예제 2
select DEPARTMENT_ID 부서번호, round(avg(salary)) 평균급여
from employees
WHERE department_id != 40
group by department_id
Having avg(salary)<7000;


--예제 3
select job_id 직종, suM(salary)급여합계
from employees
where job_id not like '%REP%'
group by job_id
Having SUM(SALARY) >=13000
order by 급여합계 DESC;

