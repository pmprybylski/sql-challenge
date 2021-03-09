-- Drop tables to prevent duplication issues
DROP TABLE dept_emp CASCADE;
DROP TABLE dept_manager CASCADE;
DROP TABLE departments CASCADE;
DROP TABLE salaries CASCADE;
DROP TABLE employees CASCADE;
DROP TABLE titles CASCADE;

-- Create new tables
CREATE TABLE titles (
    title_id TEXT PRIMARY KEY NOT NULL,
    title TEXT NOT NULL
);

CREATE TABLE employees (
    emp_no INTEGER PRIMARY KEY NOT NULL,
    emp_title_id TEXT NOT NULL,
    birth_date DATE NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    sex TEXT NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries (
    emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
)

CREATE TABLE departments (
    dept_no TEXT PRIMARY KEY NOT NULL,
    dept_name TEXT NOT NULL
);

CREATE TABLE dept_manager (
    dept_no TEXT NOT NULL,
    emp_no INTEGER NOT NULL,
    PRIMARY KEY(dept_no, emp_no),
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
)

CREATE TABLE dept_emp (
    emp_no INTEGER NOT NULL,
    dept_no TEXT NOT NULL,
    PRIMARY KEY(emp_no, dept_no),
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
)