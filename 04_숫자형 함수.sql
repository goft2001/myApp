--������ �Լ�

--ROUND

SELECT ROUND(15.193,1) �Ҽ�ù°�ڸ�, 
    ROUND(15.193,2) �Ҽ���°�ڸ�, ROUND(15.193)����Ʈ,
    ROUND(15.193,-1) "10���ڸ�",
    ROUND(15.193,-2) "100���ڸ�"
FROM DUAL;

--TRUNC : ����
SELECT TRUNC(15.79,1) �Ҽ�ù°�ڸ�,
        TRUNC(15.79,0) ����,
        TRUNC(15.79) ����Ʈ,
        TRUNC(15.79,-1) "10�� ����",
        TRUNC(115.79,-2) "10�� ����"
    FROM DUAL;
    
    --MOD
    SELECT  employee_id ¦����, last_name
    FROM employees
    where mod(employee_id,2)=0
    order by 1; -- ù��° ���� ����(��������)
    
    
  SELECT  salary, round(salary/30,0) ����, round(salary/30,1)�Ҽ���°,
  round(salary/30,-1) �Ҽ���°
    FROM employees ;

    