USE hr_system;
-- View showing employee count by department
CREATE OR REPLACE VIEW Employee_Count_By_Department AS
SELECT 
    d.Department_ID,
    d.Department_Name,
    COUNT(e.Employee_ID) AS Employee_Count
FROM EMPLOYEE e
LEFT JOIN JOB_ASSIGNMENT ja ON e.Employee_ID = ja.Employee_ID
LEFT JOIN JOB j ON ja.Job_ID = j.Job_ID
LEFT JOIN DEPARTMENT d ON j.Department_ID = d.Department_ID
GROUP BY d.Department_ID, d.Department_Name;

-- View showing employee count by department
CREATE OR REPLACE VIEW Gender_Distribution AS
SELECT 
    Gender,
    COUNT(Employee_ID) AS Count,
    ROUND((COUNT(Employee_ID) / (SELECT COUNT(*) FROM EMPLOYEE)) * 100, 2) AS Percentage
FROM EMPLOYEE
GROUP BY Gender;

-- View showing employment status distribution
CREATE OR REPLACE VIEW Employment_Status_Distribution AS
SELECT 
    Employment_Status,
    COUNT(Employee_ID) AS Count,
    ROUND((COUNT(Employee_ID) / (SELECT COUNT(*) FROM EMPLOYEE)) * 100, 2) AS Percentage
FROM EMPLOYEE
GROUP BY Employment_Status;

-- View listing jobs grouped by job level
CREATE OR REPLACE VIEW View_JobsByLevel AS
SELECT 
    Job_Level,      
    Job_Title,      
    Job_Code
FROM JOB 
ORDER BY Job_Level;

-- View showing salary statistics (min, max, average) per job category
CREATE OR REPLACE VIEW View_SalaryStatsByCategory AS
SELECT 
    Job_Category, 
    MIN(Min_Salary) AS Lowest_Salary, 
    MAX(Max_Salary) AS Highest_Salary, 
    (MIN(Min_Salary) + MAX(Max_Salary) / 2) AS Average_Salary_Band
FROM JOB 
GROUP BY Job_Category;

-- View showing all currently active job assignments
CREATE OR REPLACE VIEW View_ActiveJobAssignments AS
SELECT 
    JA.Assignment_ID,
    E.First_Name, 
    E.Last_Name,
    J.Job_Title,
    JA.Start_Date, 
    JA.End_Date
FROM JOB_ASSIGNMENT JA
JOIN EMPLOYEE E ON JA.Employee_ID = E.Employee_ID
JOIN JOB J ON JA.Job_ID = J.Job_ID
WHERE JA.Status = 'Active';

-- View summarizing KPI scores across employees and cycles
CREATE OR REPLACE VIEW v_kpi_summary AS
SELECT 
    e.Employee_ID,
    CONCAT(e.First_Name, ' ', e.Last_Name) AS Employee_Name,
    pc.Cycle_ID,
    pc.Cycle_Name,
    AVG(a.Overall_Score) AS Avg_KPI_Score
FROM APPRAISAL a
JOIN EMPLOYEE e ON a.Reviewer_ID = e.Employee_ID
JOIN PERFORMANCE_CYCLE pc ON a.Cycle_ID = pc.Cycle_ID
GROUP BY e.Employee_ID, pc.Cycle_ID;

-- View showing appraisal scores per cycle
CREATE VIEW v_full_appraisal_summary AS
SELECT
    e.Employee_ID,
    CONCAT(e.First_Name, ' ', e.Last_Name) AS Employee_Name,

    ja.Assignment_ID,
    j.Job_ID,
    j.Job_Title,
    j.Job_Level,
    j.Job_Category,

    pc.Cycle_ID,
    pc.Cycle_Name,
    pc.Start_Date AS Cycle_Start,
    pc.End_Date AS Cycle_End,

    a.Appraisal_ID,
    a.Appraisal_Date,
    a.Overall_Score,
    a.Manager_Comments,
    a.HR_Comments,
    a.Employee_Comments,
    a.Reviewer_ID
FROM EMPLOYEE e
LEFT JOIN JOB_ASSIGNMENT ja ON e.Employee_ID = ja.Employee_ID
LEFT JOIN JOB j ON ja.Job_ID = j.Job_ID
LEFT JOIN APPRAISAL a ON ja.Assignment_ID = a.Assignment_ID
LEFT JOIN PERFORMANCE_CYCLE pc ON a.Cycle_ID = pc.Cycle_ID;


-- View showing a full appraisal summary (employee → job → cycle → score)
CREATE OR REPLACE VIEW v_full_appraisal_summary AS
SELECT
    e.Employee_ID,
    CONCAT(e.First_Name, ' ', e.Last_Name) AS Employee_Name,
    j.Job_ID,
    j.Job_Title,
    pc.Cycle_ID,
    pc.Cycle_Name,
    a.Overall_Score
FROM APPRAISAL a
JOIN EMPLOYEE e ON a.Reviewer_ID = e.Employee_ID
JOIN JOB j ON e.Job_ID = j.Job_ID
JOIN PERFORMANCE_CYCLE pc ON a.Cycle_ID = pc.Cycle_ID;


-- View summarizing employee participation in training programs
CREATE OR REPLACE VIEW View_TrainingParticipation AS
SELECT 
    TP.Title AS Program_Title,
    COUNT(ET.Employee_ID) AS Total_Participants
FROM Training_Program TP
LEFT JOIN Employee_Training ET ON TP.Program_ID = ET.Program_ID
GROUP BY TP.Title;

-- View showing training completion statistics per program
CREATE OR REPLACE VIEW View_TrainingCompletionStats AS
SELECT 
    TP.Title AS Program_Title,
    COUNT(IF(ET.Completion_Status = 'Completed', 1, NULL)) AS Completed_Count,
    COUNT(ET.ET_ID) AS Total_Enrolled,
    IF(COUNT(ET.ET_ID) = 0, 0, 
       ROUND(COUNT(IF(ET.Completion_Status = 'Completed', 1, NULL)) / COUNT(ET.ET_ID) * 100, 2)
    ) AS Completion_Rate_Percent
FROM Training_Program TP
LEFT JOIN Employee_Training ET ON TP.Program_ID = ET.Program_ID
GROUP BY TP.Title;
