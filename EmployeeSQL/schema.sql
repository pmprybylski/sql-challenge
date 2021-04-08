-- Drop tables to prevent duplication issues
DROP TABLE dept_emp CASCADE;
DROP TABLE dept_manager CASCADE;
DROP TABLE departments CASCADE;
DROP TABLE salaries CASCADE;
DROP TABLE employees CASCADE;
DROP TABLE titles CASCADE;

-- Create new tables
CREATE TABLE titles (
    title_id VARCHAR PRIMARY KEY NOT NULL,
    title VARCHAR NOT NULL
);

CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
)

CREATE TABLE departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY(dept_no, emp_no),
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
)

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR NOT NULL,
    PRIMARY KEY(emp_no, dept_no),
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
)
