 -- 변환형 함수
 
 -- TO_CHAR
 -- 숫자를 문자로 변환
 -- 콤마(,)
 SELECT TO_CHAR(12345678, '999,999,999') 콤마
 FROM DUAL;
 
 --소수점(.)
 SELECT TO_CHAR(12345.678,'999,999,999.99') 소수점
 FROM DUAL;
 
 --&표시
 SELECT TO_CHAR(12345.678,'$999,999,999') 달러표시
 FROM DUAL;
 
 --L표시
 SELECT TO_CHAR(12345.678,'L999,999,999.99') 현지통화
 FROM DUAL;
 
 --왼쪽에 0을 삽입
 SELECT TO_CHAR(123,'09999') 제로표시
 FROM DUAL;
 
 --날짜를 문자로 변환
 --년,월,일,시,분,초
  SELECT TO_CHAR(sysdate, 'yyYY/mm/dd HH24:MI:SS') 현재날짜시간
 FROM DUAL;
 
 --365일중 오늘이 몇 일?
 
   SELECT TO_CHAR(sysdate, 'DDD') 현재날짜시간
 FROM DUAL;
 
 --오늘의 월?
   SELECT TO_CHAR(sysdate, 'MONTH') 현재날짜시간
 FROM DUAL;
 
 --예제 1
 
 SELECT employee_id, TO_CHAR(HIRE_DATE, 'YY/DD') 입사월
      
 FROM employees
 WHERE department_id = 100;
 
 --예제 2
 
 SELECT last_name, TO_CHAR(salary, '$999,999,999.00') 월급    
 FROM employees
 WHERE salary > 10000
 ORDER BY salary DESC;
 
 -- 문자를 날짜로 TO_DATE
 SELECT TO_DATE('2011-01-01', 'YYYY-MM-DD')
 FROM DUAL;
 
 --문자를 숫자로 TO_NUMMVER
 SELECT TO_NUMBER('0123123') + 100
 FROM DUAL;
 
 
 
 
 
 
 
 
 
 
 
 
 