-- 제약조건의 추가 및 수정
-- 클래스 테이블 생성
DROP TABLE class;

create table class ( 
    cno varchar2 (2),
    cname varchar2(50)
);
-- 테이블의 새 행을 입력
insert into class values( '01', '데이터베이스');
insert into class values( '02', '자바');
select* from class;

--학생 테이블 생성
create table student ( 
    sno varchar2(4),
    sname varchar2(50),
    cno varchar2(2)
    );
    
-- 학생 테이블에 새 행을 입력
delete from student;
INSERT INTO student VALUES ( '0414' , '홍길동' , '01');
INSERT INTO student VALUES ( '0415' , '임꺽정' , '02');
INSERT INTO student VALUES ( '0416' , '이순신' , '03');
commit;

select * from student;

--클래스 테이블에 기본키 추가
ALTER TABLE class
add CONSTRAINT class_cno_pk PRIMARY KEY(CNO);
--기본키는 널값이나 중복될 수 없음

INSERT INTO class VALUES ( null,'데이터베이스');

--클레스 테이블에 유니크 키를 추가
ALTER TABLE class
ADD CONSTRAINT class_cname_uk UNIQUE (cname);
--유니크는 중복안됨
INSERT INTO class VALUES( '03', '데이터베이스'); -- 데이터 중복

--제약조건을 조회하는 명령문
SELECT *
FROM ALL_CONSTRAINTS -- 모든 제약 조건
WHERE table_name = 'DEPARTMENTS'; --테이블명 입력시 대문자

--학생 테이블에 기본키를 추가
ALTER TABLE student
ADD CONSTRAINT student_sno_pk PRIMARY KEY(sno);
-- 학생 테이블의 sname에 NOT NULL 추가
ALTER TABLE student
MODIFY sname CONSTRAINT student_sname_nm NOT NULL;
--학생 테이블에 외래키 추가
ALTER TABLE student
ADD CONSTRAINT studenmt_cno_fk FOREIGN KEY(cno)
REFERENCES class(cno); --클래스 테이블에 cno 열을 참조

select * from  class;
select * from  student;
-- 제약조건을 추가할때 이미 만들어진 테이블에 각 행의 데이터가 만족해야 
-- 제약조건이 추가가 된다.
UPDATE student set cno = '01'
where sno = '0416'; 

-- 제약조건의 삭제
--제약조건의 이름으로 삭제

ALTER TABLE class 
DROP CONSTRAINT class_cno_pk CASCADE; -- 기본키를 참조하는 외래키가 있어서 삭제가 안됨 강제삭제는 cascade 옵션사용
-- 제약조건으로 삭제
ALTER TABLE class
drop UNIQUE(cname); --클레스 테이블의 CNAME 열의 유니크 제약조건 삭제
ALTER TABLE class
drop PRIMARY KEY; --기본키 삭제

-- 테이블의 삭제
DROP TABLE class;
DROP TABLE student;

--테이블 컬럼(열)의 추가와 삭제


-- 90번 부서의 직원들을 새테이블 E_EMP에 입력
CREATE TABLE E_EMP
AS
SELECT employee_id, last_name,salary,department_id
FROM employees
WHERE department_id = 90;

-- 열의 이름을 지정해서 E_EMP2 테이블 생성


CREATE TABLE E_EMP2(emp_id, name, sal, dept_id)
AS
SELECT employee_id, last_name,salary,department_id
FROM employees
WHERE department_id = 90;

SELECT
    *
FROM e_emp2;

--열의 추가
SELECT
    *
FROM E_EMP;

ALTER TABLE E_EMP
ADD( GENDER VARCHAR2(1));
--디폴트 값을 0DMFH GKSMS DUF CNRK
ALTER TABLE E_EMP
ADD( 커미션 NUMBER DEFAULT 0 NOT NULL);
--두개의 열의 추가
ALTER TABLE E_EMP
ADD( 날짜 DATE default SYSDATE, 제작자 VARCHAR2(100)DEFAULT USER);

ALTER TABLE E_EMP
DROP COLUMN WPWKRWK;

--열의 수정
SELECT
    *
FROM E_EMP;

ALTER TABLE E_EMP
MODIFY (제작자 VARCHAR2(200)); --원래 (100) 이었으나 (200)으로 사이즈 업
DESC E_EMP;


ALTER TABLE E_EMP
MODIFY (제작자 VARCHAR2(50)); --원래 (100) 이었으나 (200)으로 사이즈 업
DESC E_EMP;

ALTER TABLE E_EMP
MODIFY (제작자 VARCHAR2(1)); -- 값이 이미 2바이트가 들어가있기 때문에 에러가 발생 최소 2바이트는 되어야함 
ALTER TABLE E_EMP
MODIFY (제작자 NUMBER); -- 이미 문자형 데이터가 있기때문에 숫자형으로 바꿀수가 없음  

SELECT *FROM E_EMP;
DESC e_emp;

-- NULL 값인 경우 입력된 값이 없기때문에 데이터 형식을 바꿀 수 있음
ALTER TABLE E_EMP
MODIFY (GENDER NUMBER); -- 이미 문자형 데이터가 있기때문에 숫자형으로 바꿀수가 없음  


--제작자의 데이터 형식을 바꾸려 하면 
UPDATE E_EMP
SET 제작자 = NULL;

ALTER TABLE E_EMP
MODIFY (제작자 VARCHAR2(1)); -- 값이 이미 2바이트가 들어가있기 때문에 에러가 발생 최소 2바이트는 되어야함 
ALTER TABLE E_EMP
MODIFY (제작자 NUMBER); 

--열의 삭제
ALTER TABLE e_emp
drop column 제작자; --제작자 열 삭제
--여러개의 열 삭제
ALTER TABLE e_emp
drop(gender,커미션,날짜);

SELECT
    *
FROM e_emp;

-- 열의 이름 수정
ALTER TABLE e_emp
rename COLUMN department_id to 부서번호;
ALTER TABLE e_emp
rename COLUMN salary to 급여;
ALTER TABLE e_emp
rename COLUMN employee_id to 직원번호;
ALTER TABLE e_emp
rename COLUMN last_name to 이름;
-- 테이블의 이름 변경
rename E_EMP TO 직원테이블;
SELECT
    *
FROM 직원테이블;


--예제 1 
drop table stmans;
create table  stmans(id,job,sal)
as
select employee_id,job_id,salary
from employees
where job_id = 'ST_MAN';

SELECT
    *
FROM stmans;







