--NULL ���� �Լ�
--NVL : �ΰ��� �ٸ� ������ �ٲܶ� ���
 SELECT last_name, manager_id, NVL(manager_id,0) �Ŵ���
 FROM employees
 where Last_name = 'King';
 
 
 --NVL2(ex,ex1,ex2) : ex���� null���� �ƴϸ� ex1, null���̸� ex2
   SELECT last_name, manager_id, NVL2(manager_id,1,0) �Ŵ���
 FROM employees
 where Last_name = 'King';
 
 --NULLIF(ex1,ex2) : ex1�� ex2���� �����ϸ� NULL
 --�������� ������ ex1���� ���
  SELECT NULLIF(1,1),NULLIF(1,2)
 FROM DUAL;
 
 --COALESCE(ex1,ex2,ex3,......)
 --ex1�� �ΰ��̸� ex2��ȯ ex2���� �ΰ��̸� ex3 ��ȯ ....
select last_name �̸�, salary ����, commission_pct Ŀ�̼�, coalesce((salary + (commission_pct*salary)),salary+2000) �����λ�
from employees
order by 3;


--����1
 
 select last_name �̸�, salary ����, nvl(commission_pct,0) Ŀ�̼�, salary*12+salary*12*nvl(commission_pct,0) ����
 from employees
 order by ���� desc;
 
 --���� 2
 
  select last_name �̸�, salary ����, nvl(commission_pct,0) Ŀ�̼�, salary*12+salary*12*nvl(commission_pct,0) ����
        ,NVL2(commission_pct,'SAL+COMM', 'SAL') �������
 from employees ; 
 
 --���� 3
 SELECT first_name, length(first_name) ���ڼ�, last_name, length(last_name) ���ڼ�2 ,
 NULLIF(length(first_name),length(last_name)) ���
 
     
 FROM employees
 order by first_name desc;
 
 --decode �Լ�
 select last_name �̸�,job_id,salary, DECODE(job_id, 'IT_PROG', salary*1.0, 
                                                     'ST_CLERK', salary*1.15,
                                                    'SA.REP', salary*1.20,
                                                    salary) ��������
 FROM employees;
 
 
 
 --���� 1 
-- trunk ���


select last_name �̸�, job_id ����, salary ����,
decode(TRUNC(salary/2000),
        1 , 0.0,
        2 , 0.09,
        3 , 0.20,
        4 , 0.30,
        5 , 0.40,
        6 , 0.42,
        7 , 0.44,
            0.45) ����
from employees ;



select  employee_id �̸�, first_name, last_name, salary,
case when salary >= 9000  then  '�����޿�'
    when salary >= 6000  then  '�����޿�'
    else                       '�����޿�'
    END "�޿����"
from employees
where job_id = 'IT_PROG';
 
 