--1. 테이블의 모든 데이터 가져오기
select*from employees;
--2.where 절에 가져올 조건에 맞는 행을 선택한다.
-- 위치는 from 절 다음에 위치
select*
from employees
where department_id = 90;  --90번 부서만

select*
from employees
where salary  = 24000;  --월급이 24000인 직원
/*

where 절을 사용할때 주의점
문자(String ) rhk skfWk (date) 값은 항상 따옴표(')로 표시해야함
문자값은 대소문자를 구분한다.(Case-Sensitive)
날짜값은 날짜포맷에 벗어나지 않도록 (Format-Sensitive)
오라클의 날짜포맷은 RR//MM/DD(RR은 2자리 년도)
*/

--3.  WHERE + 문자열

SELECT  employee_id, first_name, Last_name, job_id
FROM employees
where first_name = 'steven';
--4. where + 날짜
SELECT *    
FROM employees
where hire_date >= '03/06/17';

--5 비교 연산자
select *
from employees
where salary>=10000; --숫자비교
select *
from employees
where hire_date >= '03/06/17'; --날짜비교
select *
from employees
where first_name     > 'King'; --문자비교(알파벳순)

--예제 1 번
SELECT *    
FROM employees
where employee_id = '100';
--예제 2번
SELECT *    
FROM employees
where first_name = 'David';
--예제 3번
SELECT *    
FROM employees
where employee_id <= '105';
--예제 4번
SELECT *    
FROM job_history
where start_date >= '06/03/03';
--예제 5번
SELECT *    
FROM departments
where location_id != '1700';  -- <> : 같지 않다 표시 

-- 6. AND OR
SELECT *
FROM employees
where ( department_id = 60 or 
    department_id = 80 ) and salary>10000;
    
select *
from employees
WHERE NOT(hire_date > '04/01/01' or salary > 5000);
      -- = HIRE_DATE<='04/01/01' AND SALARY <= 5000)
    
    --예제 1 
 SELECT *
FROM employees
where salary>4000 AND job_id ='IT_PROG';
    
    --예제 2
 SELECT *
FROM employees
where salary>4000 
AND (job_id ='IT_PROG'
OR job_id = 'FI_ACCOUNT');


-- IN 연산자
SELECT *
from employees
where salary = 4000 or salary =3000 or salary =2700;

select *
from employees
where salary In(4000,3000,2700);    -- 위의 조건과 결과가 같음

--예제
SELECT *
from employees
where salary In(10000,17000,24000);   
SELECT *
from employees
where department_id not in(30,50,80,100,110);    


-- Between 연산자
    select *
    from employees
    where salary > =9000 and salary <=10000;
    
    select *
    from employees
    where salary BETWEEN 9000 AND 10000;
    

예제 1 


    select *
    from employees
    where salary BETWEEN 1000 AND 20000;
    
예제 2
    select *
    from employees
    where hire_date BETWEEN '04/01/01' AND '04/12/30';
    
예제 3

    select *
    from employees
    where salary not BETWEEN 7000 AND 17000;
    


/*
 Like 연산자는 _ 와 % 를 사용
 % 문자가 0개 또는 1개 이상
 _는 문자가 1개
 */
 
 select*
 From employees
 where last_name like 'B%'; 
 
 

 
 select*
 From employees
 where fIRST_name like '_d%'; 


 
 select*
 From employees
 where first_name like '__s%'; -- 세번째 문자가 s 일때 
  

--예제 1번

 
 select*
 From employees
 where job_id like '%AD%'; 

--예제 2번

 select*
 From employees
 where job_id like '%AD___'; 
 
 --예제 3번
  select*
 From employees
 where phone_number like '%1234'; 
 
 --예제 4번
 select*
 From employees
 where phone_number NOT LIKE '%3%' AND phone_number like '%9';     

--예제 5번
  select*
 From employees
 where job_id like '%MGR%' or job_id like '%ASST%'; 


-- IS NULL / IS NOT NULL

 select*
 From employees
 where commission_pct IS NULL;   -- =NULL 은 불가/ NULL은 값이 있는 게 아니기때문에 IS NULL 이나 IS NOT NULL을 써야함
 
 

 select*
 From employees
 where commission_pct IS NOT NULL; 
 
 -- 예제 
 
  select*
 From employees
 where manager_id IS NULL; 
 
 --ORDER BY 정렬 순서 (기본은 낮은순으로 표시되고 갈수록 커짐 - 오름차순) 
 SELECT *
 FROM employees
 ORDER BY salary;

-- DESC 는 그 반대 내림차순
SELECT *
 FROM employees
 ORDER BY salary DESC;

SELECT *
 FROM employees
 ORDER BY LAST_NAME; --문자는 알파벳 순 (A -- Z )


--멀티 정렬
SELECT employee_id,last_name,department_id
    
FROM employees
ORDER BY department_id , employee_id desc;

--부서번호로 정렬후, 사원번호로 정렬 

--열을 생성하여 정렬
SELECT employee_id,last_name,salary*12 연봉
FROM employees
ORDER BY 연봉 desc;

--order by 는 where 절 다음에 위치

SELECT employee_id,first_name, department_id,salary*12 연봉
 FROM employees
 where department_id = 90  --90번 부서
 ORDER BY 연봉 desc; --연봉이 큰순으로 정렬


--예제 1
SELECT employee_id,first_name, last_name
 FROM employees
 ORDER BY employee_id DESC;
 
 
--예제 2
SELECT *
 FROM employees
 where job_id LIKE '%CLERK%'
 ORDER BY salary DESC;
 



SELECT employee_id , department_id , salary
 FROM employees
 where employee_id BETWEEN 120 AND 150
 ORDER BY DEPARTMENT_ID desc,salary desc ;
 





