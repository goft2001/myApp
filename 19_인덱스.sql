--�ε��� Ȯ���ϱ�
    SELECT
        TABLE_NAME ���̺��,
        INDEX_NAME �ε����̸�,
        COLUMN_NAME �÷��̸�
    FROM ALL_IND_COLUMNS  -- ����Ŭ���� �ڵ� ������
    WHERE TABLE_NAME = 'DEPARTMENTS' ; -- ���̺��̸��� �빮�ڷ�
   
   drop table members;
    
--�ǽ����� ���̺� �����
CREATE  TABLE members (
    member_id NUMBER,
    first_name varchar2(100) not null,
    last_name varchar2(100) not null,
    gender char(1) not null,
    dob date not null,
    email varchar2(255) not null,
    primary key(member_id)
 );
desc members;
--�ε��� Ȯ���ϱ�
    SELECT
        TABLE_NAME ���̺��,
        INDEX_NAME �ε����̸�,
        COLUMN_NAME �÷��̸�
    FROM ALL_IND_COLUMNS  -- ����Ŭ���� �ڵ� ������
    WHERE TABLE_NAME = 'MEMBERS' ; -- �⺻������ �� �Ѱ��� �ε��� PK �� ����
     
    SELECT * FROM members
    where last_name = 'Harse' ; -- ���̺� ��ü �˻�
    
    EXPLAIN plan for  -- ���� ������ select ���� �����Ͽ� ���� �ۼ�
    select*from members
    where last_name = 'Harse';
    
    select plan_table_output  -- ������ ���
    from table(dbms_xplan.display());
    
    
    -- �ε��� �����
    CREATE INDEX members_last_name_i
    ON members(last_name);
    
    --�ε��� �����ϱ�
    DrOP INDEX members_last_name_i;
    
    select *
    from members
    where first_name like 'M%' AND LAST_NAME LIKE 'A%';
    
    --��Ƽ �ε��� �����
    CREATE INDEX name_i
    on members(first_name, last_name);
    
    --������
       EXPLAIN plan for  
    select*from members
  where first_name like 'M%' AND LAST_NAME LIKE 'A%';
    
    select plan_table_output  
    from table(dbms_xplan.display());
    
--�ε��� �����ϱ�
drop index name_i;

