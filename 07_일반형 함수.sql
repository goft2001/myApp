-- day3



-- NULL 관련 함수
--NVL : 널값을 다른 값으로 바꿀때 사용
SELECT last_name, manager_id, NVL(manager_id, 0) 매니저   --NULL값을 0으로 바꿈
FROM employees
WHERE last_name = 'King';


--NVL2( ex, ex1, ex2) : ex값이 NULL값이 아니면 ex1, NULL값이면 ex2
SELECT last_name,  NVL2(manager_id, 1, 0)  매니저  
FROM employees
WHERE last_name = 'King';


--NULLIF (ex1, ex2) : ex1과 ex2값이 동일하면 NULL
-- 동일하지 않으면 ex1으로 출력
SELECT NULLIF(1, 1), NULLIF(1,2)
FROM DUAL;


--COALESCE (ex1, ex2, ex3, ...)
--ex1이 널값이면 ex2 반환, ex2도 널값이면 ex3반환...
SELECT last_name 이름, salary 월급, commission_pct 커미션pct, COALESCE((salary + (commission_pct*salary)), salary+2000) 월급인상
FROM employees
ORDER BY 3;


--예제1)
SELECT last_name 이름, salary 월급, NVL(commission_pct, 0) 커미션, salary*12 + salary*12*NVL(commission_pct, 0) 연봉
FROM employees
ORDER BY 연봉 DESC;


--예제2)
SELECT last_name 이름, salary 월급, NVL(commission_pct, 0) 커미션, salary*12 + salary*12*NVL(commission_pct, 0) 연봉,
        NVL2 (commission_pct, 'SAL+COMM', 'SAL') 연봉계산
FROM employees
ORDER BY 연봉 DESC;



--예제3)
SELECT first_name, LENGTH(first_name) 글자수1, last_name, LENGTH(last_name) 글자수2, 
        NULLIF(LENGTH(first_name), LENGTH(last_name)) 결과
FROM employees;



--DECODE 함수 : DECODE(ex1, 'ex2', ex3) ex1안에서 ex2이면 ex3로 
SELECT last_name 이름, job_id, salary, DECODE(job_id, 'IT_PROG', salary*1.10, 'ST_CLECRK', salary*1.15, 'SA_REP', salary*1.20,
                salary) 수정월급
FROM employees;


--예제1)
SELECT last_name 이름, job_id 직무, salary 월급, 
        DECODE(TRUNC(salary/2000), 0, 0,
                                    1, 0.09,
                                    2, 0.20,
                                    3, 0.30,
                                    4, 0.40,
                                    5, 0.42,
                                    6, 0.44,
                                     0.45) 세율
              
        
FROM employees;


--CASE 함수는 조건연산자를 다 사용할수 있음 IF, THEN, ELSE구문과 비슷
-- CASE job_id WHEN 'IT_PROG' THEN salary*1.10
--              WHEN 'ST_CLERK' THEN salary*1.15  ..


--예제1)
SELECT employee_id, first_name, last_name, salary,
        CASE WHEN salary >= 9000  THEN '상위급여'
             WHEN salary BETWEEN 6000 AND 8999   THEN '중위급여'
             ELSE                               '하위급여'
             END "급여등급"

FROM employees
WHERE job_id = 'IT_PROG';







