USE hr_system;
-- Part A
-- AddNewEmployee
DELIMITER $$
CREATE PROCEDURE AddNewEmployee(
    IN p_Employee_ID INT,
    IN p_First_Name VARCHAR(50),
    IN p_Middle_Name VARCHAR(50),
    IN p_Last_Name VARCHAR(50),
    IN p_Arabic_Name NVARCHAR(50),
    IN p_Gender VARCHAR(20),
    IN p_Nationality VARCHAR(64),
    IN p_DOB DATE,
    IN p_Place_of_Birth VARCHAR(64),
    IN p_Marital_Status VARCHAR(64),
    IN p_Religion VARCHAR(20),
    IN p_Employment_Status VARCHAR(20),
    IN p_Mobile_Phone VARCHAR(20),
    IN p_Work_Phone VARCHAR(20),
    IN p_Work_Email VARCHAR(20),
    IN p_Personal_Email VARCHAR(20),
    IN p_Emergency_Contact_Name VARCHAR(50),
    IN p_Emergency_Contact_Phone VARCHAR(20),
    IN p_Emergency_Contact_Relationship VARCHAR(20),
    IN p_Residential_City VARCHAR(20),
    IN p_Residential_Area VARCHAR(20),
    IN p_Residential_Street VARCHAR(20),
    IN p_Residential_Country VARCHAR(20),
    IN p_Permanent_City VARCHAR(20),
    IN p_Permanent_Area VARCHAR(20),
    IN p_Permanent_Street VARCHAR(20),
    IN p_Permanent_Country VARCHAR(20),
    IN p_Insurance_Number INT
)
BEGIN
 
    INSERT INTO EMPLOYEE (
        Employee_ID,First_Name, Middle_Name, Last_Name, Arabic_Name, Gender, Nationality,
        DOB, Place_of_Birth, Marital_Status, Religion, Employment_Status,
        Mobile_Phone, Work_Phone, Work_Email, Personal_Email,
        Emergency_Contact_Name, Emergency_Contact_Phone, Emergency_Contact_Relationship,
        Residential_City, Residential_Area, Residential_Street, Residential_Country,
        Permanent_City, Permanent_Area, Permanent_Street, Permanent_Country
    )
    VALUES (
        p_Employee_ID, p_First_Name, p_Middle_Name, p_Last_Name, p_Arabic_Name, p_Gender, p_Nationality,
        p_DOB, p_Place_of_Birth, p_Marital_Status, p_Religion, p_Employment_Status,
        p_Mobile_Phone, p_Work_Phone, p_Work_Email, p_Personal_Email,
        p_Emergency_Contact_Name, p_Emergency_Contact_Phone, p_Emergency_Contact_Relationship,
        p_Residential_City, p_Residential_Area, p_Residential_Street, p_Residential_Country,
        p_Permanent_City, p_Permanent_Area, p_Permanent_Street, p_Permanent_Country
    );

    INSERT INTO Social_Insurance(Employee_ID, Insurance_Number, Status)
    VALUES (p_Employee_ID,p_Insurance_Number , 'Pending');

END$$
DELIMITER ;

-- UpdateEmployeeContactInfo
DELIMITER $$

CREATE PROCEDURE UpdateEmployeeContactInfo(
    IN p_Employee_ID INT,
    IN p_Mobile_Phone VARCHAR(20),
    IN p_Work_Phone VARCHAR(20),
    IN p_Work_Email VARCHAR(20),
    IN p_Personal_Email VARCHAR(20),
    IN p_Residential_City VARCHAR(20),
    IN p_Residential_Area VARCHAR(20),
    IN p_Residential_Street VARCHAR(20),
    IN p_Residential_Country VARCHAR(20)
)
BEGIN
    UPDATE EMPLOYEE
    SET 
        Mobile_Phone = p_Mobile_Phone,
        Work_Phone = p_Work_Phone,
        Work_Email = p_Work_Email,
        Personal_Email = p_Personal_Email,
        Residential_City = p_Residential_City,
        Residential_Area = p_Residential_Area,
        Residential_Street = p_Residential_Street,
        Residential_Country = p_Residential_Country
    WHERE Employee_ID = p_Employee_ID;
END$$

DELIMITER ;

-- AddEmployeeDisability
DELIMITER $$

CREATE PROCEDURE AddEmployeeDisability(
    IN p_Employee_ID INT,
    IN p_Disability_Type VARCHAR(100),
    IN p_Severity_Level VARCHAR(50),
    IN p_Required_Support VARCHAR(255)
)
BEGIN
    INSERT INTO Employee_Disability (
        Disability_Type, Employee_ID, Severity_Level, Required_Support
    )
    VALUES (
        p_Disability_Type, p_Employee_ID, p_Severity_Level, p_Required_Support
    );
END$$

DELIMITER ;

-- GetEmployeeFullProfile
DELIMITER $$

CREATE PROCEDURE GetEmployeeFullProfile(
    IN p_Employee_ID INT
)
BEGIN
    
    SELECT * FROM EMPLOYEE WHERE Employee_ID = p_Employee_ID;


    SELECT * FROM Employee_Disability WHERE Employee_ID = p_Employee_ID;


    SELECT * FROM Educational_Qualification WHERE Employee_ID = p_Employee_ID;


    SELECT * FROM Professional_Certificate WHERE Employee_ID = p_Employee_ID;

    SELECT 
        JA.*, J.Job_Title, C.Contract_Name
    FROM JOB_ASSIGNMENT JA
    LEFT JOIN JOB J ON JA.Job_ID = J.Job_ID
    LEFT JOIN CONTRACT C ON JA.Contract_ID = C.Contract_ID
    WHERE JA.Employee_ID = p_Employee_ID;


END$$

DELIMITER ;


--Part B
--AddNewJob

DELIMITER $$

CREATE PROCEDURE AddNewJob (
    IN p_Job_Code VARCHAR(30),
    IN p_Job_Title VARCHAR(30),
    IN p_Job_Level VARCHAR(30),
    IN p_Job_Category VARCHAR(30),
    IN p_Job_Grade VARCHAR(50),
    IN p_Min_Salary DECIMAL(10,2),
    IN p_Max_Salary DECIMAL(10,2),
    IN p_Job_Description VARCHAR(255),
    IN p_Status VARCHAR(20),
    IN p_Department_ID INT,
    IN p_Reports_To INT
)
BEGIN
    INSERT INTO JOB (
        Job_Code, Job_Title, Job_Level, Job_Category, Job_Grade,
        Min_Salary, Max_Salary, Job_Description, Status, Department_ID, Reports_To
    ) VALUES (
        p_Job_Code, p_Job_Title, p_Job_Level, p_Job_Category, p_Job_Grade,
        p_Min_Salary, p_Max_Salary, p_Job_Description, p_Status, p_Department_ID, p_Reports_To
    );
  
END$$
DELIMITER ;

DELIMITER $$
-- Part B 
-- AddJobObjective
CREATE PROCEDURE AddJobObjective (
    IN p_Objective_ID INT,
    IN p_Job_ID INT,
    IN p_Objective_Title VARCHAR(100),
    IN p_Description VARCHAR(255),
    IN p_Weight DECIMAL(5,2),
    IN p_Salary DECIMAL(10,2)
)
BEGIN
	DECLARE current_sum INT;
    SELECT SUM(Weight) INTO current_sum
    FROM JOB_OBJECTIVE
    WHERE Job_ID = p_Job_ID;

    IF (current_sum + p_Weight) > 100 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Total objective weight for this job would exceed 100%';
    END IF;

    INSERT INTO JOB_OBJECTIVE (
        Objective_ID, Job_ID, Objective_Title, Description, Weight, Salary
    ) VALUES (
        p_Objective_ID, p_Job_ID, p_Objective_Title, p_Description, p_Weight, p_Salary
    );
END$$
DELIMITER ;

-- AddKPIToObjective
DELIMITER $$
CREATE PROCEDURE AddKPIToObjective (
    IN p_Objective_ID INT,
    IN p_KPI_Name VARCHAR(100),
    IN p_Description VARCHAR(255),
    IN p_Measurement_Unit VARCHAR(50),
    IN p_Target_Value DECIMAL(10,2),
    IN p_Weight DECIMAL(5,2)
)
BEGIN

    INSERT INTO OBJECTIVE_KPI (
        Objective_ID, KPI_Name, Description, Measurement_Unit, Target_Value, Weight
    ) VALUES (
        p_Objective_ID, p_KPI_Name, p_Description, p_Measurement_Unit, p_Target_Value, p_Weight
    );
END$$
DELIMITER ;


-- AssignJobToEmployee
DELIMITER $$
CREATE PROCEDURE AssignJobToEmployee (
    IN p_Employee_ID INT,
    IN p_Job_ID INT,
    IN p_Contract_ID INT,
    IN p_Start_Date DATE,
    IN p_End_Date DATE,
    IN p_Assigned_Salary DECIMAL(10,2)
)
BEGIN
    DECLARE v_count INT ;


    IF (SELECT COUNT(*) FROM CONTRACT WHERE Contract_ID = p_Contract_ID) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Contract does not exist' ;
    END IF;

  
    SELECT COUNT(*) INTO v_count
    FROM JOB_ASSIGNMENT
    WHERE Employee_ID = p_Employee_ID
      AND Status = 'Active'
      AND (End_Date IS NULL OR End_Date >= p_Start_Date);

    IF v_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Employee has an overlapping active assignment';
    END IF ;


    INSERT INTO JOB_ASSIGNMENT (
        Employee_ID, Job_ID, Contract_ID, Start_Date, End_Date, Status, Assigned_Salary
    ) VALUES (
        p_Employee_ID, p_Job_ID, p_Contract_ID, p_Start_Date, p_End_Date, 'Active', p_Assigned_Salary
    );
END$$
DELIMITER ;

-- CloseJobAssignment
DELIMITER $$
CREATE PROCEDURE CloseJobAssignment (
    IN p_Assignment_ID INT,
    IN p_End_Date DATE
)
BEGIN
    DECLARE v_start DATE;
    DECLARE v_status VARCHAR(20);
    DECLARE v_exists INT;

    UPDATE JOB_ASSIGNMENT
    SET End_Date = p_End_Date,
        Status = 'Inactive'
    WHERE Assignment_ID = p_Assignment_ID;
END$$
DELIMITER ;


-- Part C
-- CreatePerformanceCycle

DELIMITER $$

CREATE PROCEDURE CreatePerformanceCycle(
    IN p_CycleID INT,           
    IN p_Name VARCHAR(100),     
    IN p_Type VARCHAR(50),      
    IN p_StartDate DATE,        
    IN p_EndDate DATE,          
    IN p_Deadline DATE          
)
BEGIN
        INSERT INTO PERFORMANCE_CYCLE (
        Cycle_ID, Cycle_Name, Cycle_Type, Start_Date, End_Date, Submission_Deadline
    )
    VALUES (
        p_CycleID, p_Name, p_Type, p_StartDate, p_EndDate, p_Deadline
    );
END $$
DELIMITER ;

--AddEmployeeKPIScore
DELIMITER $$
CREATE PROCEDURE AddEmployeeKPIScore(
    IN p_AssignmentID INT,      
    IN p_KPIID INT,            
    IN p_CycleID INT,          
    IN p_ActualValue DECIMAL(10,2), 
    IN p_ReviewerID INT,        
    IN p_Comments VARCHAR(100)  
)
BEGIN
    INSERT INTO EMPLOYEE_KPI_SCORE (
        Assignment_ID, 
        KPI_ID, 
        Performance_Cycle_ID, 
        Actual_Value, 
        Reviewer_ID, 
        Comments, 
        Review_Date
    )
    VALUES (
        p_AssignmentID, 
        p_KPIID, 
        p_CycleID, 
        p_ActualValue, 
        p_ReviewerID, 
        p_Comments, 
        CURDATE()
    );
END $$
DELIMITER ;

--CalculateEmployeeWeightedScore
DELIMITER $$
CREATE PROCEDURE CalculateEmployeeWeightedScore(
    IN p_AssignmentID INT, 
    IN p_CycleID INT        
)
BEGIN
    DECLARE v_TotalScore DECIMAL(5,2);
    SELECT SUM(Weighted_Score) 
    INTO v_TotalScore
    FROM EMPLOYEE_KPI_SCORE
    WHERE Assignment_ID = p_AssignmentID 
      AND Performance_Cycle_ID = p_CycleID;

    UPDATE APPRAISAL 
    SET Overall_Score = v_TotalScore
    WHERE Assignment_ID = p_AssignmentID 
      AND Cycle_ID = p_CycleID;
END $$
DELIMITER ;

--CreateAppraisal
DELIMITER $$
CREATE PROCEDURE CreateAppraisal(
    IN p_AssignmentID INT, 
    IN p_CycleID INT, 
    IN p_ReviewerID INT
)
BEGIN
    INSERT INTO APPRAISAL (
        Assignment_ID, 
        Cycle_ID, 
        Reviewer_ID, 
        Appraisal_Date, 
        Overall_Score
    )
    VALUES (
        p_AssignmentID, 
        p_CycleID, 
        p_ReviewerID, 
        CURDATE(), 
        0 
    );
END $$
DELIMITER ;

--SubmitAppeal
DELIMITER $$
CREATE PROCEDURE SubmitAppeal(
    IN p_AppraisalID INT,   
    IN p_Reason VARCHAR(100) 
)
BEGIN
    DECLARE v_CurrentScore DECIMAL(5,2);


    SELECT Overall_Score 
    INTO v_CurrentScore 
    FROM APPRAISAL 
    WHERE Appraisal_ID = p_AppraisalID;


    INSERT INTO APPEAL (
        Appraisal_ID, 
        Submission_Date, 
        Reason, 
        Original_Score, 
        Approval_Status
    )
    VALUES (
        p_AppraisalID, 
        CURDATE(), 
        p_Reason, 
        v_CurrentScore, 
        'Pending' -- Appeals always start as Pendin
    );
END $$
DELIMITER ;


-- Part D
-- AddTrainingProgram
DELIMITER $$

CREATE PROCEDURE AddTrainingProgram(
    IN p_Program_Code VARCHAR(50),
    IN p_Title VARCHAR(100),
    IN p_Objectives VARCHAR(100),
    IN p_Type VARCHAR(50),
    IN p_Subtype VARCHAR(50),
    IN p_Delivery_Method VARCHAR(50),
    IN p_Approval_Status VARCHAR(50)
)
BEGIN
    INSERT INTO Training_Program (
        Program_Code, Title, Objectives, Type, Subtype, 
        Delivery_Method, Approval_Status
    )
    VALUES (
        p_Program_Code, p_Title, p_Objectives, p_Type, p_Subtype,
        p_Delivery_Method, p_Approval_Status
    );

END$$
DELIMITER ; 

-- AssignTrainingToEmployee
DELIMITER $$

CREATE PROCEDURE AssignTrainingToEmployee(
    IN p_Employee_ID INT,
    IN p_Program_ID INT
)
BEGIN
    INSERT INTO Employee_Training (
        Employee_ID, Program_ID, Completion_Status
    )
    VALUES (
        p_Employee_ID, p_Program_ID, 'Still in progress'
    );

END$$

DELIMITER ;

-- RecordTrainingCompletion
DELIMITER $$

CREATE PROCEDURE RecordTrainingCompletion(
    IN p_ET_ID INT,
    IN p_Completion_Status VARCHAR(50)
)
BEGIN
    UPDATE Employee_Training
    SET Completion_Status = p_Completion_Status
    WHERE ET_ID = p_ET_ID;
END$$

DELIMITER ;

--IssueTrainingCertificate
DELIMITER $$

CREATE PROCEDURE IssueTrainingCertificate(
    IN p_ET_ID INT,
    IN p_Certificate_ID INT,
    IN p_Issue_Date DATE,
    IN p_File_Path VARCHAR(255)
)
BEGIN
   
    INSERT INTO Training_Certificate (
        Certificate_ID, ET_ID, Issue_Date, Certificate_File_Path
    )
    VALUES (
        p_Certificate_ID, p_ET_ID, p_Issue_Date, p_File_Path
    );
END$$

DELIMITER ;