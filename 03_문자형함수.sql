--�������Լ��� ��ҹ��� �Լ��� ���� �����Լ��� ������

--1. ��ҹ��� ���� �Լ� (Upper,Lower,initcap)
SELECT 1+1
FROM DUAL; --��� ���Ը��� ���¿� ���̺�


SELECT lOWER('SQL COURSE'), UPPER('SQL COURSE'),
        INITCAP('SQL COURSE')
FROM DUAL;

-- �����Լ��� WHERE  ���� ���

SELECT employee_id ,first_name
from employees
where upper(first_name) = 'PATRICK'; --�������� ��ҹ��ڸ� ������ 

--2. ���� ���� �Լ���   
--CONCAT 
SELECT first_name, last_name, CONCAT(first_name,last_name)Ǯ����
FROM employees;

select employee_id, first_name,
SUBSTR(first_name, 1, 3),
SUBSTR(first_name, 2, 4),
SUBSTR(first_name, 2),  --���ۺ��� ������
SUBSTR(first_name, -3)  -- �����϶� ���������� ī��Ʈ
FROM employees;


--length ���ڿ��� ����
select first_name, length(first_name)
FROM employees;

--INSTR(���ڿ�, ã�� ����, m,n)
-- m�� �˻� ���� ��ġ
-- n�� ã�� Ƚ��
-- ����Ʈ���� m,n ���� 1
SELECT first_name,
INSTR(first_name, 'e', 2 ),
INSTR(first_name, 'e', 5 ),
INSTR(first_name, 'e', 1, 2 )
from employees
where first_name = 'Nanette';


--lpad  / rpad (���ڿ�, �ڸ���, ä�﹮��)
select employee_id, first_name, salary,
LPAD(salary,10,'#'), RPAD(salary,10,'*')
from employees;

--������ �̿��� ���ڿ��� �и�
SELECT
'ȫȫ �浿' ����,
SUBSTR( 'ȫȫ �浿',1, INSTR('ȫȫ �浿', ' ' )-1) ��,
SUBSTR('ȫȫ �浿',INSTR('ȫȫ �浿',' ' )+1) �̸�
FROM DUAL;

--������ �Լ� ����
SELECT last_name, CONCAT('��������' , job_id) as ��������
FROM employees
WHERE SUBSTR(JOB_ID, 4, 3 ) = 'REP';
--job_id�� 4��°���ں��� REP�� ���

SELECT employee_id,
    concat(first_name,last_name) ��ü�̸�,
    last_name,
    LENGTH(last_name) ����,
    INSTR(last_name, 'a') "'a'�� ���°?"
FROM employees;

--���� ġȯ : REPLACE

SELECT job_id, replace(job_id,'ACCOUNT','ACCNT') ����
FROM employees
where job_id like '%ACCOUNT%';

--���� 1 
SELECT UPPER(last_name),lower(last_name), initcap(email)
FROM employees;


--���� 2
select job_id, substr(job_id,1,2)

from employees;



