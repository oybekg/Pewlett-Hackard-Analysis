﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Departments] (
    [dept_no] varchar  NOT NULL ,
    [dept_name] varchar  NOT NULL ,
    CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [Dept_Emp] (
    [emp_no] int  NOT NULL ,
    [dept_no] varchar  NOT NULL ,
    [from_date] date  NOT NULL ,
    [to_date] date  NOT NULL ,
    CONSTRAINT [PK_Dept_Emp] PRIMARY KEY CLUSTERED (
        [emp_no] ASC,[dept_no] ASC
    )
)

CREATE TABLE [Dept_Manager] (
    [dept_no] varchar  NOT NULL ,
    [emp_no] int  NOT NULL ,
    [from_date] date  NOT NULL ,
    [to_date] date  NOT NULL ,
    CONSTRAINT [PK_Dept_Manager] PRIMARY KEY CLUSTERED (
        [dept_no] ASC,[emp_no] ASC
    )
)

CREATE TABLE [Employees] (
    [emp_no] int  NOT NULL ,
    [birth_date] date  NOT NULL ,
    [first_name] varchar  NOT NULL ,
    [last_name] varchar  NOT NULL ,
    [gender] varchar  NOT NULL ,
    [hire_date] date  NOT NULL ,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Salaries] (
    [emp_no] int  NOT NULL ,
    [salary] varchar  NOT NULL ,
    [from_date] date  NOT NULL ,
    [to_date] date  NOT NULL ,
    CONSTRAINT [PK_Salaries] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Titles] (
    [emp_no] int  NOT NULL ,
    [title] varchar  NOT NULL ,
    [from_date] date  NOT NULL ,
    [to_date] date  NOT NULL ,
    CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

ALTER TABLE [Departments] WITH CHECK ADD CONSTRAINT [FK_Departments_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Dept_Manager] ([dept_no])

ALTER TABLE [Departments] CHECK CONSTRAINT [FK_Departments_dept_no]

ALTER TABLE [Dept_Emp] WITH CHECK ADD CONSTRAINT [FK_Dept_Emp_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Dept_Emp] CHECK CONSTRAINT [FK_Dept_Emp_emp_no]

ALTER TABLE [Dept_Emp] WITH CHECK ADD CONSTRAINT [FK_Dept_Emp_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Departments] ([dept_no])

ALTER TABLE [Dept_Emp] CHECK CONSTRAINT [FK_Dept_Emp_dept_no]

ALTER TABLE [Dept_Manager] WITH CHECK ADD CONSTRAINT [FK_Dept_Manager_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Dept_Manager] CHECK CONSTRAINT [FK_Dept_Manager_emp_no]

ALTER TABLE [Employees] WITH CHECK ADD CONSTRAINT [FK_Employees_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Titles] ([emp_no])

ALTER TABLE [Employees] CHECK CONSTRAINT [FK_Employees_emp_no]

ALTER TABLE [Salaries] WITH CHECK ADD CONSTRAINT [FK_Salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Salaries] CHECK CONSTRAINT [FK_Salaries_emp_no]

ALTER TABLE [Titles] WITH CHECK ADD CONSTRAINT [FK_Titles_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Salaries] ([emp_no])

ALTER TABLE [Titles] CHECK CONSTRAINT [FK_Titles_emp_no]

COMMIT TRANSACTION QUICKDBD