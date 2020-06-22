-- ���������� �߰� �� ����
-- Ŭ���� ���̺� ����
DROP TABLE class;

create table class ( 
    cno varchar2 (2),
    cname varchar2(50)
);
-- ���̺��� �� ���� �Է�
insert into class values( '01', '�����ͺ��̽�');
insert into class values( '02', '�ڹ�');
select* from class;

--�л� ���̺� ����
create table student ( 
    sno varchar2(4),
    sname varchar2(50),
    cno varchar2(2)
    );
    
-- �л� ���̺� �� ���� �Է�
delete from student;
INSERT INTO student VALUES ( '0414' , 'ȫ�浿' , '01');
INSERT INTO student VALUES ( '0415' , '�Ӳ���' , '02');
INSERT INTO student VALUES ( '0416' , '�̼���' , '03');
commit;

select * from student;

--Ŭ���� ���̺� �⺻Ű �߰�
ALTER TABLE class
add CONSTRAINT class_cno_pk PRIMARY KEY(CNO);
--�⺻Ű�� �ΰ��̳� �ߺ��� �� ����

INSERT INTO class VALUES ( null,'�����ͺ��̽�');

--Ŭ���� ���̺� ����ũ Ű�� �߰�
ALTER TABLE class
ADD CONSTRAINT class_cname_uk UNIQUE (cname);
--����ũ�� �ߺ��ȵ�
INSERT INTO class VALUES( '03', '�����ͺ��̽�'); -- ������ �ߺ�

--���������� ��ȸ�ϴ� ��ɹ�
SELECT *
FROM ALL_CONSTRAINTS -- ��� ���� ����
WHERE table_name = 'DEPARTMENTS'; --���̺�� �Է½� �빮��

--�л� ���̺� �⺻Ű�� �߰�
ALTER TABLE student
ADD CONSTRAINT student_sno_pk PRIMARY KEY(sno);
-- �л� ���̺��� sname�� NOT NULL �߰�
ALTER TABLE student
MODIFY sname CONSTRAINT student_sname_nm NOT NULL;
--�л� ���̺� �ܷ�Ű �߰�
ALTER TABLE student
ADD CONSTRAINT studenmt_cno_fk FOREIGN KEY(cno)
REFERENCES class(cno); --Ŭ���� ���̺� cno ���� ����

select * from  class;
select * from  student;
-- ���������� �߰��Ҷ� �̹� ������� ���̺� �� ���� �����Ͱ� �����ؾ� 
-- ���������� �߰��� �ȴ�.
UPDATE student set cno = '01'
where sno = '0416'; 

-- ���������� ����
--���������� �̸����� ����

ALTER TABLE class 
DROP CONSTRAINT class_cno_pk CASCADE; -- �⺻Ű�� �����ϴ� �ܷ�Ű�� �־ ������ �ȵ� ���������� cascade �ɼǻ��
-- ������������ ����
ALTER TABLE class
drop UNIQUE(cname); --Ŭ���� ���̺��� CNAME ���� ����ũ �������� ����
ALTER TABLE class
drop PRIMARY KEY; --�⺻Ű ����

-- ���̺��� ����
DROP TABLE class;
DROP TABLE student;

--���̺� �÷�(��)�� �߰��� ����


-- 90�� �μ��� �������� �����̺� E_EMP�� �Է�
CREATE TABLE E_EMP
AS
SELECT employee_id, last_name,salary,department_id
FROM employees
WHERE department_id = 90;

-- ���� �̸��� �����ؼ� E_EMP2 ���̺� ����


CREATE TABLE E_EMP2(emp_id, name, sal, dept_id)
AS
SELECT employee_id, last_name,salary,department_id
FROM employees
WHERE department_id = 90;

SELECT
    *
FROM e_emp2;

--���� �߰�
SELECT
    *
FROM E_EMP;

ALTER TABLE E_EMP
ADD( GENDER VARCHAR2(1));
--����Ʈ ���� 0DMFH GKSMS DUF CNRK
ALTER TABLE E_EMP
ADD( Ŀ�̼� NUMBER DEFAULT 0 NOT NULL);
--�ΰ��� ���� �߰�
ALTER TABLE E_EMP
ADD( ��¥ DATE default SYSDATE, ������ VARCHAR2(100)DEFAULT USER);

ALTER TABLE E_EMP
DROP COLUMN WPWKRWK;

--���� ����
SELECT
    *
FROM E_EMP;

ALTER TABLE E_EMP
MODIFY (������ VARCHAR2(200)); --���� (100) �̾����� (200)���� ������ ��
DESC E_EMP;


ALTER TABLE E_EMP
MODIFY (������ VARCHAR2(50)); --���� (100) �̾����� (200)���� ������ ��
DESC E_EMP;

ALTER TABLE E_EMP
MODIFY (������ VARCHAR2(1)); -- ���� �̹� 2����Ʈ�� ���ֱ� ������ ������ �߻� �ּ� 2����Ʈ�� �Ǿ���� 
ALTER TABLE E_EMP
MODIFY (������ NUMBER); -- �̹� ������ �����Ͱ� �ֱ⶧���� ���������� �ٲܼ��� ����  

SELECT *FROM E_EMP;
DESC e_emp;

-- NULL ���� ��� �Էµ� ���� ���⶧���� ������ ������ �ٲ� �� ����
ALTER TABLE E_EMP
MODIFY (GENDER NUMBER); -- �̹� ������ �����Ͱ� �ֱ⶧���� ���������� �ٲܼ��� ����  


--�������� ������ ������ �ٲٷ� �ϸ� 
UPDATE E_EMP
SET ������ = NULL;

ALTER TABLE E_EMP
MODIFY (������ VARCHAR2(1)); -- ���� �̹� 2����Ʈ�� ���ֱ� ������ ������ �߻� �ּ� 2����Ʈ�� �Ǿ���� 
ALTER TABLE E_EMP
MODIFY (������ NUMBER); 

--���� ����
ALTER TABLE e_emp
drop column ������; --������ �� ����
--�������� �� ����
ALTER TABLE e_emp
drop(gender,Ŀ�̼�,��¥);

SELECT
    *
FROM e_emp;

-- ���� �̸� ����
ALTER TABLE e_emp
rename COLUMN department_id to �μ���ȣ;
ALTER TABLE e_emp
rename COLUMN salary to �޿�;
ALTER TABLE e_emp
rename COLUMN employee_id to ������ȣ;
ALTER TABLE e_emp
rename COLUMN last_name to �̸�;
-- ���̺��� �̸� ����
rename E_EMP TO �������̺�;
SELECT
    *
FROM �������̺�;


--���� 1 
drop table stmans;
create table  stmans(id,job,sal)
as
select employee_id,job_id,salary
from employees
where job_id = 'ST_MAN';

SELECT
    *
FROM stmans;







