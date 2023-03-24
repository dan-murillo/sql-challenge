-- SCHEMA
-- Created with and exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- by Daniel Murillo. There were three sections in the process of creating the table schemas,
-- importing the data, and adding the FK constraints:



-- FIRST STAGE:
-- I created a table schema for each of the six CSV files:

-- Created a table for the 'departments.csv' file with the 'dept_no' column as PK —because its
-- values were unique— and assigned appropriate data types, the NOT NULL instruction, and
-- accurate value lengths when necessary.
CREATE TABLE "departments" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

-- Created a table for the 'dept_emp.csv' file with a composite PK that included both the
-- 'emp_no' and 'dept_no' columns because none of their values were unique on their own, and
-- assigned appropriate data types, the NOT NULL instruction, and accurate value lengths.
CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

-- Created a table for the 'dept_manager.csv' file with the 'emp_no' column as PK —because its
-- values were unique— and assigned appropriate data types, the NOT NULL instruction, and
-- accurate value lengths.
CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(4)   NOT NULL,
	"emp_no" int   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no"
     )
);

-- Created a table for the 'employees.csv' file with the 'emp_no' column as PK —because its
-- values were unique— and assigned appropriate data types, the NOT NULL instruction, and
-- accurate value lengths when necessary.
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

-- Created a table for the 'salaries.csv' file with the 'emp_no' column as PK —because its
-- values were unique— and assigned appropriate data types and the NOT NULL instruction.
CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

-- Created a table for the 'titles.csv' file with the 'title_id' column as PK —because its
-- values were unique— and assigned appropriate data types, the NOT NULL instruction, and
-- accurate value lengths when necessary.
CREATE TABLE "titles" (
    "title_id" VARCHAR(5)   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);



-- SECOND STAGE:
-- At this point, I used the 'Import/Export Data...' pgAdmin option to import the data. By doing
-- so before the FKs were specified, I avoided errors that could be due to inserting data that, 
-- according to pgAdmin, could violate the FK constraints that were specified in the third
-- section of this process.



-- THIRD STAGE:
-- This section contains the FKs. Adding the FK constraints after creating the tables and
-- inserting the data worked better because it meant that the tables could be created and
-- updated in any order and it wouldn't cause any errors —should the code be modified for future
-- analyses, it would also be easier to edit the code:

-- Altered the 'dept_emp' table to add a constraint to turn its 'emp_no' column into a FK that
-- referenced the 'emp_no' column from the 'employees' table (the relationship is many-to-one
-- as shown in the 'Physical_ERD' image of this repository).
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- Altered the 'dept_emp' table to add another constraint to turn its 'dept_no' column into a
-- FK that referenced the 'dept_no' column from the 'departments' table (the relationship is
-- many-to-one as shown in the 'Physical_ERD' image of this repository).
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

-- Altered the 'dept_manager' table to add a constraint to turn its 'emp_no' column into a FK
-- that referenced the 'emp_no' column from the 'employees' table (the relationship is
-- one-to-one as shown in the 'Physical_ERD' image of this repository).
ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- Altered the 'dept_manager' table to add another constraint to turn its 'dept_no' column into
-- a FK that referenced the 'dept_no' column from the 'departments' table (the relationship is
-- many-to-one as shown in the 'Physical_ERD' image of this repository).
ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

-- Altered the 'employees' table to add a constraint to turn its 'emp_title_id' column into a
-- FK that referenced the 'title_id' column from the 'titles' table (the relationship is
-- many-to-one as shown in the 'Physical_ERD' image of this repository).
ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

-- Altered the 'salaries' table to add a constraint to turn its 'emp_no' column into a FK that
-- referenced the 'emp_no' column from the 'employees' table (the relationship is one-to-one as
-- shown in the 'Physical_ERD' image of this repository).
ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");
