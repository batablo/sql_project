CREATE TABLE position (
  id               INT            NOT NULL PRIMARY KEY,
  name             VARCHAR(20)    NOT NULL
);

CREATE TABLE department (
  id               INT            NOT NULL PRIMARY KEY,
  name             VARCHAR(20)    NOT NULL
);

CREATE TABLE worker (
  id               INT            AUTO_INCREMENT,
  name             VARCHAR(20)    NOT NULL,
  birthday         DATE,
  sex              INT,
  joining_date     DATE,
  position_id      INT,
  PRIMARY KEY (id),
  FOREIGN KEY (position_id) REFERENCES position (id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE worker_department (
  worker_id        INT            ,
  department_id    INT            ,
  FOREIGN KEY (worker_id) REFERENCES worker (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (department_id) REFERENCES department (id) ON DELETE SET NULL ON UPDATE CASCADE
);


-- -- ### Q3.作成したテーブルから下記を抽出するSQLを作成してください。
-- -- - 経理部に所属している社員一覧
-- SELECT id, name, birthday, sex, joining_date, position_id, department_id
-- FROM worker
-- JOIN worker_department
-- ON worker.id = worker_department.worker_id
-- WHERE department_id = 1;

-- -- -- - 全社員の部署順、役職順、勤続年数順の一覧
-- SELECT id, name, birthday, sex, joining_date, position_id, department_id
-- FROM worker
-- JOIN worker_department
-- ON worker.id = worker_department.worker_id
-- ORDER BY department_id ASC;

-- SELECT *
-- FROM worker
-- ORDER BY position_id ASC;

-- SELECT  *
-- FROM worker
-- ORDER BY joining_date ASC;

-- -- - 部署ごとの所属人数（所属人数が多い順に取得）
-- SELECT COUNT(*) AS number
-- FROM worker
-- JOIN worker_department
-- ON worker.id = worker_department.worker_id
-- GROUP BY department_id
-- ORDER BY number DESC;

-- -- - 兼任している社員とその所属部署（部署名はカンマ区切りの文字列で取得）
-- SELECT id, name, birthday, sex, joining_date, position_id, GROUP_CONCAT(department_id ORDER BY department_id ASC SEPARATOR ',') as 'departments'
-- FROM worker
-- JOIN worker_department
-- ON worker.id = worker_department.worker_id
-- GROUP BY id
-- HAVING COUNT(worker.id) > 1;

-- -- - 所属人数が5名以上の部署に所属する女性社員
-- SELECT id, name, birthday, sex, joining_date, position_id, department_id
-- FROM worker
-- INNER JOIN (
--   SELECT *
--   FROM worker_department
--   INNER JOIN (
--     SELECT department_id AS d_id, COUNT(department_id)
--     FROM worker_department
--     GROUP BY department_id
--     HAVING COUNT(department_id) >= 5
--   ) AS cnt
--   ON worker_department.department_id = cnt.d_id
-- ) AS pro
-- ON worker.id = pro.worker_id
-- WHERE sex = 2;

