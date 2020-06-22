--서브쿼리

--Abel 직원보다 급여를 더 많이 받는 직원들?
--Abel의 급여 확인
SELECT salary
FROM employees
WHERE last_name = 'Abel' ; 

--서브쿼리를 사용
-- 단일행 연산자에는 사용이 가능하다 (=,>,>,<=,=>,<>,!=)
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

--에러가 나는 경우

select employee_id, last_name, salary
from employees
where salary > ( SELECT salary
                FROM employees
                WHERE department_id = 30 );
                
                
-- 그룹함수를 서브쿼리로 이용
-- 그룹함수 예로 max는 가장 높은 급여를 받는 사람을 알수없음


select *
from employees
where salary = (SELECT MAX(salary) from employees);


--예제 2 사원 'Bull'란last_name 을 가진 사원의 부서에서 Bull보다 높은 급여를 받는 사원들을 출력하라.(서브쿼리 사용)

select employee_id 직원번호, last_name 이름,department_id 부서번호, salary 급여
from employees
where department_id = (select department_id
                        from employees
                        where last_name = 'Bull') and
salary >(select salary
                from employees
                where last_name = 'Bull');

--예제 3 
select last_name 이름, salary 급여, manager_id
from employees
where manager_id = ( select employee_id from  employees where last_name = 'Russell');

--예제 4
select *
from employees
where job_id = (select job_id from jobs where job_title = 'Stock Manager');



--다중행 서브쿼리
--연산자 (in,any,all)
select salary from employees where department_id=90;

--IN
select employee_id, first_name, last_name, salary
from employees
where salary in (select salary from employees where department_id=90); --OR 로 연결되었다고 생각하면됨

-- ANY : 하나의 조건만 만족해도 됨
SELECT EMPLOYEE_id,first_name, last_name, salary
from employees
where salary >= any (select salary from employees where department_id=90);  -- any 나 all 같은 경우에는 비교를 해줌


--ALL : 모든 조건을 만족해야 함
-- ANY : 하나의 조건만 만족해도 됨
SELECT EMPLOYEE_id,first_name, last_name, salary
from employees
where salary >= ALL (select salary from employees where department_id=90);  -- any 나 all 같은 경우에는 비교를 해줌

--예제 1 ) 부서번호(department_id)가 20번인 직원들의 매니저아이디(manager_id)와 같은 매니저를 가지는 직원들을 출력하라.(단 20번 부서의 직원은 제외!)
SELECT EMPLOYEE_id,first_name, job_id 직종 , salary 급여
from employees
where manager_id IN(select manager_id
                    from employees
                    where department_id =20)
                    AND
                   department_id != 20;

--예제 2) job_id가 'ST_MAN'인 직원들 중 어느 한직원 보다도 급여가 작은 직원들을 출력하라(ANY)

select employee_id, last_name, job_id, salary
from employees
where salary >any(select salary from employees where job_id ='ST_MAN');

--예제 3)
select employee_id, last_name, job_id, salary
from employees
where salary < ALL (SELECT salary from employees where job_id = 'IT_PROG');
-- IT_PROG 직종중에 가장 낮은 급여보다도 낮은 급여를 받는 직원 조회


--다중열-조건의 순서가 같아야함

--다중열 서브쿼리
SELECT employee_id,first_name,job_id,salary,manager_id
FROM employees
where (manager_id , job_id) in(select manager_id , job_id 
                                from employees
                                where first_name = 'Bruce')
    AND first_name !='Bruce' ; 
    
--부서별로 최소 급여를 받는 사원의 부서번호, 사원번호, 이름, 급여정보 검색
--예제1
select department_id 부서번호, employee_id 사원번호, first_name 이름, salary 급여
from employees
where (department_id,salary)  IN (SELECT department_id, MIN(salary)
                                  from employees
                                  group by department_id)
order by department_id;

--예제2
select first_name 이름, job_id, salary, department_id
from employees
where (job_id,salary)  IN (SELECT job_id, MIN(salary)
                                  from employees
                                  group by job_id)
order by salary desc;