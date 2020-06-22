--인덱스 확인하기
    SELECT
        TABLE_NAME 테이블명,
        INDEX_NAME 인덱스이름,
        COLUMN_NAME 컬럼이름
    FROM ALL_IND_COLUMNS  -- 오라클에서 자동 생성됨
    WHERE TABLE_NAME = 'DEPARTMENTS' ; -- 테이블이름을 대문자로
   
   drop table members;
    
--실습으로 테이블 만들기
CREATE  TABLE members (
    member_id NUMBER,
    first_name varchar2(100) not null,
    last_name varchar2(100) not null,
    gender char(1) not null,
    dob date not null,
    email varchar2(255) not null,
    primary key(member_id)
 );
desc members;
--인덱스 확인하기
    SELECT
        TABLE_NAME 테이블명,
        INDEX_NAME 인덱스이름,
        COLUMN_NAME 컬럼이름
    FROM ALL_IND_COLUMNS  -- 오라클에서 자동 생성됨
    WHERE TABLE_NAME = 'MEMBERS' ; -- 기본적으로 딱 한개의 인덱스 PK 가 나옴
     
    SELECT * FROM members
    where last_name = 'Harse' ; -- 테이블 전체 검색
    
    EXPLAIN plan for  -- 다음 나오는 select 문을 실행하여 보고서 작성
    select*from members
    where last_name = 'Harse';
    
    select plan_table_output  -- 설명문을 출력
    from table(dbms_xplan.display());
    
    
    -- 인덱스 만들기
    CREATE INDEX members_last_name_i
    ON members(last_name);
    
    --인덱스 삭제하기
    DrOP INDEX members_last_name_i;
    
    select *
    from members
    where first_name like 'M%' AND LAST_NAME LIKE 'A%';
    
    --멀티 인덱스 만들기
    CREATE INDEX name_i
    on members(first_name, last_name);
    
    --성능평가
       EXPLAIN plan for  
    select*from members
  where first_name like 'M%' AND LAST_NAME LIKE 'A%';
    
    select plan_table_output  
    from table(dbms_xplan.display());
    
--인덱스 삭제하기
drop index name_i;

