--날짜형 함수

SELECT first_name,hire_date 
    
FROM employees;


--sysdate 현재 날짜와 시간
select SYSDATE
FROM DUAL;

--날짜 + 숫자 => 날짜

SELECT SYSDATE, SYSDATE + 3, SYSDATE-3
FROM DUAL;


--날짜 - 날짜 = 총 일수

SELECT employee_id, sysdate,hire_date,

sysdate - hire_date,ROUND(SYSDATE-hire_date)
FROM employees;


--시간계산


SELECT sysdate +5/24  -- 시간
from dual;

-- MONTHS_BETWEEN : 월을 계산
SELECT employee_id, first_name, round( months_between(Sysdate,hire_date)),
(sysdate - hire_date)/30
from employees
;
--add_month 달을 더함
SELECT employee_id,first_name, hire_date, ADD_MONTHS(hire_date,4)--4달 더하기
FROM employees;

-- next_date (날짜, 다음번 나올 요일)
SELECT SYSDATE, NEXT_DAY(sysdate, '목')
    
FROM dual;
--last_day(날짜) 그 월의 마지막 날
select last_day(sysdate)
from dual;

--날짜의 반올림
select employee_id, hire_date,
    ROUND(hire_date,'MONTH')월,
    ROUND(hire_date,'YEAR')년
from employees
where MONTHS_BETWEEN(sysdate,hire_date) < 150;


--예제 1

SELECT department_id, SYSDATE, MONTHS_BETWEEN(sysdate ,hire_date)
FROM employees
WHERE department_id=100;

--예제 2

SELECT  department_id, SYSDATE, ADD_MONTHS(hire_date,3)더하기_3개월, ADD_MONTHS(hire_date,-3)빼기_3개월
FROM employees
WHERE department_id BETWEEN 100 and 106;

