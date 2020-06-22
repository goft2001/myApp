--day6



--DELETE 데이터 삭제
-- WHERE 절의 조건에 해당하는 행단위로 데이터를 삭제한다
-- 테이블을 삭제해도 테이블의 물리적인 구조는 변하지 않는다.

--71번~75번 부서번호 삭제
DELETE FROM departments
WHERE department_id BETWEEN 71 AND 75;
COMMIT;


--employees 테이블 id 1번 2번 삭제
DELETE FROM employees
WHERE employee_id IN (1, 2);
COMMIT;


--테이블 전체 삭제 : 테이블은 그대로 있고 데이터만 삭제 ( ROLLBACK 가능)
DELETE FROM copy_departments;
ROLLBACK;


--TRUNCATE : 전체 삭제(ROLLBACK 불가능)
TRUNCATE TABLE copy_departments;
ROLLBACK;


--DROP TABLE : 테이블 삭제
DROP TABLE copy_departments;
DROP TABLE copy_dept;
DROP TABLE xx_emp;


--SAVE POINT(세이브 포인트) : 중간저장 (ROLLBACK TO SAVEPOINT하면 savepoint 상태로 돌아옴)
SELECT * FROM copy_emp
WHERE employee_id = 108;  --salary 12008

UPDATE copy_emp
SET salary = salary + 10
WHERE employee_id = 108;
-- salary 값이 12018
-- 세이브 포인트 만들기
SAVEPOINT A;


UPDATE copy_emp
SET salary = salary + 20
WHERE employee_id = 108;


--세이브포인트로 롤백
ROLLBACK TO SAVEPOINT A;
--salary 값이 12018
--롤백
ROLLBACK;

COMMIT;




