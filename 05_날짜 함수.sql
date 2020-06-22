-- ��¥�� �Լ�
SELECT  first_name, hire_date  --��¥���� ������
FROM employees;


--sysdate ���� ��¥�� �ð�
SELECT SYSDATE
FROM DUAL;

--��¥ + ���� => ��¥
SELECT SYSDATE, SYSDATE+3, SYSDATE-3
FROM DUAL;

-- ��¥ - ��¥ = �� �ϼ�
SELECT employee_id, SYSDATE, hire_date,
    SYSDATE - hire_date, ROUND(SYSDATE - hire_date)
FROM employees;

--�ð����
SELECT SYSDATE + 5/24   --�ð� 1(�Ϸ�)
FROM DUAL;

-- MONTHS_BETWEEN : ���� ���
SELECT employee_id, first_name, 
    ROUND (MONTHS_BETWEEN(SYSDATE, hire_date)),
    (SYSDATE - hire_date)/30
FROM employees;

-- ADD_MONTHS: ���� ����
SELECT employee_id, first_name, hire_date,
    ADD_MONTHS (hire_date, 4)   --4�� ���ϱ�
FROM employees;


--NEXT_DAY (��¥, ������ ���� ����)
SELECT SYSDATE, NEXT_DAY (SYSDATE, 'ȭ����')
FROM DUAL;


--LAST_DAY(��¥) : �� ���� ������ ��
SELECT LAST_DAY (SYSDATE)
FROM DUAL;


--��¥�� �ݿø�
SELECT employee_id, hire_date,
    ROUND(hire_date, 'MONTH') ��,  --������ �ݿø�  1��
    ROUND(hire_date, 'YEAR') ��   --������ �ݿø� 1�� 1��
    
FROM employees
WHERE MONTHS_BETWEEN (SYSDATE, hire_date) < 150;

--����1)
SELECT SYSDATE, HIRE_DATE, MONTHS_BETWEEN (SYSDATE, hire_date)
FROM employees
WHERE department_id = 100;

--����2)
SELECT hire_date, ADD_MONTHS (hire_date, 3) , ADD_MONTHS (hire_date, -3)
FROM employees
WHERE employee_id BETWEEN 100 AND 106;





