--문자형
--문자형 char 와 varchar2 비교
CREATE TABLE COMP (
    char_col CHAR(4),
    varchar_col VARCHAR2(4) );
    
    
    INSERT INTO comp values ('AA' , 'AA' ) ;
    INSERT INTO comp values ('AAA' , 'AAA' );
    INSERT INTO comp values ('AAAA' , 'AAAA' );    
    commit;
    ROLLBACK;
    
    SELECT * FROM COMP;
    
    SELECT * FROM COMP
    WHERE char_col = varchar_col; --VARCHAR 2 는 뒤에 공백이 자리하고 있어 풀로 채웠을때만 같다고 나옴
    --char는 고정길이 데이터 타입, varchar2는 가변길이 데이터 타입
    
    
    -- 숫자형 데이터 타입 NUMBER
    -- NUMBER(p,s) p는 유효자리수 1 ~ 38 , s 는 소수점 유효자리수
    
    --DATE 타입
    SELECT hire_date, to_char(hire_date, 'YYYY-mm-dd') "날짜=>문자변환"
    FROM employees;
    
    select *
    from employees
    where hire_date <'2002-03-03';
    --오라클이 자동으로 오른쪽 문자를 좌측 데이터 날짜형에 맞게 형 변환하여 비교함
    