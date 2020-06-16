--문자형함수는 대소문자 함수와 문자 조작함수로 나뉜다

--1. 대소문자 조작 함수 (Upper,Lower,initcap)
SELECT 1+1
FROM DUAL; --듀얼 테입르은 연승용 테이블


SELECT lOWER('SQL COURSE'), UPPER('SQL COURSE'),
        INITCAP('SQL COURSE')
FROM DUAL;

-- 문자함수를 WHERE  절에 사용

SELECT employee_id ,first_name
from employees
where upper(first_name) = 'PATRICK'; --데이터의 대소문자를 구분함 

--2. 문자 조작 함수들   
--CONCAT 
SELECT first_name, last_name, CONCAT(first_name,last_name)풀네임
FROM employees;

select employee_id, first_name,
SUBSTR(first_name, 1, 3),
SUBSTR(first_name, 2, 4),
SUBSTR(first_name, 2),  --시작부터 끝까지
SUBSTR(first_name, -3)  -- 음수일때 끝에서부터 카운트
FROM employees;


--length 문자열의 길이
select first_name, length(first_name)
FROM employees;

--INSTR(문자열, 찾을 문자, m,n)
-- m은 검사 시작 위치
-- n은 찾을 횟수
-- 디폴트값은 m,n 각각 1
SELECT first_name,
INSTR(first_name, 'e', 2 ),
INSTR(first_name, 'e', 5 ),
INSTR(first_name, 'e', 1, 2 )
from employees
where first_name = 'Nanette';


--lpad  / rpad (문자열, 자릿수, 채울문자)
select employee_id, first_name, salary,
LPAD(salary,10,'#'), RPAD(salary,10,'*')
from employees;

--공백을 이용해 문자열을 분리
SELECT
'홍홍 길동' 성명,
SUBSTR( '홍홍 길동',1, INSTR('홍홍 길동', ' ' )-1) 성,
SUBSTR('홍홍 길동',INSTR('홍홍 길동',' ' )+1) 이름
FROM DUAL;

--문자형 함수 예제
SELECT last_name, CONCAT('직업명이' , job_id) as 직업명이
FROM employees
WHERE SUBSTR(JOB_ID, 4, 3 ) = 'REP';
--job_id의 4번째문자부터 REP인 경우

SELECT employee_id,
    concat(first_name,last_name) 전체이름,
    last_name,
    LENGTH(last_name) 길이,
    INSTR(last_name, 'a') "'a'가 몇번째?"
FROM employees;

--문자 치환 : REPLACE

SELECT job_id, replace(job_id,'ACCOUNT','ACCNT') 적용
FROM employees
where job_id like '%ACCOUNT%';

--예제 1 
SELECT UPPER(last_name),lower(last_name), initcap(email)
FROM employees;


--예제 2
select job_id, substr(job_id,1,2)

from employees;



