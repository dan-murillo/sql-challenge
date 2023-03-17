-- Schema
-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/ and edited by Daniel Murillo.

-- Created a table for the 'departments.csv' file with a PK, appropriate data types, the
-- NOT NULL condition, and accurate value lengths when necessary.
CREATE TABLE "departments" (
    "id" int   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "id"
     )
);

-- Created a table for the 'dept_emp.csv' file with a PK, appropriate data types, the NOT NULL
-- condition, and accurate value lengths when necessary.
CREATE TABLE "dept_emp" (
    "id" int   NOT NULL,
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "id"
     )
);

-- Created a table for the 'dept_manager.csv' file with a PK, appropriate data types, the
-- NOT NULL condition, and accurate value lengths when necessary.
CREATE TABLE "dept_manager" (
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no"
     )
);

-- Created a table for the 'employees.csv' file with a PK, appropriate data types, the
-- NOT NULL condition, and accurate value lengths when necessary.
CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" VARCHAR(5)   NOT NULL,
    "birth_date" VARCHAR(10)   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

-- Created a table for the 'salaries.csv' file with a PK, appropriate data types, and the
-- NOT NULL condition.
CREATE TABLE "salaries" (
    "id" int   NOT NULL,
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "id"
     )
);

-- Created a table for the 'titles.csv' file with a PK, appropriate data types, the NOT NULL
-- condition, and accurate value lengths when necessary.
CREATE TABLE "titles" (
    "id" int   NOT NULL,
    "title_id" VARCHAR(5)   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "id"
     )
);


-- I used the code exported from QuickDBD to assign the FKs. The code altered the tables, added
-- constraints, and assigned FKs after the tables were created.

-- Altered the 'dept_emp' table to add a constraint to turn its 'emp_no' column into a FK that
-- referenced the 'emp_no' column from the 'employees' table (the relationship is many-to-one
-- as shown in the 'Physical_ERD' image of this repository).
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- Altered the 'dept_manager' table to add a constraint to turn its 'emp_no' column into a FK
-- that referenced the 'emp_no' column from the 'employees' table (the relationship is
-- one-to-one as shown in the 'Physical_ERD' image of this repository).
ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- Altered the 'salaries' table to add a constraint to turn its 'emp_no' column into a FK that
-- referenced the 'emp_no' column from the 'employees' table (the relationship is one-to-one as
-- shown in the 'Physical_ERD' image of this repository).
ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");





-- [[[VARCHAR FOREIGN KEY????]]]
-- Altered the 'dept_emp' table to add another constraint to turn its 'dept_no' column into a
-- FK that referenced the 'dept_no' column from the 'departments' table (the relationship is
-- many-to-one as shown in the 'Physical_ERD' image of this repository).
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

-- [[[VARCHAR FOREIGN KEY????]]]
-- Altered the 'dept_manager' table to add another constraint to turn its 'dept_no' column into
-- a FK that referenced the 'dept_no' column from the 'departments' table (the relationship is
-- many-to-one as shown in the 'Physical_ERD' image of this repository).
ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

-- [[[VARCHAR FOREIGN KEY????]]]
-- Altered the 'employees' table to add a constraint to turn its 'emp_title_id' column into a
-- FK that referenced the 'title_id' column from the 'titles' table (the relationship is
-- many-to-one as shown in the 'Physical_ERD' image of this repository).
ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");