CREATE DATABASE HR_SYSTEM;
USE HR_SYSTEM;
CREATE TABLE UNIVERSITY (
    University_ID INT PRIMARY KEY,
    University_Name VARCHAR(50) NOT NULL,
    Acronym VARCHAR(20),
    Established_Year INT,
    Accreditation_Body VARCHAR(64),
    Address VARCHAR(64),
    Contact_Email VARCHAR(20) CHECK (Contact_Email LIKE '%@%'),
    Website_URL VARCHAR(64) CHECK (Website_URL LIKE 'http%')
);
CREATE TABLE FACULTY (
    Faculty_ID INT PRIMARY KEY,
    Faculty_Name VARCHAR(50) NOT NULL,
    Location VARCHAR(64),
    Contact_Email VARCHAR(20) CHECK (Contact_Email LIKE '%@%'),
    University_ID INT,
    FOREIGN KEY (University_ID) REFERENCES UNIVERSITY(University_ID) ON UPDATE CASCADE ON DELETE SET NULL
);
CREATE TABLE DEPARTMENT (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50) NOT NULL,
    Department_Type VARCHAR(20) CHECK (Department_Type IN('Academic', 'Administrative')) NOT NULL,
    Location VARCHAR(64),
    Contact_Email VARCHAR(20) CHECK (Contact_Email LIKE '%@%')
);
CREATE TABLE ACADEMIC_DEPARTMENT (
    Department_ID INT PRIMARY KEY,
    Faculty_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES DEPARTMENT(Department_ID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Faculty_ID) REFERENCES FACULTY(Faculty_ID) ON UPDATE CASCADE ON DELETE SET NULL
);
CREATE TABLE ADMINISTRATIVE_DEPARTMENT (
    Department_ID INT PRIMARY KEY,
    University_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES DEPARTMENT(Department_ID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (University_ID) REFERENCES UNIVERSITY(University_ID)ON UPDATE CASCADE ON DELETE SET NULL
);
CREATE TABLE EMPLOYEE (
    Employee_ID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Middle_Name VARCHAR(50),
    Last_Name VARCHAR(50) NOT NULL,
    Arabic_Name NVARCHAR(50),
    Gender VARCHAR(20) CHECK (Gender IN ('Male','Female')),
    Nationality VARCHAR(64),
    DOB DATE,
    Place_of_Birth VARCHAR(64),
    Marital_Status VARCHAR(64),
    Religion VARCHAR(20),
    Employment_Status VARCHAR(20) CHECK (Employment_Status IN('Active','Probation','Leave','Retired')) NOT NULL,
    Mobile_Phone VARCHAR(20) CHECK (Mobile_Phone REGEXP '^[0-9]{10,15}$'),
    Work_Phone VARCHAR(20),
    Work_Email VARCHAR(20) CHECK (Work_Email LIKE '%@%'),
    Personal_Email VARCHAR(20) CHECK (Personal_Email LIKE '%@%'),
    Emergency_Contact_Name VARCHAR(50) NOT NULL,
    Emergency_Contact_Phone VARCHAR(20) NOT NULL,
    Emergency_Contact_Relationship VARCHAR(20) NOT NULL,
    Residential_City VARCHAR(20) NOT NULL,
    Residential_Area VARCHAR(20) NOT NULL,
    Residential_Street VARCHAR(20) NOT NULL,
    Residential_Country VARCHAR(20) NOT NULL,
    Permanent_City VARCHAR(20),
    Permanent_Area VARCHAR(20),
    Permanent_Street VARCHAR(20),
    Permanent_Country VARCHAR(20),
    Medical_Clearance_Status VARCHAR(50),
    Criminal_Status VARCHAR(50)
);

CREATE TABLE Employee_Disability (
	Disability_ID INT AUTO_INCREMENT PRIMARY KEY, 
    Disability_Type VARCHAR(100),
    Employee_ID INT,
    Severity_Level VARCHAR(50) CHECK (Severity_Level IN ("Severe", "Medium" , "Mild")),
    Required_Support VARCHAR(255),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID) ON UPDATE CASCADE ON DELETE SET NULL
);
CREATE TABLE Social_Insurance (
    Insurance_ID INT AUTO_INCREMENT PRIMARY KEY,
    Employee_ID INT,
    Insurance_Number VARCHAR(100) NOT NULL,
    Coverage_Details VARCHAR(255),
    Start_Date DATE,
    End_Date DATE,
    Status VARCHAR(50),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID) ON UPDATE CASCADE ON DELETE SET NULL
);
CREATE TABLE Educational_Qualification (
    Qualification_ID INT AUTO_INCREMENT PRIMARY KEY,
    Employee_ID INT,
    Institution_Name VARCHAR(100) NOT NULL,
    Major VARCHAR(100),
    Degree_Type VARCHAR(50),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE Professional_Certificate (
    Certificate_ID INT AUTO_INCREMENT PRIMARY KEY,
    Employee_ID INT ,
    Certification_Name VARCHAR(100) NOT NULL,
    Issuing_Organization VARCHAR(100),
    Issue_Date DATE,
    Expiry_Date DATE,
    Credential_ID VARCHAR(100),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE Training_Program (
    Program_ID INT AUTO_INCREMENT PRIMARY KEY,
    Program_Code VARCHAR(50),
    Title VARCHAR(100) NOT NULL,
    Objectives VARCHAR(100),
    Type VARCHAR(50) CHECK(Type IN ("Internal","External", "Classroom", "Online" , "On-the-job")) ,
    Subtype VARCHAR(50),
    Delivery_Method VARCHAR(50) CHECK( Delivery_Method IN ("In-person","Virtual","Blended")) ,
    Approval_Status VARCHAR(50)
);

CREATE TABLE Employee_Training (
    ET_ID INT AUTO_INCREMENT PRIMARY KEY,
    Employee_ID INT ,
    Program_ID INT,
    Completion_Status VARCHAR(50) CHECK (Completion_Status IN ("Completed","Droped","Still in progress")) ,
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Program_ID) REFERENCES Training_Program(Program_ID) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE Training_Certificate (
    Certificate_ID INT PRIMARY KEY,
    ET_ID INT ,
    Issue_Date DATE,
    Certificate_File_Path VARCHAR(255),
    FOREIGN KEY (ET_ID) REFERENCES Employee_Training(ET_ID) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE CONTRACT (
    Contract_ID INT PRIMARY KEY,
    Contract_Name VARCHAR(30) NOT NULL,
    Type VARCHAR(30) CHECK( Type IN ("Permanent", "Probationary" , "Temporary")),
    Description VARCHAR(100),
    Default_Duration INT,
    Work_Modality VARCHAR(30) CHECK (Work_Modality IN("Full Time","Part Time","Remote","Felixible")) ,
    Eligibility_Criteria VARCHAR(50)
);

CREATE TABLE JOB (
    Job_ID INT AUTO_INCREMENT PRIMARY KEY,
    Job_Code VARCHAR(30) UNIQUE,
    Job_Title VARCHAR(30) NOT NULL,
    Job_Level VARCHAR(30) CHECK (Job_Level IN ("Entry","Mid","Senior","Executive")),
    Job_Category VARCHAR(30),
    Job_Grade VARCHAR(50),
    Min_Salary DECIMAL(10,2),
    Max_Salary DECIMAL(10,2),
    Job_Description VARCHAR(50),
    Status VARCHAR(20),
    Department_ID INT,
    Reports_To INT,
    FOREIGN KEY (Department_ID) REFERENCES DEPARTMENT(Department_ID) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (Reports_To) REFERENCES JOB(Job_ID) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE JOB_OBJECTIVE (
    Objective_ID INT PRIMARY KEY,
    Job_ID INT,
    Objective_Title VARCHAR(30) NOT NULL,
    Description VARCHAR(100),
    Weight DECIMAL(5,2),
    Salary DECIMAL(10,2),
    FOREIGN KEY (Job_ID) REFERENCES JOB(Job_ID) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE OBJECTIVE_KPI (
    KPI_ID INT AUTO_INCREMENT PRIMARY KEY,
    Objective_ID INT ,
    KPI_Name VARCHAR(30) NOT NULL,
    Description VARCHAR(100),
    Measurement_Unit VARCHAR(50),
    Target_Value DECIMAL(10,2),
    Weight DECIMAL(5,2),
    FOREIGN KEY (Objective_ID) REFERENCES JOB_OBJECTIVE(Objective_ID) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE JOB_ASSIGNMENT (
    Assignment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Employee_ID INT,
    Job_ID INT,
    Contract_ID INT,
    Start_Date DATE ,
    End_Date DATE ,
    Status VARCHAR(20) CHECK (Status IN ("Active" , "Inactive")),
    Assigned_Salary DECIMAL(10,2),
    FOREIGN KEY (Employee_ID) REFERENCES EMPLOYEE(Employee_ID) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (Job_ID) REFERENCES JOB(Job_ID) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (Contract_ID) REFERENCES CONTRACT(Contract_ID) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE PERFORMANCE_CYCLE (
    Cycle_ID INT  PRIMARY KEY,
    Cycle_Name VARCHAR(100) NOT NULL,
    Cycle_Type VARCHAR(50),
    Start_Date DATE,
    End_Date DATE,
    Submission_Deadline DATE
);

CREATE TABLE EMPLOYEE_KPI_SCORE (
    Score_ID INT AUTO_INCREMENT PRIMARY KEY,
    Assignment_ID INT,
    KPI_ID INT  ,
    Performance_Cycle_ID INT ,
    Actual_Value DECIMAL(10,2),
    Employee_Score DECIMAL(5,2),
    Weighted_Score DECIMAL(6,2),
    Reviewer_ID INT,
    Comments VARCHAR(100),
    Review_Date DATE,
    FOREIGN KEY (Assignment_ID) REFERENCES JOB_ASSIGNMENT(Assignment_ID) ON UPDATE CASCADE ON DELETE SET NULL ,
    FOREIGN KEY (KPI_ID) REFERENCES OBJECTIVE_KPI(KPI_ID) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (Performance_Cycle_ID) REFERENCES PERFORMANCE_CYCLE(Cycle_ID) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (Reviewer_ID) REFERENCES EMPLOYEE(Employee_ID) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE APPRAISAL (
    Appraisal_ID INT AUTO_INCREMENT PRIMARY KEY,
    Assignment_ID INT,
    Cycle_ID INT ,
    Appraisal_Date DATE,
    Overall_Score DECIMAL(5,2),
    Manager_Comments VARCHAR(100),
    HR_Comments VARCHAR(100),
    Employee_Comments VARCHAR(100),
    Reviewer_ID INT,
    FOREIGN KEY (Assignment_ID) REFERENCES JOB_ASSIGNMENT(Assignment_ID) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (Cycle_ID) REFERENCES PERFORMANCE_CYCLE(Cycle_ID) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (Reviewer_ID) REFERENCES EMPLOYEE(Employee_ID) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE APPEAL (
    Appeal_ID INT AUTO_INCREMENT PRIMARY KEY,
    Appraisal_ID INT,
    Submission_Date DATE,
    Reason VARCHAR(100),
    Original_Score DECIMAL(5,2),
    Approval_Status VARCHAR(20),
    Appeal_Outcome_Score DECIMAL(5,2),
    FOREIGN KEY (Appraisal_ID) REFERENCES APPRAISAL(Appraisal_ID) ON UPDATE CASCADE ON DELETE SET NULL
);


