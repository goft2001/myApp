--  한줄의 주석입니다. 단축키는 CTRL+/
/*
여러줄 주석
을 다는 방법
*/
-- 1. 테이블의 모든 행과 열을 읽어오기 : *
SELECT*
FROM departments;
--2 . 특정 열만 읽어오기
SELECT department_id, DEPARTMENT_NAME
FROM departments;
--3. 산술 연산자 사용 ( +,-,*,/)
SELECT employee_id,first_name salary
FROM EMPLOYEES;
SELECT employee_id, first_name, salary, salary+100,
        salary + (salary * 0.1)
from employees;

--4. 널(null)이란?
--널은 입력되지 않은, 사용가능하지 않은, 알수 없는 값
--널값은 제로(0) 또는 공백("") 과는 다르다.
SELECT LAST_NAME, JOB_ID, SALARY, commission_pct
from employees;

SELECT LAST_NAME, JOB_ID, SALARY, commission_pct, commission_pct+10

from employees;

--5. 중복된 값 제거 : distinct

select distinct job_id
from EMPLOYEES;

--예제 1
select employee_id, first_name, last_name
from employees;

--예제2
select  first_name, salary, salary*1.1 AS 뉴셀러리
from employees;

--예제3
select employee_id 사원번호, first_name 이름, last_name 성
from employees;

--연결 연산자 (||)
SELECT LAST_NAME || ' is a ' || job_id as "직업 정보"
FROM employees;
SELECT employee_id, first_name || ' ' || last_name 
FROM employees;

SELECT employee_id, first_name||' '||last_name, 
        email || '@company.com'
    
FROM employees;

