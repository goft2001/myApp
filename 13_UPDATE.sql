--day6




-- UPDATE: 데이터 수정하기


--업데이트 사용시 WHERE 절에 항상 기본키를 활용한다.
CREATE TABLE copy_emp
AS
SELECT * FROM employees;

UPDATE copy_emp
SET salary = 24100
WHERE employee_id = 100;
COMMIT;


--의도치 않게 이름이 같은 사람이 업데이트됨
UPDATE copy_emp
SET salary = 24100
WHERE first_name = 'Steven';
COMMIT;


--WHERE 절을 안썼을때
UPDATE copy_emp
SET phone_number = '123-456-789';
ROLLBACK;


--예제1) 
--copy_dept 테이블의 '개발부 4, 5'부서의 매니저와 location ID를 업데이트 해보자.
UPDATE copy_dept
SET manager_id = 100, location_id = 1800
WHERE department_id = 74;

UPDATE copy_dept
SET manager_id = 100, location_id = 1800
WHERE department_id = 5;


INSERT INTO copy_dept ( department_id, department_name, manager_id, location_id)
VALUES (280, 'Music', 100, 1800);


--예제2)
-- copy_dept  테이블에서 department_id 150부터 200까지 부서번호의 manager_id를 100으로 수정하라.
UPDATE copy_dept
SET manager_id = 100
WHERE department_id BETWEEN 150 AND 200;





