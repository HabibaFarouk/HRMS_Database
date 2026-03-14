USE hr_system;
-- Part 1
-- Function to return an employee's full name
DELIMITER $$
CREATE FUNCTION GetEmployeeFullName(emp_id INT)
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
    DECLARE full_name VARCHAR(200);

    SELECT 
        CONCAT_WS(' ', First_Name, Middle_Name, Last_Name)
    INTO full_name
    FROM EMPLOYEE
    WHERE Employee_ID = emp_id;

    RETURN full_name;
END$$
DELIMITER ;

DELIMITER $$
-- Function to calculate age from date of birth
CREATE FUNCTION GetEmployeeAge(dob DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, dob, CURDATE());
END$$
DELIMITER ;

DELIMITER $$
-- Function to calculate service years

CREATE FUNCTION GetServiceYears(emp_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE start_date DATE;

    SELECT MIN(Start_Date)
    INTO start_date
    FROM JOB_ASSIGNMENT
    WHERE Employee_ID = emp_id;

    RETURN TIMESTAMPDIFF(YEAR, start_date, CURDATE());
END$$

DELIMITER ;

--Part 2
DELIMITER $$ 
-- CalculateKPIScore
CREATE FUNCTION CalculateKPIScore(p_Actual DECIMAL(10,2), p_Target DECIMAL(10,2))
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    IF p_Target = 0 THEN 
        RETURN 0.00; 
    END IF;
    
    RETURN (p_Actual / p_Target) * 100;
END $$
DELIMITER;

DELIMITER $$
-- CalculateWeightedKPIScore
CREATE FUNCTION CalculateWeightedKPIScore(p_Score DECIMAL(5,2), p_Weight DECIMAL(5,2))
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    RETURN p_Score * p_Weight;
END $$
DELIMITER ;

DELIMITER $$
-- CalculateTotalObjectiveWeight
CREATE FUNCTION CalculateTotalObjectiveWeight(p_JobID INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE v_TotalWeight DECIMAL(5,2);
    
    SELECT SUM(Weight) INTO v_TotalWeight 
    FROM JOB_OBJECTIVE 
    WHERE Job_ID = p_JobID;
    
    RETURN v_TotalWeight;
END $$
DELIMITER ;

DELIMITER $$
-- CalculatePerformanceCycleDuration
CREATE FUNCTION CalculatePerformanceCycleDuration(p_CycleID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_Duration INT;
    
    SELECT DATEDIFF(End_Date, Start_Date) 
    INTO v_Duration
    FROM PERFORMANCE_CYCLE 
    WHERE Cycle_ID = p_CycleID;
    
    RETURN v_Duration;
END $$
DELIMITER ;

-- Part 3
-- Function to return the total number of employees
DELIMITER $$

CREATE FUNCTION TotalEmployees()
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN (SELECT COUNT(*) FROM EMPLOYEE);
END$$

DELIMITER ;


-- Function to return the number of active employees
DELIMITER $$

CREATE FUNCTION ActiveEmployees()
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN (
        SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE Employment_Status = 'Active'
    );
END$$

DELIMITER ;

--  Function to return the total number of jobs
DELIMITER $$

CREATE FUNCTION TotalJobs()
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN (SELECT COUNT(*) FROM JOB);
END$$

DELIMITER ;


--  Function to return the number of active jobs
DELIMITER $$

CREATE FUNCTION ActiveJobs()
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN (
        SELECT COUNT(*)
        FROM JOB
        WHERE Status = 'Active'
    );
END$$

DELIMITER ;

-- Function to return the total number of training programs
DELIMITER $$

CREATE FUNCTION TotalTrainingPrograms()
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN (SELECT COUNT(*) FROM Training_Program);
END$$

DELIMITER ;


-- Function to return the total number of issued certificates
DELIMITER $$

CREATE FUNCTION TotalIssuedCertificates()
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN (SELECT COUNT(*) FROM Training_Certificate);
END$$

DELIMITER ;


-- Function to return the KPI completion rate
DELIMITER $$
CREATE FUNCTION KPICompletionRate()
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE total_kpi INT;
    DECLARE completed_kpi INT;

    SELECT SUM(Employee_Score) INTO total_kpi FROM EMPLOYEE_KPI_SCORE;

    IF total_kpi = 0 THEN 
        RETURN 0;
    END IF;

    SELECT COUNT(*)*100  INTO completed_kpi
    FROM EMPLOYEE_KPI_SCORE
    WHERE Actual_Value IS NOT NULL;

    RETURN (total_kpi/completed_kpi) * 100;
END$$

DELIMITER ;

-- Function to return the average appraisal score
DELIMITER $$

CREATE FUNCTION AverageAppraisalScore()
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    RETURN (
        SELECT AVG(Overall_Score)
        FROM APPRAISAL
    );
END$$

DELIMITER ;


