--day6




-- UPDATE: ������ �����ϱ�


--������Ʈ ���� WHERE ���� �׻� �⺻Ű�� Ȱ���Ѵ�.
CREATE TABLE copy_emp
AS
SELECT * FROM employees;

UPDATE copy_emp
SET salary = 24100
WHERE employee_id = 100;
COMMIT;


--�ǵ�ġ �ʰ� �̸��� ���� ����� ������Ʈ��
UPDATE copy_emp
SET salary = 24100
WHERE first_name = 'Steven';
COMMIT;


--WHERE ���� �Ƚ�����
UPDATE copy_emp
SET phone_number = '123-456-789';
ROLLBACK;


--����1) 
--copy_dept ���̺��� '���ߺ� 4, 5'�μ��� �Ŵ����� location ID�� ������Ʈ �غ���.
UPDATE copy_dept
SET manager_id = 100, location_id = 1800
WHERE department_id = 74;

UPDATE copy_dept
SET manager_id = 100, location_id = 1800
WHERE department_id = 5;


INSERT INTO copy_dept ( department_id, department_name, manager_id, location_id)
VALUES (280, 'Music', 100, 1800);


--����2)
-- copy_dept  ���̺��� department_id 150���� 200���� �μ���ȣ�� manager_id�� 100���� �����϶�.
UPDATE copy_dept
SET manager_id = 100
WHERE department_id BETWEEN 150 AND 200;





