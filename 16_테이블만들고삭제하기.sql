--day6



--테이블 만들기
CREATE TABLE ex_date(  --테이블 이름
    ex_id   NUMBER(2),  --열의 이름, 데이터타입
    start_date  DATE    DEFAULT SYSDATE   --티폴트는 입력안될시 디폴트 뒤의 값으로
    );
INSERT INTO ex_date(ex_id)
VALUES (1);
INSERT INTO ex_date(ex_id)
VALUES (2);
INSERT INTO ex_date(ex_id)
VALUES (3);
COMMIT;
SELECT * FROM ex_date;
DESC ex_date;



--테이블 삭제하기
DROP TABLE comp;
DROP TABLE copy_emp;



--예제1)
-- product_id(number 타입), product_name(varchar2 타입, 20자리), menu_date(date 타입) 열이 있는
--sample_product 이름의 테이블을 생성해 보세요.
CREATE TABLE sample_product(
    product_id  NUMBER,
    product_name    VARCHAR2(20),
    menu_date       DATE
    );
    
    
--예제2)
--위에서 만든 테이블을 삭제해 보세요. DESCRIBE 절로 테이블이 잘 삭제되었는지 확인하세요.
DROP TABLE sample_product;
DESC sample_product;



--제약조건
--제약 조건이랑 테이블 단위에서 데이터의 무결성을 보장해주는 규칙이다. 제약 조건은 테이블에 데이터가 입력
-- 수정, 삭제되거나 테이블이 삭제,변경될 경우 잘못된 트랜잭션이 수행되지 않도록 결함을 유발할 가능성이
--있는 작업을 방지하는 역할을 담당한다.
CREATE TABLE emp(
        eno     NUMBER(3) CONSTRAINT emp_emo_pk PRIMARY KEY,
        emp_name    VARCHAR2(20)
        );
DESC emp;
INSERT INTO emp 
VALUES (2, '양');
SELECT * FROM emp;

DROP TABLE emp;

--제약조건을 테이블 아래쪽에
CREATE TABLE emp(
        eno     NUMBER(3), 
        emp_name    VARCHAR2(20),
        CONSTRAINT emp_emo_pk PRIMARY KEY(eno)   --어딘지 알려줘야함
        );


--제약조건의 이름없이
CREATE TABLE emp1 (
        eno     NUMBER(3) PRIMARY KEY,
        emp_name    VARCHAR2(20)
        );
INSERT INTO emp1
VALUES (1, '박');

DROP TABLE emp1;



--NOT NULL / UK 유니크 : NULL값을 입력할 수 없다.
CREATE TABLE emp1(
        eno         NUMBER(3),
        emp_name    VARCHAR2(20) CONSTRAINT emp1_ename_nn NOT NULL,
        email       VARCHAR2(30) CONSTRAINT emp1_email_uk UNIQUE
        );
--NOT NULL 은 NULL 값을 넣을 수 없다.
INSERT INTO emp1
VALUES (1, NULL, 'hong@naver.com');
DESC emp1;

--UK 유니크는 동일한 값이 입력될 수 없다.
INSERT INTO emp1
VALUES (1, '홍길동', 'hong@naver.com');
INSERT INTO emp1
VALUES (2, '김유신', 'hong@naver.com');  --유니크에는 동일한 값을 넣을 수 없다.

-- CHECK 제약조건: WHERE절에 기술하는 조건 형식과 동일
CREATE TABLE emp2 (
        eno     NUMBER(3),
        emp_name    VARCHAR2(20) CONSTRAINT emp2_ename_nn NOT NULL,
        sal     NUMBER(10),
        CONSTRAINT emp2_sal_check CHECK (sal > 1000)
        );
INSERT INTO emp2
VALUES (1, '홍길동', 999);    --CHECK 조건에 위반돼서 안됨.

DROP TABLE emp;

CREATE TABLE emp (
        eno NUMBER(4)   PRIMARY KEY,   -- 제약조건 이름 생략
        ename VARCHAR2(20) NOT NULL,
        gno VARCHAR2(13)    UNIQUE CHECK (LENGTH(gno) >=8),
        gender VARCHAR2(5)  CHECK(gender IN ('women', 'man'))
        );
INSERT INTO emp 
VALUES (1, '김', '12345678', 'man');
INSERT INTO emp 
VALUES (2, '강', '123456789', 'woman');
INSERT INTO emp 
VALUES (3, '양', '123456789', 'human');


--예제1) members 라는 새 테이블을 만듭니다. (제약조건 이름은 생략가능)
CREATE TABLE members(
            member_id   NUMBER(2)   PRIMARY KEY,
            first_name  VARCHAR2(50)    NOT NULL,
            last_name   VARCHAR2(50)    NOT NULL,
            gender      VARCHAR2(5)     CHECK(gender IN ('women', 'man')),
            birth_day   DATE            DEFAULT(SYSDATE),
            email       VARCHAR2(200)    UNIQUE  NOT NULL
            );
    desc members;
    
    drop table dept;
    
    create TABLE dept(
        dno number(4),
        dnmae varchar2(20),
        constraint dept_dno_pk primary key(dno) -- 기본키 
        );
    drop table emp;
    create table emp(
    eno number(4),
    emp_name varchar2(20),FOREIGN,
    sal number (10),
    dno number(4),
    CONSTRAINT emp_eno_pk primary KEY(eno), -- 기본키
    CONSTRAINT emp_dno_FK FOREIGN key(dno)
    references dept(dno) ON DELETE CASCADE -- 참조열 삭제시 자동삭제
    
    --외래키는 참조열에 열에 이름까지 적어줘야함 = references dept(dno)
     );
    DELETE FROM DEPT; --모든 행 삭제
    insert into dept values (10,'TEST1') ;
    insert into dept values (20,'TEST2') ;        
    insert into dept values (30,'TEST3') ;
    insert into dept values (40,'TEST4') ;
    insert into dept values (50,'TEST5') ;

SELECT * FROM dept;

    DELETE FROM DEPT; --모든 행 삭제
    insert into emp values (1010,'Kin'200,20) ;
    insert into emp values (2020,'Lee',220,30) ;        
    insert into emp values (3030,'Jung',250,40) ;
    insert into emp values (4040,'Oh',300,50) ;
    insert into emp values (5050,'king',500,60) ;

-- 외래키는 참조열의 값 이외에는 입력불가
insert into emp balues (1060, 'kang', 500, 60);
-- 단 , 널값은 가능
insert into emp values (1060,'kang',500,null);

-- 삭제시 에러 발생
DELETE FROM dept
where dno = 20;
-- 1. 참조행 삭제시 자동 삭제
--ON DELETE CASCADE