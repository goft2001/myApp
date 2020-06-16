--숫자형 함수

--ROUND

SELECT ROUND(15.193,1) 소수첫째자리, 
    ROUND(15.193,2) 소수둘째자리, ROUND(15.193)디폴트,
    ROUND(15.193,-1) "10의자리",
    ROUND(15.193,-2) "100의자리"
FROM DUAL;

--TRUNC : 버림
SELECT TRUNC(15.79,1) 소수첫째자리,
        TRUNC(15.79,0) 정수,
        TRUNC(15.79) 디폴트,
        TRUNC(15.79,-1) "10의 차리",
        TRUNC(115.79,-2) "10의 차리"
    FROM DUAL;
    
    --MOD
    SELECT  employee_id 짝수번, last_name
    FROM employees
    where mod(employee_id,2)=0
    order by 1; -- 첫번째 열로 정렬(오름차순)
    
    
  SELECT  salary, round(salary/30,0) 정수, round(salary/30,1)소수둘째,
  round(salary/30,-1) 소수둘째
    FROM employees ;

    