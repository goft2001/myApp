-- 집합연산자(UNION 외 ) 

-- UNION : 합집합 중복 제거
SELECT employee_id, job_id
from employees
UNION
select employee_id, job_id
from job_history;

-- UNION ALL : 합집합
SELECT employee_id, job_id
from employees
UNION ALL
select employee_id, job_id
from job_history;


-- INTERSECT : 교집합
SELECT employee_id, job_id
from employees
INTERSECT
select employee_id, job_id
from job_history;

-- MINUS : 차집합
SELECT employee_id, job_id
from employees
MINUS
select employee_id, job_id
from job_history;

-- 예제 ) employees 테이블의 department_id 집합과 departments 테이블의 department_id 집합을 UNION 연산자를 이용해 합쳐 보세요.

SELECT department_id 
FROM employees
union ALL
SELECT department_id
FROM departments;

--예제 2 ) employees 테이블의 department_id 집합과 departments 테이블의 department_id 집합의 교집합을 INTERSECT 연산자를 이용해 출력해 보세요
select department_id
from employees
intersect
select department_id
from departments;

--예제 3 departments 테이블의 department_id 집합에서 employees 테이블의 department_id 집합을 MINUS 연산자를 이용해 빼 보세요

select department_id
from departments
MINUS
select department_id
from employees;