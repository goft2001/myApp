--1. ���̺��� ��� ������ ��������
select*from employees;
--2.where ���� ������ ���ǿ� �´� ���� �����Ѵ�.
-- ��ġ�� from �� ������ ��ġ
select*
from employees
where department_id = 90;  --90�� �μ���

select*
from employees
where salary  = 24000;  --������ 24000�� ����
/*

where ���� ����Ҷ� ������
����(String ) rhk skfWk (date) ���� �׻� ����ǥ(')�� ǥ���ؾ���
���ڰ��� ��ҹ��ڸ� �����Ѵ�.(Case-Sensitive)
��¥���� ��¥���˿� ����� �ʵ��� (Format-Sensitive)
����Ŭ�� ��¥������ RR//MM/DD(RR�� 2�ڸ� �⵵)
*/

--3.  WHERE + ���ڿ�

SELECT  employee_id, first_name, Last_name, job_id
FROM employees
where first_name = 'steven';
--4. where + ��¥
SELECT *    
FROM employees
where hire_date >= '03/06/17';

--5 �� ������
select *
from employees
where salary>=10000; --���ں�
select *
from employees
where hire_date >= '03/06/17'; --��¥��
select *
from employees
where first_name     > 'King'; --���ں�(���ĺ���)

--���� 1 ��
SELECT *    
FROM employees
where employee_id = '100';
--���� 2��
SELECT *    
FROM employees
where first_name = 'David';
--���� 3��
SELECT *    
FROM employees
where employee_id <= '105';
--���� 4��
SELECT *    
FROM job_history
where start_date >= '06/03/03';
--���� 5��
SELECT *    
FROM departments
where location_id != '1700';  -- <> : ���� �ʴ� ǥ�� 

-- 6. AND OR
SELECT *
FROM employees
where ( department_id = 60 or 
    department_id = 80 ) and salary>10000;
    
select *
from employees
WHERE NOT(hire_date > '04/01/01' or salary > 5000);
      -- = HIRE_DATE<='04/01/01' AND SALARY <= 5000)
    
    --���� 1 
 SELECT *
FROM employees
where salary>4000 AND job_id ='IT_PROG';
    
    --���� 2
 SELECT *
FROM employees
where salary>4000 
AND (job_id ='IT_PROG'
OR job_id = 'FI_ACCOUNT');


-- IN ������
SELECT *
from employees
where salary = 4000 or salary =3000 or salary =2700;

select *
from employees
where salary In(4000,3000,2700);    -- ���� ���ǰ� ����� ����

--����
SELECT *
from employees
where salary In(10000,17000,24000);   
SELECT *
from employees
where department_id not in(30,50,80,100,110);    


-- Between ������
    select *
    from employees
    where salary > =9000 and salary <=10000;
    
    select *
    from employees
    where salary BETWEEN 9000 AND 10000;
    

���� 1 


    select *
    from employees
    where salary BETWEEN 1000 AND 20000;
    
���� 2
    select *
    from employees
    where hire_date BETWEEN '04/01/01' AND '04/12/30';
    
���� 3

    select *
    from employees
    where salary not BETWEEN 7000 AND 17000;
    


/*
 Like �����ڴ� _ �� % �� ���
 % ���ڰ� 0�� �Ǵ� 1�� �̻�
 _�� ���ڰ� 1��
 */
 
 select*
 From employees
 where last_name like 'B%'; 
 
 

 
 select*
 From employees
 where fIRST_name like '_d%'; 


 
 select*
 From employees
 where first_name like '__s%'; -- ����° ���ڰ� s �϶� 
  

--���� 1��

 
 select*
 From employees
 where job_id like '%AD%'; 

--���� 2��

 select*
 From employees
 where job_id like '%AD___'; 
 
 --���� 3��
  select*
 From employees
 where phone_number like '%1234'; 
 
 --���� 4��
 select*
 From employees
 where phone_number NOT LIKE '%3%' AND phone_number like '%9';     

--���� 5��
  select*
 From employees
 where job_id like '%MGR%' or job_id like '%ASST%'; 


-- IS NULL / IS NOT NULL

 select*
 From employees
 where commission_pct IS NULL;   -- =NULL �� �Ұ�/ NULL�� ���� �ִ� �� �ƴϱ⶧���� IS NULL �̳� IS NOT NULL�� �����
 
 

 select*
 From employees
 where commission_pct IS NOT NULL; 
 
 -- ���� 
 
  select*
 From employees
 where manager_id IS NULL; 
 
 --ORDER BY ���� ���� (�⺻�� ���������� ǥ�õǰ� ������ Ŀ�� - ��������) 
 SELECT *
 FROM employees
 ORDER BY salary;

-- DESC �� �� �ݴ� ��������
SELECT *
 FROM employees
 ORDER BY salary DESC;

SELECT *
 FROM employees
 ORDER BY LAST_NAME; --���ڴ� ���ĺ� �� (A -- Z )


--��Ƽ ����
SELECT employee_id,last_name,department_id
    
FROM employees
ORDER BY department_id , employee_id desc;

--�μ���ȣ�� ������, �����ȣ�� ���� 

--���� �����Ͽ� ����
SELECT employee_id,last_name,salary*12 ����
FROM employees
ORDER BY ���� desc;

--order by �� where �� ������ ��ġ

SELECT employee_id,first_name, department_id,salary*12 ����
 FROM employees
 where department_id = 90  --90�� �μ�
 ORDER BY ���� desc; --������ ū������ ����


--���� 1
SELECT employee_id,first_name, last_name
 FROM employees
 ORDER BY employee_id DESC;
 
 
--���� 2
SELECT *
 FROM employees
 where job_id LIKE '%CLERK%'
 ORDER BY salary DESC;
 



SELECT employee_id , department_id , salary
 FROM employees
 where employee_id BETWEEN 120 AND 150
 ORDER BY DEPARTMENT_ID desc,salary desc ;
 





