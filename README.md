# HR Management System Database Project

## Project Overview
This project implements a complete **Human Resource Management System (HRMS) database** developed as part of the Business Informatics course at the German International University.

The project covers the full database development lifecycle including:
- Conceptual database design
- Relational schema creation
- Physical database implementation
- Business logic using SQL procedures, functions, triggers, and views
- Data analytics visualization using **Power BI dashboards**

The goal of the project is to simulate a real-world HR system capable of managing employees, job assignments, performance evaluations, and training programs.

---

# Project Structure

## 1. Database Design
The database was first designed using an **Enhanced Entity Relationship Diagram (EERD)** which models the main entities and their relationships.

The conceptual design was then translated into a **normalized relational schema** ensuring data integrity and proper normalization.

### Main Entities
- Employees
- Departments
- Jobs
- Job Assignments
- Performance Cycles
- KPIs and Objectives
- Training Programs
- Training Certificates
- Appraisals and Appeals

---

## 2. Database Implementation
The relational model was implemented using SQL by creating all required tables with proper constraints.

### Key Features
- Primary and Foreign Key relationships
- Data integrity constraints
- CHECK constraints enforcing business rules
- Sample data population for testing

Each table contains realistic data to allow testing of relationships and queries.

---

## 3. Database Business Logic
To support HR operations, the system includes:

### Stored Procedures
Procedures automate HR tasks such as:
- Adding new employees
- Updating employee contact information
- Assigning jobs to employees
- Creating performance cycles
- Recording KPI scores
- Managing training programs and certifications

### User Defined Functions
Functions perform reusable calculations including:
- Employee age calculation
- Years of service
- KPI weighted scores
- Workforce summary metrics used in dashboards

### Triggers
Triggers enforce important business rules automatically, including:
- Preventing deletion of employees with active assignments
- Ensuring objective weights do not exceed 100%
- Automatically calculating KPI weighted scores
- Preventing deletion of referenced training programs

### Views
Views simplify complex queries and support reporting and dashboards such as:
- Employee count by department
- Gender distribution
- Employment status distribution
- Active job assignments
- KPI performance summaries
- Training participation statistics

---

# Power BI Dashboard

The project also includes a **Power BI dashboard built using database views** to visualize HR data.

The dashboard contains **two main pages**:

### Workforce Overview
Provides a high-level view of the organization including:
- Total number of employees
- Active employees
- Average employee age
- Average years of service
- Employees by department
- Employment status distribution
- Gender distribution

### Job Structure & Salary Insights
Provides insights about job structure including:
- Total jobs in the system
- Active jobs
- Jobs by job level
- Salary statistics by job category
- Active job assignments

These dashboards demonstrate how operational HR data can be transformed into meaningful insights.

---

# Repository Structure
