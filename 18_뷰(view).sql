-- 단순한 view 만들기 EMP_V1
-- 하나의 원본테이블 사용, 함수나 그룹 사용 안함, DML 사용가능

DROP VIEW EMP_V1; --미리 뷰 삭제 명령

--employees 테이블에서 필요한 열들을 골라서 뷰로 생성
CREATE VIEW EMP_V1
AS 
SELECT employee_id, last_name, email, hire_date, job_id
FROM employees;

--테이블처럼 select 문 사용
select*from emp_v1;
desc emp_v1;


--테이블처럼 DML 사용가능 (뷰는 가상의 테이블 => 원본 테이블에 입력됨)
INSERT INTO EMP_V1 (employee_id, last_name, email, hire_date, job_id)
VALUES (333, 'David','DAVID',SYSDATE,'IT_PROG');
--뷰에 입력된 데이터 확인
Select * FROM emp_v1;
SELECT * FROM employees;
DESC employees;
--삭제하기
delete from emp_v1
where employee_id = 333;
commit;

CREATE view EMP_V2
AS
SELECT employee_id 직원번호 , last_name 이름,  email, hire_date, job_id
from employees;

select*from emp_v2;

--세번째 뷰 만들기
CREATE view EMP_V3(직원번호, 이름, 이메일, 고용일자, 직종)
AS
SELECT employee_id , last_name,  email, hire_date, job_id
from employees;

select*from emp_v1;
select*from emp_v2;
select*from emp_v3;
select*from employees;



--dml 사용 3번째 뷰에서
insert into emp_v3 ( 직원번호, 이름, 이메일, 고용일자, 직종)
values (334, 'LaLa', 'LALA', SYSDATE, 'IT_PROG');

--복잡한 뷰 만들기
--그룹함수를 사용한 뷰는 DML 사용 불가
-- or replace를 사용하여 수정이 쉽도록 만들기
CREATE or REPLACE VIEW 부서별_직원_보고서
AS
SELECT department_id 부서번호, COUNT(employee_id) 직원수 , max(salary) 최고급여, min(salary) 최저급여
        ,round(AVG(salary)) 평균급여
from employees
group by department_id
ORDER BY 부서번호;

select*from 부서별_직원_보고서;

-- 읽기 전용 뷰 (옵션 with READ ONLY)
CREATe or REPLACE VIEW EMP_V_READ
AS
SELECT employee_id, last_name, email, hire_date,job_id
FROM employees
where department_id = 90
with read only; -- 읽기 전용

SELECT
    *
FROM emp_v_read;

--DML 사용불가
DELETE FROM EMP_V_READ;

--체크 옵션 뷰
CREATE OR REPLACE VIEW emp_v_check
AS
SELECT employee_id, last_name, email, hire_date,job_id, department_id
FROM employees
where department_id = 90
with CHECK OPTION;   -- WHERE 절의 조건에서만 수정 및 입력 가능

SELECT * FROM emp_v_check;
---- 체크 옵션일땐 90번 부서일때만 수정이나 입력이 가능함.
insert into emp_v_check (employee_id, last_name, email, hire_date, job_id, department_id)
values ( 444, '알리', 'ALL', SYSDATE, 'IT_PROG', 90);

