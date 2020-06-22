--day6


--DATETYPE : 데이터 타입(자료형)이란 컴퓨터 시스템과 프로그래밍 언어에서 실수, 정수, 소수 자료형 등의 여러 종류의
--데이터를 식별하는 타입으로서, 해당 자료형에 대한 가능한 값, 해당 자료형에서 수행을 할 수 있는 명령어, 데이터의 형태
-- 의미, 크기와 해당 자료형의 값이 저장되는 방식이다.

--문자형
--문자형 char 와 varchar2 비교
CREATE TABLE COMP (
    char_col CHAR(4),
    varchar_col VARCHAR2(4)
    );
INSERT INTO comp VALUES ('AA', 'AA');
INSERT INTO comp VALUES ('AAA', 'AAA');
INSERT INTO comp VALUES ('AAAA', 'AAAA');
COMMIT;
ROLLBACK;


SELECT * FROM comp;

SELECT * FROM comp
WHERE char_col = varchr_col;
-- char는 고정길이 데이터 타입, carchar2는 가변길이 데이터 타입



--숫자형 데이터 타입 NUMBER
--NUMBER(p,s) : p는 유효자리수 1~38, s는 소수점 유효자리수



--DATE 타입
SELECT hire_date, to_char(hire_date, 'YYYY-MM-DD') "날짜=>문자 형변환"
FROM employees;

SELECT *
FROM employees
WHERE hire_date < '2002/03/03';
--오라클에서 자동을 오른쪽 문자를 좌측에 날짜형 타입에 맞게 형변환 하여 비교함.










