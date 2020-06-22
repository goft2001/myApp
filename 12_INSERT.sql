--day 6






--DML 작업 : 데이터베이스에 데이터를 입력, 수정, 삭제하는 명령어이다.
--데이터베이스의 내용을 변경하는 작업을 수행함으로 주의깊게 실행해야 한다.

--INSERT: 새 행을 입력하기
--1. 실행전 열과 제약조건을 확인 (DESC + 테이블)
DESC departments;   --describe 약자 (요약)


--전체 열을 다 입력하는 방법 1
INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES ( 71, '개발부 1', 100, 1700);

SELECT *
FROM departments;

commit;

--열의 이름이 없는 경우 전체 열을 다 입력해야 함
INSERT INTO departments
VALUES (72, '개발부 2', 100, 1700);

COMMIT;

--열의 순서를 바꿀경우
INSERT INTO departments (department_name, manager_id, locations_id, department_id)
VALUES ('개발부 3', 100, 1700, 73);

COMMIT;


--자동으로 널값 입력
INSERT INTO departments (department_id, department_name )
VALUES (74, '개발부 4');
COMMIT;
DESC departments;


--SYSDATE 현재 날짜 입력
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES (1, '길동', '홍', 'hong@naver.com', SYSDATE, 'IT_PROG');
COMMIT;

SELECT*
FROM employees;

DESC employees;


--날짜 입력하기
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES (2, '길동', '강', 'kang@naver.com', TO_DATE('2020-04-05','YYYY-MM-DD'), 'IT_PROG');
COMMIT;


--사용자로부터 직접입력받기
INSERT INTO department (department_id, department_name )
VALUES (&id, '&name');  -- 75 개발부 5
COMMIT;


--테이블 만들기
CREATE TABLE XX_EMP (
    EMPNO NUMBER,
    ENAME VARCHAR2(100),
    SAL    NUMBER);
 
--테이블 전체를 카피해서 입력하는 방법    
INSERT INTO XX_EMP (EMPNO, ENAME, SAL)
SELECT employee_id, first_name, salary
FROM employees;


-- INSERT를 실행중에 에러가 나는 경우
-- 기본키에 이미 있는 (중복된) 값을 입력할 경우
INSERT INTO departments (department_id, department_name, manager_id, locatoin_id )
VALUES (10, '개발부 10', 100, 1700); 


--2 FK(외래키)에 참조되지 않은 값을 입력
INSERT INTO departments (department_id, department_name, manager_id, locatoin_id )
VALUES (5, '개발부 5', 100, 1); 


--3 데이터의 종류가 다를때
INSERT INTO departments (department_id, department_name, manager_id, locatoin_id )
VALUES (5, '개발부 5', 100, 'D1'); 

INSERT INTO copy_dept (department_id, department_name, manager_id, location_id)
VALUES (5, '개발부 5', 100, 10);


--4 데이터의 사이즈가 맞지 않을때
INSERT INTO departments (department_id, department_name, manager_id, locatoin_id )
VALUES (5, '개발부 5개발부 5개발부 5개발부 5개발부 5개발부 5개발부 5개발부 5', 100, 'D1'); 


--5 테이블을 카피하기
CREATE TABLE COPY_DEPT
AS
SELECT * FROM departments;


--예제1)
-- departments 테이블에 다음과 같이 각각의 depatment_id, department_name,
--manager_id가 200, location_id가 1700인 행을 3개 입력하세요.
INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (271, 'Sample Dept 1', 200, 1700);

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (272, 'Sample Dept 2', 200, 1700);

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (273, 'Sample Dept 3', 200, 1700);
COMMIT;


--예제2)
--아래와 같이 테이블을 만든후 SELECT문을 이용하여 departments 테이블 내용을 전부 입력하시오.
CREATE TABLE copy_departments ( department_id number(4,0),
                                department_name varchar2(30 byte),
                                manager_id number(6,0),
                                location_id number(4,0));
                            
INSERT INTO copy_departments
SELECT * FROM departments;












