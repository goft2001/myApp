--day6


--DATETYPE : ������ Ÿ��(�ڷ���)�̶� ��ǻ�� �ý��۰� ���α׷��� ���� �Ǽ�, ����, �Ҽ� �ڷ��� ���� ���� ������
--�����͸� �ĺ��ϴ� Ÿ�����μ�, �ش� �ڷ����� ���� ������ ��, �ش� �ڷ������� ������ �� �� �ִ� ��ɾ�, �������� ����
-- �ǹ�, ũ��� �ش� �ڷ����� ���� ����Ǵ� ����̴�.

--������
--������ char �� varchar2 ��
CREATE TABLE COMP (
    char_col CHAR(4),
    varchar_col VARCHAR2(4)
    );
INSERT INTO comp VALUES ('AA', 'AA');
INSERT INTO comp VALUES ('AAA', 'AAA');
INSERT INTO comp VALUES ('AAAA', 'AAAA');
COMMIT;
ROLLBACK;


SELECT * FROM comp;

SELECT * FROM comp
WHERE char_col = varchr_col;
-- char�� �������� ������ Ÿ��, carchar2�� �������� ������ Ÿ��



--������ ������ Ÿ�� NUMBER
--NUMBER(p,s) : p�� ��ȿ�ڸ��� 1~38, s�� �Ҽ��� ��ȿ�ڸ���



--DATE Ÿ��
SELECT hire_date, to_char(hire_date, 'YYYY-MM-DD') "��¥=>���� ����ȯ"
FROM employees;

SELECT *
FROM employees
WHERE hire_date < '2002/03/03';
--����Ŭ���� �ڵ��� ������ ���ڸ� ������ ��¥�� Ÿ�Կ� �°� ����ȯ �Ͽ� ����.










