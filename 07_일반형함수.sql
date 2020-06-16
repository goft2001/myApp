--NULL 관련 함수
--NVL : 널값을 다른 값으로 바꿀때 사용
 SELECT last_name, manager_id, NVL(manager_id,0) 매니저
 FROM employees
 where Last_name = 'King';
 
 
 --NVL2(ex,ex1,ex2) : ex값이 null값이 아니면 ex1, null값이면 ex2
   SELECT last_name, manager_id, NVL2(manager_id,1,0) 매니저
 FROM employees
 where Last_name = 'King';
 
 --NULLIF(ex1,ex2) : ex1과 ex2값이 동일하면 NULL
 --동일하지 않으면 ex1으로 출력
  SELECT NULLIF(1,1),NULLIF(1,2)
 FROM DUAL;
 
 --COALESCE(ex1,ex2,ex3,......)
 --ex1이 널값이면 ex2반환 ex2값이 널값이면 ex3 반환 ....
select last_name 이름, salary 월급, commission_pct 커미션, coalesce((salary + (commission_pct*salary)),salary+2000) 월급인상
from employees
order by 3;


--예제1
 
 select last_name 이름, salary 월급, nvl(commission_pct,0) 커미션, salary*12+salary*12*nvl(commission_pct,0) 연봉
 from employees
 order by 연봉 desc;
 
 --예제 2
 
  select last_name 이름, salary 월급, nvl(commission_pct,0) 커미션, salary*12+salary*12*nvl(commission_pct,0) 연봉
        ,NVL2(commission_pct,'SAL+COMM', 'SAL') 연봉계산
 from employees ; 
 
 --예제 3
 SELECT first_name, length(first_name) 글자수, last_name, length(last_name) 글자수2 ,
 NULLIF(length(first_name),length(last_name)) 결과
 
     
 FROM employees
 order by first_name desc;
 
 --decode 함수
 select last_name 이름,job_id,salary, DECODE(job_id, 'IT_PROG', salary*1.0, 
                                                     'ST_CLERK', salary*1.15,
                                                    'SA.REP', salary*1.20,
                                                    salary) 수정월급
 FROM employees;
 
 
 
 --예제 1 
-- trunk 사용


select last_name 이름, job_id 직무, salary 월급,
decode(TRUNC(salary/2000),
        1 , 0.0,
        2 , 0.09,
        3 , 0.20,
        4 , 0.30,
        5 , 0.40,
        6 , 0.42,
        7 , 0.44,
            0.45) 세율
from employees ;



select  employee_id 이름, first_name, last_name, salary,
case when salary >= 9000  then  '상위급여'
    when salary >= 6000  then  '중위급여'
    else                       '하위급여'
    END "급여등급"
from employees
where job_id = 'IT_PROG';
 
 