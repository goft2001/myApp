--������
--������ char �� varchar2 ��
CREATE TABLE COMP (
    char_col CHAR(4),
    varchar_col VARCHAR2(4) );
    
    
    INSERT INTO comp values ('AA' , 'AA' ) ;
    INSERT INTO comp values ('AAA' , 'AAA' );
    INSERT INTO comp values ('AAAA' , 'AAAA' );    
    commit;
    ROLLBACK;
    
    SELECT * FROM COMP;
    
    SELECT * FROM COMP
    WHERE char_col = varchar_col; --VARCHAR 2 �� �ڿ� ������ �ڸ��ϰ� �־� Ǯ�� ä�������� ���ٰ� ����
    --char�� �������� ������ Ÿ��, varchar2�� �������� ������ Ÿ��
    
    
    -- ������ ������ Ÿ�� NUMBER
    -- NUMBER(p,s) p�� ��ȿ�ڸ��� 1 ~ 38 , s �� �Ҽ��� ��ȿ�ڸ���
    
    --DATE Ÿ��
    SELECT hire_date, to_char(hire_date, 'YYYY-mm-dd') "��¥=>���ں�ȯ"
    FROM employees;
    
    select *
    from employees
    where hire_date <'2002-03-03';
    --����Ŭ�� �ڵ����� ������ ���ڸ� ���� ������ ��¥���� �°� �� ��ȯ�Ͽ� ����
    