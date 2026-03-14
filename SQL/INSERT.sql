USE HR_SYSTEM;
INSERT INTO UNIVERSITY (University_ID, University_Name, Acronym, Established_Year, Accreditation_Body, Address, Contact_Email, Website_URL) VALUES
(1, 'Cairo University', 'CU', 1998, 'Ministry of Higher Education', '1 Nile St, Cairo', 'info@ciu.edu.eg', 'http://www.cu.edu.eg'),
(2, 'Alexandria Technical University', 'ATU', 1975, 'National Accreditation Agency', '12 Sea Rd, Alexandria', 'contact@atu.edu.eg', 'http://www.atu.edu.eg'),
(3, 'Nile Valley University', 'NVU', 2005, 'Regional Accreditation Board', '45 Valley Ave, Aswan', 'office@nvu.edu.eg', 'http://www.nvu.edu.eg'),
(4, 'Delta University for Science', 'DUS', 1987, 'National Accreditation Agency', '7 Delta Rd, Mansoura', 'admin@dus.edu.eg', 'http://www.dus.edu.eg'),
(5, 'Sinai College of Arts', 'SCA', 2010, 'Ministry of Higher Education', '23 Sinai Blvd, Sharm', 'info@sca.edu.eg', 'http://www.sca.edu.eg');

INSERT INTO FACULTY (Faculty_ID, Faculty_Name, Location, Contact_Email, University_ID) VALUES
(1, 'Faculty of Engineering', 'Main Campus', 'eng@ciu.edu.eg', 1),
(2, 'Faculty of Business', 'North Campus', 'bus@atu.edu.eg', 2),
(3, 'Faculty of Medicine', 'Health Campus', 'med@nvu.edu.eg', 3),
(4, 'Faculty of Arts', 'Downtown', 'arts@dus.edu.eg', 4),
(5, 'Faculty of Computer Science', 'Tech Park', 'cs@sca.edu.eg', 5);

INSERT INTO DEPARTMENT (Department_ID, Department_Name, Department_Type, Location, Contact_Email) VALUES
(1, 'Computer Science Department', 'Academic', 'Bldg A, 2nd Floor', 'csdept@ciu.edu.eg'),
(2, 'Mechanical Engineering Department', 'Academic', 'Bldg B, 1st Floor', 'mech@ciu.edu.eg'),
(3, 'Human Resources', 'Administrative', 'Bldg A, 3nd Floor', 'hr@ciu.edu.eg'),
(4, 'Finance Office', 'Administrative', 'Bldg D, 1st Floor', 'finance@atu.edu.eg'),
(5, 'Marketing Department', 'Academic', 'Bldg B, 2nd Floor', 'marketing@dus.edu.eg');

INSERT INTO ACADEMIC_DEPARTMENT (Department_ID, Faculty_ID) VALUES 
(1, 5), 
(2, 1), 
(5, 4), 
(4, 2), 
(3,3);


INSERT INTO ADMINISTRATIVE_DEPARTMENT (Department_ID, University_ID) VALUES
(3, 1), 
(4, 2), 
(5, 3), 
(2, 4), 
(1, 5);

INSERT INTO EMPLOYEE (
    Employee_ID, First_Name, Middle_Name, Last_Name, Arabic_Name, Gender, Nationality, DOB, Place_of_Birth,
    Marital_Status, Religion, Employment_Status, Mobile_Phone, Work_Phone, Work_Email, Personal_Email,
    Emergency_Contact_Name, Emergency_Contact_Phone, Emergency_Contact_Relationship,
    Residential_City, Residential_Area, Residential_Street, Residential_Country,
    Permanent_City, Permanent_Area, Permanent_Street, Permanent_Country,
    Medical_Clearance_Status, Criminal_Status
) VALUES
(1001, 'Mohamed', 'Ali', 'Hassan', 'محمد علي حسن', 'Male', 'Egyptian', '1985-04-12', 'Cairo', 'Married', 'Muslim', 'Active', '201234567890', '0223456789', 'm.hassan@ciu.edu.eg', 'mo.@example.com', 'Sara Hassan', '201098765432', 'Spouse', 'Cairo', 'Nasr City', 'Street 5', 'Egypt', 'Cairo', 'Heliopolis', 'Street 12', 'Egypt', 'Cleared', 'None'),
(1002, 'Sara', 'Omar', 'Youssef', 'سارة عمر يوسف', 'Female', 'Egyptian', '1990-09-30', 'Alexandria', 'Single', 'Muslim', 'Active', '201234567891', '0323456789', 's.youssef@atu.edu.eg', 'sara.y@example.com', 'Omar Youssef', '201098765433', 'Father', 'Alexandria', 'Smouha', 'El-Nahr', 'Egypt', 'Alexandria', 'Smouha', 'El-Nahr', 'Egypt', 'Cleared', 'None'),
(1003, 'Ahmed', 'Magdy', 'Ibrahim', 'أحمد مجدي إبراهيم', 'Male', 'Egyptian', '1978-02-20', 'Aswan', 'Married', 'Muslim', 'Active', '201234567892', '0953456789', 'a.ibrahim@nvu.edu.eg', 'ahmed.i@example.com', 'Mona Ibrahim', '201098765434', 'Spouse', 'Aswan', 'Old City', 'Nile St', 'Egypt', 'Luxor', 'West', 'Main St', 'Egypt', 'Cleared', 'None'),
(1004, 'Laila', 'Samir', 'Khaled', 'ليلى سمير خالد', 'Female', 'Egyptian', '1988-12-05', 'Mansoura', 'Married', 'Christian', 'Probation', '201234567893', '0483456789', 'l.khaled@dus.edu.eg', 'laila.k@example.com', 'Samir Khaled', '201098765435', 'Husband', 'Mansoura', 'Center', 'Elm St', 'Egypt', 'Mansoura', 'Sidi Gaber', 'Elm St', 'Egypt', 'Pending', 'None'),
(1005, 'Nadine', 'Karim', 'Said', 'نادين كريم سعيد', 'Female', 'Lebanese', '1992-07-14', 'Beirut', 'Single', 'Christian', 'Active', '201234567894', '0723456789', 'n.said@sca.edu.eg', 'nadine.s@example.com', 'Karim Said', '201098765436', 'Father', 'Sharm', 'Old Town', 'Main St', 'Egypt', 'Beirut', 'Center', 'Rue 1', 'Lebanon', 'Cleared', 'None'),
(1006, 'Omar', 'Ragab', 'Zaki', 'عمر رجب زكي', 'Male', 'Egyptian', '1982-11-02', 'Cairo', 'Married', 'Muslim', 'Active', '201234567895', '0223456790', 'o.zaki@ciu.edu.eg', 'omar.z@example.com', 'Ragab Zaki', '201098765437', 'Brother', 'Cairo', 'Maadi', 'Street 9', 'Egypt', 'Cairo', 'Maadi', 'Street 9', 'Egypt', 'Cleared', 'None');

INSERT INTO Employee_Disability (Disability_Type, Employee_ID, Severity_Level, Required_Support) VALUES
('Visual Impairment', 1005, 'Mild', 'Large-print materials; occasional assistive tech access'),
('Hearing Impairment', 1004, 'Medium', 'Captioned videos; sign-language interpreter for events'),
('Mobility Impairment', 1003, 'Medium', 'Accessible workstation; elevator access'),
('Cognitive Impairment', 1002, 'Mild', 'Task reminders; simplified workflow tools'),
('Chronic Condition', 1006, 'Severe', 'Flexible hours; medical leave support');

INSERT INTO Social_Insurance (Insurance_ID, Employee_ID, Insurance_Number, Coverage_Details, Start_Date, End_Date, Status) VALUES
(2001, 1001, 'INS-EG-1001', 'Full medical + pension', '2015-01-01', '2030-12-31', 'Active'),
(2002, 1002, 'INS-EG-1002', 'Medical only', '2018-06-01', '2028-05-31', 'Active'),
(2003, 1003, 'INS-EG-1003', 'Full coverage', '2010-03-15', '2035-03-14', 'Active'),
(2004, 1004, 'INS-EG-1004', 'Limited coverage', '2024-02-01', '2026-01-31', 'Active'),
(2005, 1005, 'INS-LB-1005', 'International health', '2022-09-01', '2026-08-31', 'Active');


INSERT INTO Educational_Qualification (Qualification_ID, Employee_ID, Institution_Name, Major, Degree_Type) VALUES
(3001, 1001, 'Cairo University', 'Computer Science', 'B.Sc'),
(3002, 1002, 'Alexandria University', 'Business Administration', 'MBA'),
(3003, 1003, 'Aswan Medical College', 'Medicine', 'M.B.B.Ch'),
(3004, 1004, 'Mansoura University', 'Marketing', 'BBA'),
(3005, 1005, 'American University of Beirut', 'Computer Engineering', 'B.Eng');

INSERT INTO Professional_Certificate (Certificate_ID, Employee_ID, Certification_Name, Issuing_Organization, Issue_Date, Expiry_Date, Credential_ID) VALUES
(4001, 1001, 'CCNA', 'Cisco', '2016-05-10', '2026-05-09', 'CISCO-1001'),
(4002, 1002, 'PMP', 'PMI', '2019-11-20', '2025-11-19', 'PMI-1002'),
(4003, 1003, 'Basic Life Support', 'Red Cross', '2015-07-01', '2025-06-30', 'RC-1003'),
(4004, 1004, 'Digital Marketing', 'Google', '2021-03-10', '2024-03-09', 'GG-1004'),
(4005, 1005, 'AWS Cloud Practitioner', 'Amazon', '2023-01-15', '2026-01-14', 'AWS-1005');

INSERT INTO Training_Program (Program_ID, Program_Code, Title, Objectives, Type, Subtype, Delivery_Method, Approval_Status) VALUES
(5001, 'TP-ENG-01', 'Advanced SQL Workshop', 'Improve SQL skills', 'Internal', 'Technical', 'In-person', 'Approved'),
(5002, 'TP-HR-01', 'Workplace Safety', 'Safety and emergency procedures', 'Internal', 'Compliance', 'In-person', 'Approved'),
(5003, 'TP-CS-02', 'Cloud Essentials', 'Intro to cloud computing', 'External', 'Technical', 'Virtual', 'Approved'),
(5004, 'TP-MKT-01', 'Social Media Strategy', 'Boost marketing reach', 'External', 'Soft Skill', 'Virtual', 'Pending'),
(5005, 'TP-LD-01', 'Leadership Essentials', 'Develop managerial skills', 'Internal', 'Leadership', 'Blended', 'Approved');

INSERT INTO Employee_Training (ET_ID, Employee_ID, Program_ID, Completion_Status) VALUES
(6001, 1001, 5001, 'Completed'),
(6002, 1002, 5002, 'Completed'),
(6003, 1003, 5003, 'Still in progress'),
(6004, 1004, 5004, 'Droped'),
(6005, 1005, 5005, 'Completed');


INSERT INTO Training_Certificate (Certificate_ID, ET_ID, Issue_Date, Certificate_File_Path) VALUES
(7001, 6001, '2022-07-20', '/files/certs/7001.pdf'),
(7002, 6002, '2020-09-12', '/files/certs/7002.pdf'),
(7003, 6005, '2024-02-15', '/files/certs/7003.pdf'),
(7004, 6003, '2025-05-01', '/files/certs/7004.pdf'),
(7005, 6004, '2021-11-03', '/files/certs/7005.pdf');

INSERT INTO CONTRACT (Contract_ID, Contract_Name, Type, Description, Default_Duration, Work_Modality, Eligibility_Criteria) VALUES
(8001, 'Permanent Staff Contract', 'Permanent', 'Standard permanent employment', 60, 'Full Time', 'Degree required'),
(8002, 'Probation Contract', 'Probationary', '6-month probation', 6, 'Full Time', 'New hires'),
(8003, 'Temp Lecturer', 'Temporary', 'Semester-based teaching', 6, 'Part Time', 'Academic staff'),
(8004, 'Remote Consultant', 'Temporary', 'Consulting contract', 12, 'Remote', 'Expertise required'),
(8005, 'Flexible Worker', 'Permanent', 'Flexible hours contract', 36, 'Felixible', 'Agreement with manager');

INSERT INTO JOB (Job_ID, Job_Code, Job_Title, Job_Level, Job_Category, Job_Grade, Min_Salary, Max_Salary, Job_Description, Status, Department_ID, Reports_To) VALUES
(9006, 'J-SEN-01', 'Senior Software Engineer', 'Senior', 'Technical', 'G7', 14000.00, 22000.00, 'Leads dev team', 'Open', 1, NULL),
(9001, 'J-CS-01', 'Software Engineer', 'Mid', 'Technical', 'G5', 8000.00, 15000.00, 'Develops applications', 'Open', 1, 9006),
(9002, 'J-ENG-01', 'Mechanical Engineer', 'Mid', 'Technical', 'G5', 7500.00, 14000.00, 'Designs mechanical systems', 'Open', 2, 9006),
(9003, 'J-HR-01', 'HR Officer', 'Entry', 'Administrative', 'G3', 4000.00, 8000.00, 'Handles HR admin', 'Open', 3, 9006),
(9004, 'J-FIN-01', 'Finance Analyst', 'Mid', 'Administrative', 'G4', 6000.00, 12000.00, 'Manages budgets', 'Open', 4, 9006),
(9005, 'J-MKT-01', 'Marketing Specialist', 'Entry', 'Academic', 'G3', 4500.00, 9000.00, 'Supports marketing', 'Open', 5, 9006);


INSERT INTO JOB_OBJECTIVE (Objective_ID, Job_ID, Objective_Title, Description, Weight, Salary) VALUES
(10001, 9001, 'Deliver Features', 'Deliver assigned features on time', 0.40, 10000.00),
(10002, 9001, 'Code Quality', 'Maintain code quality and tests', 0.30, 10000.00),
(10003, 9003, 'HR Onboarding', 'Ensure smooth onboarding', 0.50, 6000.00),
(10004, 9004, 'Monthly Reports', 'Prepare financial reports', 0.60, 9000.00),
(10005, 9005, 'Campaign Execution', 'Run marketing campaigns', 0.50, 7000.00),
(10006, 9006, 'Technical Leadership', 'Mentor juniors and review architecture', 0.50, 18000.00);


INSERT INTO OBJECTIVE_KPI (KPI_ID, Objective_ID, KPI_Name, Description, Measurement_Unit, Target_Value, Weight) VALUES
(11001, 10001, 'Features Delivered', 'Number of features delivered per quarter', 'count', 8.00, 0.40),
(11002, 10002, 'Code Coverage', 'Unit test coverage percentage', '%', 80.00, 0.30),
(11003, 10003, 'Onboarding Time', 'Days to fully onboard', 'days', 14.00, 0.50),
(11004, 10004, 'Report Accuracy', 'Accuracy % of financial reports', '%', 99.00, 0.60),
(11005, 10005, 'Campaign ROI', 'Return on ad spend', 'ratio', 3.00, 0.50),
(11006, 10006, 'Mentoring Hours', 'Hours of mentoring per month', 'hours', 20.00, 0.50);

INSERT INTO JOB_ASSIGNMENT (Assignment_ID, Employee_ID, Job_ID, Contract_ID, Start_Date, End_Date, Status, Assigned_Salary) VALUES
(12001, 1001, 9001, 8001, '2020-01-01',  '2027-01-01', 'Active', 12000.00),
(12002, 1002, 9003, 8001, '2019-07-01',  '2026-01-01', 'Active', 6500.00),
(12003, 1003, 9006, 8003, '2018-09-01',  '2026-01-01', 'Active', 16000.00),
(12004, 1004, 9005, 8002, '2024-02-01',  '2029-01-01', 'Active', 4800.00),
(12005, 1005, 9001, 8004, '2023-06-01',  '2030-01-01', 'Active', 9000.00),
(12006, 1006, 9004, 8001, '2016-10-15',  '2028-01-01', 'Active', 11000.00);

INSERT INTO PERFORMANCE_CYCLE (Cycle_ID, Cycle_Name, Cycle_Type, Start_Date, End_Date, Submission_Deadline) VALUES
(13001, 'FY2024 Annual', 'Annual', '2024-01-01', '2024-12-31', '2025-01-15'),
(13002, 'H1 2025', 'Semi-Annual', '2025-01-01', '2025-06-30', '2025-07-10'),
(13003, 'FY2023 Annual', 'Annual', '2023-01-01', '2023-12-31', '2024-01-15'),
(13004, 'Q3 2025', 'Quarterly', '2025-07-01', '2025-09-30', '2025-10-10'),
(13005, 'H1 2024 Mid-Year', 'Semi-Annual', '2024-01-01', '2024-06-30', '2024-07-15');


INSERT INTO EMPLOYEE_KPI_SCORE (Score_ID, Assignment_ID, KPI_ID, Performance_Cycle_ID, Actual_Value, Employee_Score, Weighted_Score, Reviewer_ID, Comments, Review_Date) VALUES
(14001, 12001, 11001, 13001, 9.00, 90.00, 36.00, 1006, 'Exceeded delivery targets', '2025-01-10'),
(14002, 12001, 11002, 13003, 78.00, 78.00, 23.40, 1006, 'Coverage slightly under target', '2025-01-10'),
(14003, 12002, 11003, 13004, 12.00, 85.00, 42.50, 1001, 'Onboarding improved', '2025-01-12'),
(14004, 12004, 11005, 13005, 2.50, 70.00, 35.00, 1002, 'ROI below target', '2025-01-15'),
(14005, 12003, 11006, 13005, 22.00, 95.00, 47.50, 1001, 'Strong mentoring', '2025-01-09'),
(14006, 12006, 11004, 13001, 99.50, 99.50, 59.70, 1003, 'Excellent accuracy', '2025-01-11');

INSERT INTO APPRAISAL (Appraisal_ID, Assignment_ID, Cycle_ID, Appraisal_Date, Overall_Score, Manager_Comments, HR_Comments, Employee_Comments, Reviewer_ID) VALUES
(15001, 12001, 13002, '2025-01-20', 84.50, 'Good performance overall', 'Approved', 'Happy with feedback', 1006),
(15002, 12002, 13003, '2025-01-22', 85.00, 'Solid onboarding support', 'Approved', 'Appreciative', 1001),
(15003, 12003, 13001, '2025-01-18', 95.00, 'Outstanding leadership', 'Approved', 'Grateful', 1001),
(15004, 12004, 13004, '2025-01-25', 72.00, 'Needs improvement in ROI', 'Under Review', 'Will improve', 1002),
(15005, 12006, 13005, '2025-01-21', 99.00, 'Excellent accuracy and timeliness', 'Approved', 'Thanks', 1003);


INSERT INTO APPEAL (Appeal_ID, Appraisal_ID, Submission_Date, Reason, Original_Score, Approval_Status, Appeal_Outcome_Score) VALUES
(16001, 15004, '2025-02-01', 'Score too low for campaign impact', 72.00, 'Pending', 87.00),
(16002, 15002, '2025-02-03', 'Request clarification on KPI weighting', 85.00, 'Resolved', 85.00),
(16003, 15001, '2025-02-05', 'Request re-evaluation of code quality KPI', 84.50, 'Rejected', 84.50),
(16004, 15005, '2025-02-06', 'Minor clerical error found in appraisal', 99.00, 'Resolved', 99.00),
(16007, 15003, '2025-04-07', 'Exceeded expectations on key tasks', 99.00, 'Completed', 99.00);









