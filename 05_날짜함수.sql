--��¥�� �Լ�

SELECT first_name,hire_date 
    
FROM employees;


--sysdate ���� ��¥�� �ð�
select SYSDATE
FROM DUAL;

--��¥ + ���� => ��¥

SELECT SYSDATE, SYSDATE + 3, SYSDATE-3
FROM DUAL;


--��¥ - ��¥ = �� �ϼ�

SELECT employee_id, sysdate,hire_date,

sysdate - hire_date,ROUND(SYSDATE-hire_date)
FROM employees;


--�ð����


SELECT sysdate +5/24  -- �ð�
from dual;

-- MONTHS_BETWEEN : ���� ���
SELECT employee_id, first_name, round( months_between(Sysdate,hire_date)),
(sysdate - hire_date)/30
from employees
;
--add_month ���� ����
SELECT employee_id,first_name, hire_date, ADD_MONTHS(hire_date,4)--4�� ���ϱ�
FROM employees;

-- next_date (��¥, ������ ���� ����)
SELECT SYSDATE, NEXT_DAY(sysdate, '��')
    
FROM dual;
--last_day(��¥) �� ���� ������ ��
select last_day(sysdate)
from dual;

--��¥�� �ݿø�
select employee_id, hire_date,
    ROUND(hire_date,'MONTH')��,
    ROUND(hire_date,'YEAR')��
from employees
where MONTHS_BETWEEN(sysdate,hire_date) < 150;


--���� 1

SELECT department_id, SYSDATE, MONTHS_BETWEEN(sysdate ,hire_date)
FROM employees
WHERE department_id=100;

--���� 2

SELECT  department_id, SYSDATE, ADD_MONTHS(hire_date,3)���ϱ�_3����, ADD_MONTHS(hire_date,-3)����_3����
FROM employees
WHERE department_id BETWEEN 100 and 106;

