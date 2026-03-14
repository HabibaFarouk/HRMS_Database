USE hr_system;
-- Expanding Universities 1, 2, 3, 5 to 3+ faculties
INSERT INTO FACULTY (Faculty_ID, Faculty_Name, Location, Contact_Email, University_ID) VALUES
(6, 'Faculty of Economics', 'Econ Block', 'econ@ciu.edu.eg', 1),  -- CU (ID 1)

(7, 'Faculty of Dentistry', 'Dental Wing', 'dent@atu.edu.eg', 2), -- ATU (ID 2)
(8, 'Faculty of Pharmacy', 'Pharma Lab', 'pharma@atu.edu.eg', 2), -- ATU (ID 2)

(9, 'Faculty of Agriculture', 'Farm Land', 'agri@nvu.edu.eg', 3),-- NVU (ID 3)
(10, 'Faculty of Tourism', 'Tourism Office', 'tour@nvu.edu.eg', 3), -- NVU (ID 3)

(11, 'Faculty of Education', 'North Campus', 'edu@sca.edu.eg', 5),-- SCA (ID 5)
(12, 'Faculty of Languages', 'Language Hall', 'lang@sca.edu.eg', 5);-- SCA (ID 5)

-- Adding 3 faculties to Delta University (ID 4)
INSERT INTO FACULTY (Faculty_ID, Faculty_Name, Location, Contact_Email, University_ID) VALUES
(13, 'Faculty of Science', 'Science Tower', 'sci@dus.edu.eg', 4),  -- DUS (ID 4)
(14, 'Faculty of Architecture', 'Design Studio', 'arch@dus.edu.eg', 4),-- DUS (ID 4)
(15, 'Faculty of Nursing', 'Health Annex', 'nurs@dus.edu.eg', 4);-- DUS (ID 4)


-- 1. Insert new Departments into DEPARTMENT parent table
-- Continues from ID 5 (your previous inserts)
INSERT INTO DEPARTMENT (Department_ID, Department_Name, Department_Type, Location, Contact_Email) VALUES
-- Academic Departments (IDs 6-16)
(6, 'Public Law', 'Academic', 'Law Building', 'plaw@ciu.edu.eg'),
(7, 'Finance & Banking', 'Academic', 'Econ Block', 'finbank@ciu.edu.eg'),
(8, 'Oral Surgery', 'Academic', 'Dental Wing', 'osurg@atu.edu.eg'),
(9, 'Clinical Pharmacy', 'Academic', 'Pharma Lab', 'cpharm@atu.edu.eg'),
(10, 'Horticulture', 'Academic', 'Farm Land', 'horti@nvu.edu.eg'),
(11, 'Hotel Management', 'Academic', 'Tourism Office', 'hotel@nvu.edu.eg'),
(12, 'Curriculum Studies', 'Academic', 'North Campus', 'curr@sca.edu.eg'),
(13, 'English Language', 'Academic', 'Language Hall', 'englang@sca.edu.eg'),
(14, 'Physics', 'Academic', 'Science Tower', 'phys@dus.edu.eg'),
(15, 'Urban Planning', 'Academic', 'Design Studio', 'urban@dus.edu.eg'),
(16, 'Pediatric Nursing', 'Academic', 'Health Annex', 'pedia@dus.edu.eg'),

-- Administrative Departments (IDs 17-20)
(17, 'IT Services', 'Administrative', 'Tech Hub', 'it@atu.edu.eg'),
(18, 'Student Affairs', 'Administrative', 'Main Hall', 'sa@dus.edu.eg'),
(19, 'Admissions Office', 'Administrative', 'Gate 1', 'admin@sca.edu.eg'),
(20, 'Campus Security', 'Administrative', 'Security Bldg', 'sec@ciu.edu.eg');

-- 2. Link new Academic Departments to their Faculties
-- Matches the new IDs (6-16) to the respective Faculty IDs
INSERT INTO ACADEMIC_DEPARTMENT (Department_ID, Faculty_ID) VALUES
(6, 5),   -- Public Law -> Faculty of Law
(7, 6),   -- Finance -> Faculty of Economics
(8, 7),   -- Oral Surgery -> Faculty of Dentistry
(9, 8),   -- Clinical Pharmacy -> Faculty of Pharmacy
(10, 9),  -- Horticulture -> Faculty of Agriculture
(11, 10), -- Hotel Mgmt -> Faculty of Tourism
(12, 11), -- Curriculum -> Faculty of Education
(13, 12), -- English -> Faculty of Languages
(14, 13), -- Physics -> Faculty of Science
(15, 14), -- Urban Planning -> Faculty of Architecture
(16, 15); -- Pediatric Nursing -> Faculty of Nursing

-- 3. Link new Administrative Departments to their Universities
-- Matches the new IDs (17-20) to the respective University IDs
INSERT INTO ADMINISTRATIVE_DEPARTMENT (Department_ID, University_ID) VALUES
(17, 2), -- IT Services -> Alexandria Technical Univ
(18, 4), -- Student Affairs -> Delta Univ
(19, 5), -- Admissions -> Sinai College
(20, 1); -- Security -> Cairo University

INSERT INTO JOB (Job_ID, Job_Code, Job_Title, Job_Level, Job_Category, Min_Salary, Max_Salary, Status, Department_ID) VALUES
-- Academic Jobs (linked to Depts 6-16)
(9007, 'ACA-LAW', 'Professor of Public Law', 'Senior', 'Academic', 25000.00, 40000.00, 'Active', 6),
(9008, 'ACA-FIN', 'Finance Lecturer', 'Mid', 'Academic', 15000.00, 28000.00, 'Active', 7),
(9009, 'ACA-SUR', 'Head of Oral Surgery', 'Executive', 'Academic', 45000.00, 65000.00, 'Active', 8),
(9010, 'ACA-PHA', 'Clinical Pharmacist', 'Entry', 'Academic', 12000.00, 18000.00, 'Active', 9),
(9011, 'ACA-HOR', 'Horticulture Specialist', 'Mid', 'Academic', 14000.00, 24000.00, 'Active', 10),
(9012, 'ACA-HOT', 'Hotel Mgmt Instructor', 'Entry', 'Academic', 10000.00, 16000.00, 'Active', 11),
(9013, 'ACA-CUR', 'Curriculum Developer', 'Mid', 'Academic', 18000.00, 30000.00, 'Active', 12),
(9014, 'ACA-ENG', 'Senior English Prof', 'Senior', 'Academic', 28000.00, 42000.00, 'Active', 13),
(9015, 'ACA-PHY', 'Physics Researcher', 'Mid', 'Academic', 20000.00, 32000.00, 'Active', 14),
(9016, 'ACA-URB', 'Urban Planning Lead', 'Senior', 'Academic', 30000.00, 48000.00, 'Active', 15),
(9017, 'ACA-NUR', 'Pediatric Nurse Tutor', 'Entry', 'Academic', 9000.00, 15000.00, 'Active', 16),

-- Administrative Jobs (linked to Depts 17-20)
(9018, 'ADM-IT', 'IT Support Specialist', 'Mid', 'Administrative', 12000.00, 22000.00, 'Active', 17),
(9019, 'ADM-SA', 'Student Advisor', 'Entry', 'Administrative', 8000.00, 14000.00, 'Active', 18),
(9020, 'ADM-AD', 'Admissions Officer', 'Mid', 'Administrative', 11000.00, 19000.00, 'Active', 19),
(9021, 'ADM-SEC', 'Security Officer', 'Entry', 'Administrative', 6000.00, 10000.00, 'Active', 20);



INSERT INTO JOB_OBJECTIVE (Objective_ID, Job_ID, Objective_Title, Description, Weight, Salary) VALUES
-- Job 9007: Professor of Public Law (Academic - Senior)
(10007, 9007, 'Legal Research', 'Publish in Tier-1 Law Journals', 0.40, 15000.00),
(10008, 9007, 'Curriculum Oversight', 'Update Master degree syllabus', 0.60, 20000.00),

-- Job 9008: Finance Lecturer (Academic - Mid)
(10009, 9008, 'Teaching Delivery', 'Deliver 12 credit hours per semester', 0.50, 8000.00),
(10010, 9008, 'Student Mentorship', 'Supervise 5 grad students', 0.50, 7000.00),

-- Job 9009: Head of Oral Surgery (Academic - Executive)
(10011, 9009, 'Department Strategy', 'Expand surgical unit capacity', 0.50, 30000.00),
(10012, 9009, 'Clinical Oversight', 'Maintain 0% error rate in surgeries', 0.50, 30000.00),

-- Job 9010: Clinical Pharmacist (Academic - Entry)
(10013, 9010, 'Lab Supervision', 'Manage student lab sessions', 0.70, 9000.00),
(10014, 9010, 'Inventory Mgmt', 'Maintain chemical stock levels', 0.30, 3000.00),

-- Job 9011: Horticulture Specialist (Academic - Mid)
(10015, 9011, 'Field Research', 'Conduct crop yield experiments', 0.50, 7000.00),
(10016, 9011, 'Workshop Delivery', 'Train students on farming tech', 0.50, 7000.00),

-- Job 9012: Hotel Mgmt Instructor (Academic - Entry)
(10017, 9012, 'Practical Training', 'Kitchen and service simulation', 0.60, 6000.00),
(10018, 9012, 'Event Support', 'Coordinate faculty events', 0.40, 4000.00),

-- Job 9013: Curriculum Developer (Academic - Mid)
(10019, 9013, 'Content Creation', 'Design e-learning modules', 0.50, 9000.00),
(10020, 9013, 'Accreditation', 'Ensure ISO compliance', 0.50, 9000.00),

-- Job 9014: Senior English Prof (Academic - Senior)
(10021, 9014, 'Publication', 'Publish 2 linguistics papers', 0.40, 12000.00),
(10022, 9014, 'Dept Leadership', 'Head the language department', 0.60, 16000.00),

-- Job 9015: Physics Researcher (Academic - Mid)
(10023, 9015, 'Grant Writing', 'Secure external research funding', 0.50, 10000.00),
(10024, 9015, 'Lab Safety', 'Maintain radiation safety protocols', 0.50, 10000.00),

-- Job 9016: Urban Planning Lead (Academic - Senior)
(10025, 9016, 'Community Projects', 'Lead 2 city redesign projects', 0.50, 15000.00),
(10026, 9016, 'Thesis Supervision', 'Guide PhD candidates', 0.50, 15000.00),

-- Job 9017: Pediatric Nurse Tutor (Academic - Entry)
(10027, 9017, 'Clinical Rounds', 'Supervise student rounds', 0.60, 6000.00),
(10028, 9017, 'Simulation Labs', 'Run patient emergency sims', 0.40, 3000.00),

-- Job 9018: IT Support Specialist (Admin - Mid)
(10029, 9018, 'Ticket Resolution', 'Resolve L2 tickets within 24h', 0.60, 8000.00),
(10030, 9018, 'System Uptime', 'Maintain 99.9% network uptime', 0.40, 4000.00),

-- Job 9019: Student Advisor (Admin - Entry)
(10031, 9019, 'Student Counseling', 'Advise 50 students per semester', 0.70, 6000.00),
(10032, 9019, 'Record Keeping', 'Update student files weekly', 0.30, 2000.00),

-- Job 9020: Admissions Officer (Admin - Mid)
(10033, 9020, 'Application Processing', 'Process 500 applications', 0.50, 6000.00),
(10034, 9020, 'Recruitment', 'Attend 5 university fairs', 0.50, 5000.00),

-- Job 9021: Security Officer (Admin - Entry)
(10035, 9021, 'Campus Patrol', 'Complete hourly patrols', 0.60, 4000.00),
(10036, 9021, 'Incident Reporting', 'File reports within 1 hour', 0.40, 2000.00);

INSERT INTO OBJECTIVE_KPI (KPI_ID, Objective_ID, KPI_Name, Description, Measurement_Unit, Target_Value, Weight) VALUES
-- For Job 9007 (Law)
(11007, 10007, 'Journals Published', 'Articles in Q1 journals', 'Count', 2.00, 40.00),
(11008, 10008, 'Syllabus Updates', 'Modules revised', 'Count', 4.00, 60.00),

-- For Job 9008 (Finance)
(11009, 10009, 'Teaching Hours', 'Weekly contact hours', 'Hours', 12.00, 50.00),
(11010, 10010, 'Student Rating', 'Average feedback score', 'Score 1-5', 4.20, 50.00),

-- For Job 9009 (Oral Surgery)
(11011, 10011, 'Unit Capacity', 'Patients treated per month', 'Count', 150.00, 50.00),
(11012, 10012, 'Success Rate', 'Surgery success rate', '%', 99.50, 50.00),

-- For Job 9010 (Pharmacy)
(11013, 10013, 'Lab Sessions', 'Sessions supervised', 'Count', 20.00, 70.00),
(11014, 10014, 'Audit Score', 'Safety audit compliance', '%', 100.00, 30.00),

-- For Job 9011 (Horticulture)
(11015, 10015, 'Crop Yield', 'Experimental yield increase', '%', 10.00, 50.00),
(11016, 10016, 'Trainees Certified', 'Students passing workshop', 'Count', 30.00, 50.00),

-- For Job 9012 (Hotel Mgmt)
(11017, 10017, 'Simulations Run', 'Kitchen service drills', 'Count', 15.00, 60.00),
(11018, 10018, 'Event Satisfaction', 'Guest satisfaction score', 'Score 1-10', 9.00, 40.00),

-- For Job 9013 (Curriculum)
(11019, 10019, 'Modules Created', 'New e-learning units', 'Count', 8.00, 50.00),
(11020, 10020, 'Compliance Rate', 'ISO standard adherence', '%', 100.00, 50.00),

-- For Job 9014 (English)
(11021, 10021, 'Citations', 'Citations in other papers', 'Count', 5.00, 40.00),
(11022, 10022, 'Dept Ranking', 'National dept ranking', 'Rank', 5.00, 60.00),

-- For Job 9015 (Physics)
(11023, 10023, 'Funding Secured', 'Grant money raised', 'USD', 50000.00, 50.00),
(11024, 10024, 'Safety Incidents', 'Reported lab incidents', 'Count', 0.00, 50.00),

-- For Job 9016 (Urban Planning)
(11025, 10025, 'Projects Delivered', 'Completed city plans', 'Count', 2.00, 50.00),
(11026, 10026, 'PhD Graduates', 'Students graduating', 'Count', 3.00, 50.00),

-- For Job 9017 (Nursing)
(11027, 10027, 'Rounds Completed', 'Clinical rounds done', 'Count', 40.00, 60.00),
(11028, 10028, 'Sim Pass Rate', 'Student pass rate', '%', 90.00, 40.00),

-- For Job 9018 (IT Support)
(11029, 10029, 'Avg Resolution', 'Time to resolve ticket', 'Hours', 24.00, 60.00),
(11030, 10030, 'Uptime %', 'Server availability', '%', 99.90, 40.00),

-- For Job 9019 (Student Advisor)
(11031, 10031, 'Students Advised', 'Counselling sessions', 'Count', 50.00, 70.00),
(11032, 10032, 'File Accuracy', 'Error-free records', '%', 98.00, 30.00),

-- For Job 9020 (Admissions)
(11033, 10033, 'Apps Processed', 'Forms reviewed', 'Count', 500.00, 50.00),
(11034, 10034, 'Conversion Rate', 'Applicants enrolled', '%', 20.00, 50.00),

-- For Job 9021 (Security)
(11035, 10035, 'Patrols Logged', 'Checkpoints visited', 'Count', 100.00, 60.00),
(11036, 10036, 'Response Time', 'Time to arrive at incident', 'Minutes', 5.00, 40.00);

INSERT INTO EMPLOYEE (
    Employee_ID, First_Name, Middle_Name, Last_Name, Arabic_Name, Gender, Nationality, DOB, Place_of_Birth,
    Marital_Status, Religion, Employment_Status, Mobile_Phone, Work_Phone, Work_Email, Personal_Email,
    Emergency_Contact_Name, Emergency_Contact_Phone, Emergency_Contact_Relationship,
    Residential_City, Residential_Area, Residential_Street, Residential_Country,
    Permanent_City, Permanent_Area, Permanent_Street, Permanent_Country,
    Medical_Clearance_Status, Criminal_Status
) VALUES

-- =======================================================
-- Dept 101: Computer Science (Need ~10 employees)
-- =======================================================
(1007, 'Tariq', 'Ahmed', 'Khalid', 'طارق أحمد خالد', 'Male', 'Egyptian', '1979-05-18', 'Giza', 'Married', 'Muslim', 'Active', '201010000099', '0223456791', 't.khalid@ciu.edu.eg', 'tariq@example.com', 'Aisha Khalid', '201020000099', 'Wife', 'Cairo', 'Giza', 'Pyramids St', 'Egypt', 'Cairo', 'Giza', 'Pyramids St', 'Egypt', 'Cleared', 'None'),
(1008, 'Fatima', 'Samy', 'Waleed', 'فاطمة سامي وليد', 'Female', 'Egyptian', '1991-08-25', 'Cairo', 'Single', 'Muslim', 'Active', '201010000100', '0223456792', 'f.waleed@ciu.edu.eg', 'fati@example.com', 'Waleed Ali', '201020000100', 'Father', 'Cairo', 'Maadi', 'Road 9', 'Egypt', 'Cairo', 'Maadi', 'Road 9', 'Egypt', 'Cleared', 'None'),
(1009, 'Sami', 'Nabil', 'Fouad', 'سامي نبيل فؤاد', 'Male', 'Syrian', '1983-03-11', 'Damascus', 'Married', 'Muslim', 'Active', '201010000101', '0223456793', 's.fouad@ciu.edu.eg', 'sami@example.com', 'Nour Fouad', '201020000101', 'Wife', 'Cairo', 'Zamalek', '26 July St', 'Egypt', 'Damascus', 'Center', 'Main St', 'Syria', 'Cleared', 'None'),
(1010, 'Heba', 'Moustafa', 'Maged', 'هبة مصطفى ماجد', 'Female', 'Egyptian', '1994-01-20', 'Cairo', 'Single', 'Christian', 'Probation', '201010000102', '0223456794', 'h.maged@ciu.edu.eg', 'heba@example.com', 'Maged Tarek', '201020000102', 'Father', 'Cairo', 'Heliopolis', 'Korba St', 'Egypt', 'Cairo', 'Heliopolis', 'Korba St', 'Egypt', 'Pending', 'None'),
(1011, 'Amr', 'Hassan', 'Ezzat', 'عمرو حسن عزت', 'Male', 'Egyptian', '1970-12-05', 'Alexandria', 'Divorced', 'Muslim', 'Retired', '201010000103', '0223456795', 'a.ezzat@ciu.edu.eg', 'amr@example.com', 'Ezzat Ali', '201020000103', 'Father', 'Cairo', 'Shoubra', 'Shoubra St', 'Egypt', 'Cairo', 'Shoubra', 'Shoubra St', 'Egypt', 'Cleared', 'None'),
(1012, 'Doaa', 'Mahmoud', 'Said', 'دعاء محمود سعيد', 'Female', 'Egyptian', '1987-06-29', 'Tanta', 'Married', 'Muslim', 'Active', '201010000104', '0223456796', 'd.said@ciu.edu.eg', 'doaa@example.com', 'Said Ahmed', '201020000104', 'Husband', 'Cairo', 'Nasr City', 'Abbas St', 'Egypt', 'Tanta', 'Center', 'Gamaa St', 'Egypt', 'Cleared', 'None'),
(1013, 'Youssef', 'Kamal', 'Adel', 'يوسف كمال عادل', 'Male', 'Egyptian', '1993-10-17', 'Cairo', 'Single', 'Christian', 'Active', '201010000105', '0223456797', 'y.adel@ciu.edu.eg', 'youssef@example.com', 'Adel Hassan', '201020000105', 'Father', 'Cairo', 'Madinty', 'B4 Group 75', 'Egypt', 'Cairo', 'Madinty', 'B4 Group 75', 'Egypt', 'Cleared', 'None'),
(1014, 'Noha', 'Fathy', 'Hamed', 'نهى فتحي حامد', 'Female', 'Egyptian', '1981-02-08', 'Giza', 'Widowed', 'Muslim', 'Leave', '201010000106', '0223456798', 'n.hamed@ciu.edu.eg', 'noha@example.com', 'Hamed Ali', '201020000106', 'Brother', 'Cairo', 'Rehab', 'Ave 2', 'Egypt', 'Cairo', 'Rehab', 'Ave 2', 'Egypt', 'Cleared', 'None'),

-- =======================================================
-- Dept 103: Anatomy (Need ~10 employees)
-- =======================================================
(1015, 'Hassan', 'Ibrahim', 'Badr', 'حسن إبراهيم بدر', 'Male', 'Egyptian', '1975-04-01', 'Alexandria', 'Married', 'Muslim', 'Active', '201010000107', '0323456790', 'h.badr@atu.edu.eg', 'hassan@example.com', 'Lina Badr', '201020000107', 'Wife', 'Alexandria', 'Loran', 'Tram St', 'Egypt', 'Alexandria', 'Loran', 'Tram St', 'Egypt', 'Cleared', 'None'),
(1016, 'Jana', 'Magdy', 'Tawfik', 'جنى مجدي توفيق', 'Female', 'Egyptian', '1992-11-20', 'Cairo', 'Single', 'Muslim', 'Active', '201010000108', '0323456791', 'j.tawfik@atu.edu.eg', 'jana@example.com', 'Tawfik Said', '201020000108', 'Father', 'Alexandria', 'Sidi Gaber', 'Port Said St', 'Egypt', 'Cairo', 'Nasr City', 'Makram St', 'Egypt', 'Cleared', 'None'),
(1017, 'Bassel', 'Samir', 'Ashraf', 'باسل سمير أشرف', 'Male', 'Egyptian', '1980-08-15', 'Mansoura', 'Married', 'Christian', 'Active', '201010000109', '0323456792', 'b.ashraf@atu.edu.eg', 'bassel@example.com', 'Dalia Ashraf', '201020000109', 'Wife', 'Alexandria', 'Montaza', 'Corniche', 'Egypt', 'Mansoura', 'Center', 'Republic St', 'Egypt', 'Cleared', 'None'),
(1018, 'Samia', 'Ali', 'Ramzy', 'سامية علي رمزي', 'Female', 'Egyptian', '1973-02-02', 'Alexandria', 'Widowed', 'Muslim', 'Active', '201010000110', '0323456793', 's.ramzy@atu.edu.eg', 'samia@example.com', 'Ramzy Adel', '201020000110', 'Son', 'Alexandria', 'Raml', 'Station St', 'Egypt', 'Alexandria', 'Raml', 'Station St', 'Egypt', 'Cleared', 'None'),
(1019, 'Wael', 'Tarek', 'Sherif', 'وائل طارق شريف', 'Male', 'Egyptian', '1989-07-28', 'Cairo', 'Single', 'Muslim', 'Active', '201010000111', '0323456794', 'w.sherif@atu.edu.eg', 'wael@example.com', 'Sherif Ali', '201020000111', 'Father', 'Alexandria', 'Agami', 'Bitash St', 'Egypt', 'Cairo', 'Maadi', 'Degla St', 'Egypt', 'Cleared', 'None'),
(1020, 'Layla', 'Omar', 'Fayez', 'ليلى عمر فايز', 'Female', 'Egyptian', '1995-05-10', 'Alexandria', 'Single', 'Christian', 'Probation', '201010000112', '0323456795', 'l.fayez@atu.edu.eg', 'layla@example.com', 'Fayez Ahmed', '201020000112', 'Father', 'Alexandria', 'Miami', 'Khaled St', 'Egypt', 'Alexandria', 'Miami', 'Khaled St', 'Egypt', 'Pending', 'None'),
(1021, 'Adel', 'Hany', 'Wahid', 'عادل هاني وحيد', 'Male', 'Egyptian', '1977-09-03', 'Tanta', 'Married', 'Muslim', 'Active', '201010000113', '0323456796', 'a.wahid@atu.edu.eg', 'adel@example.com', 'Wahid Omar', '201020000113', 'Father', 'Alexandria', 'Borg', 'Ind Zone', 'Egypt', 'Tanta', 'Center', 'Stadium St', 'Egypt', 'Cleared', 'None'),
(1022, 'Rasha', 'Sayed', 'Emad', 'رشا سيد عماد', 'Female', 'Egyptian', '1985-04-22', 'Alexandria', 'Married', 'Muslim', 'Leave', '201010000114', '0323456797', 'r.emad@atu.edu.eg', 'rasha@example.com', 'Emad Fathy', '201020000114', 'Husband', 'Alexandria', 'Dekhela', 'Dekhela St', 'Egypt', 'Alexandria', 'Dekhela', 'Dekhela St', 'Egypt', 'Cleared', 'None'),
(1023, 'Karim', 'Mohsen', 'Hani', 'كريم محسن هاني', 'Male', 'Egyptian', '1990-01-01', 'Cairo', 'Married', 'Muslim', 'Active', '201010000115', '0323456798', 'k.hani@atu.edu.eg', 'karim@example.com', 'Hani Yasser', '201020000115', 'Father', 'Alexandria', 'Asafra', 'Gamal St', 'Egypt', 'Cairo', 'Nasr City', 'Tayaran St', 'Egypt', 'Cleared', 'None'),
(1024, 'Mona', 'Salah', 'Zaki', 'منى صلاح زكي', 'Female', 'Egyptian', '1988-11-12', 'Alexandria', 'Single', 'Muslim', 'Active', '201010000116', '0323456799', 'm.zaki@atu.edu.eg', 'mona@example.com', 'Salah Zaki', '201020000116', 'Father', 'Alexandria', 'Smouha', 'Green Plaza', 'Egypt', 'Alexandria', 'Smouha', 'Green Plaza', 'Egypt', 'Cleared', 'None'),

-- =======================================================
-- Dept 105: Graphic Design (Need ~10 employees)
-- =======================================================
(1025, 'Nour', 'Ehab', 'ElDin', 'نور إيهاب الدين', 'Female', 'Egyptian', '1991-03-03', 'Sharm', 'Married', 'Muslim', 'Active', '201010000117', '0693456790', 'n.eldin@sca.edu.eg', 'nour@example.com', 'Din Fathy', '201020000117', 'Husband', 'Sharm', 'Naama Bay', 'Main Rd', 'Egypt', 'Sharm', 'Naama Bay', 'Main Rd', 'Egypt', 'Cleared', 'None'),
(1026, 'Mazen', 'Ahmed', 'Tarek', 'مازن أحمد طارق', 'Male', 'Egyptian', '1985-11-15', 'Cairo', 'Married', 'Muslim', 'Active', '201010000118', '0693456791', 'm.tarek@sca.edu.eg', 'mazen@example.com', 'Tarek Ali', '201020000118', 'Father', 'Sharm', 'Old Market', 'Souq St', 'Egypt', 'Cairo', 'Maadi', 'Zahraa St', 'Egypt', 'Cleared', 'None'),
(1027, 'Dina', 'Khaled', 'Ashraf', 'دينا خالد أشرف', 'Female', 'Egyptian', '1993-06-25', 'Giza', 'Single', 'Christian', 'Active', '201010000119', '0693456792', 'd.ashraf@sca.edu.eg', 'dina@example.com', 'Ashraf Mounir', '201020000119', 'Father', 'Sharm', 'Hadaba', 'Fanar St', 'Egypt', 'Giza', 'Dokki', 'Tahrir St', 'Egypt', 'Cleared', 'None'),
(1028, 'Ali', 'Hassan', 'Mostafa', 'علي حسن مصطفى', 'Male', 'Egyptian', '1970-01-20', 'Suez', 'Married', 'Muslim', 'Retired', '201010000120', '0693456793', 'a.mostafa@sca.edu.eg', 'ali@example.com', 'Mostafa Said', '201020000120', 'Father', 'Sharm', 'Sharkia', 'Ring Rd', 'Egypt', 'Suez', 'Arbaeen', 'Main St', 'Egypt', 'Cleared', 'None'),
(1029, 'Yasmin', 'Amir', 'Fahmy', 'ياسمين أمير فهمي', 'Female', 'Egyptian', '1988-09-07', 'Cairo', 'Married', 'Muslim', 'Active', '201010000121', '0693456794', 'y.fahmy@sca.edu.eg', 'yasmin@example.com', 'Fahmy Adel', '201020000121', 'Husband', 'Sharm', 'Airport', 'Peace Rd', 'Egypt', 'Cairo', 'Zamalek', 'Brazil St', 'Egypt', 'Cleared', 'None'),
(1030, 'Fady', 'George', 'Lotfy', 'فادي جورج لطفي', 'Male', 'Egyptian', '1990-12-12', 'Assiut', 'Single', 'Christian', 'Active', '201010000122', '0693456795', 'f.lotfy@sca.edu.eg', 'fady@example.com', 'Lotfy Hani', '201020000122', 'Father', 'Sharm', 'Naama Bay', 'King St', 'Egypt', 'Assiut', 'Center', 'Republic St', 'Egypt', 'Cleared', 'None'),
(1031, 'Mariam', 'Youssef', 'Zakaria', 'مريم يوسف زكريا', 'Female', 'Egyptian', '1976-04-05', 'Cairo', 'Married', 'Christian', 'Active', '201010000123', '0693456796', 'm.zakaria@sca.edu.eg', 'mariam@example.com', 'Zakaria Ali', '201020000123', 'Husband', 'Sharm', 'Old Market', 'Bank St', 'Egypt', 'Cairo', 'Heliopolis', 'Merghany St', 'Egypt', 'Cleared', 'None'),
(1032, 'Sherif', 'Mohamed', 'Fawzy', 'شريف محمد فوزي', 'Male', 'Egyptian', '1984-07-30', 'Alexandria', 'Divorced', 'Muslim', 'Probation', '201010000124', '0693456797', 's.fawzy@sca.edu.eg', 'sherif@example.com', 'Fawzy Omar', '201020000124', 'Father', 'Sharm', 'Hadaba', 'Om El Sid', 'Egypt', 'Alexandria', 'Sporting', 'Tram St', 'Egypt', 'Pending', 'None'),
(1033, 'Kamila', 'Samir', 'Hassan', 'كاميليا سمير حسن', 'Female', 'Egyptian', '1996-02-14', 'Cairo', 'Single', 'Muslim', 'Active', '201010000125', '0693456798', 'k.hassan@sca.edu.eg', 'kamila@example.com', 'Hassan Ali', '201020000125', 'Father', 'Sharm', 'Sharkia', 'Resort Rd', 'Egypt', 'Cairo', 'New Cairo', '90 St', 'Egypt', 'Cleared', 'None'),
(1034, 'Tamer', 'Hosny', 'Abdel', 'تامر حسني عبد', 'Male', 'Egyptian', '1982-05-20', 'Cairo', 'Married', 'Muslim', 'Active', '201010000126', '0693456799', 't.abdel@sca.edu.eg', 'tamer@example.com', 'Hosny Abdel', '201020000126', 'Father', 'Sharm', 'Nabq', 'Lagoon Dr', 'Egypt', 'Cairo', 'Sheraton', 'Orouba St', 'Egypt', 'Cleared', 'None'),

-- =======================================================
-- Dept 106: Public Law (New Dept, Need 10 employees)
-- =======================================================
(1035, 'Malak', 'Gamal', 'Said', 'ملك جمال سعيد', 'Female', 'Egyptian', '1989-10-05', 'Cairo', 'Married', 'Muslim', 'Active', '201010000127', '0223456800', 'm.said@ciu.edu.eg', 'malak@example.com', 'Gamal Said', '201020000127', 'Father', 'Cairo', 'Nasr City', 'Energy St', 'Egypt', 'Cairo', 'Nasr City', 'Energy St', 'Egypt', 'Cleared', 'None'),
(1036, 'Nabil', 'Fouad', 'Ali', 'نبيل فؤاد علي', 'Male', 'Egyptian', '1974-04-18', 'Giza', 'Married', 'Muslim', 'Active', '201010000128', '0223456801', 'n.ali@ciu.edu.eg', 'nabil@example.com', 'Said Ali', '201020000128', 'Brother', 'Cairo', 'Maadi', 'Corniche', 'Egypt', 'Cairo', 'Maadi', 'Corniche', 'Egypt', 'Cleared', 'None'),
(1037, 'Eman', 'Ahmed', 'Omar', 'إيمان أحمد عمر', 'Female', 'Egyptian', '1992-02-28', 'Cairo', 'Single', 'Muslim', 'Active', '201010000129', '0223456802', 'e.omar@ciu.edu.eg', 'eman@example.com', 'Ahmed Omar', '201020000129', 'Father', 'Cairo', 'Zamalek', 'Hassan Sabry', 'Egypt', 'Cairo', 'Zamalek', 'Hassan Sabry', 'Egypt', 'Cleared', 'None'),
(1038, 'Mounir', 'Kamel', 'Hassan', 'منير كامل حسن', 'Male', 'Egyptian', '1980-08-08', 'Alexandria', 'Married', 'Christian', 'Active', '201010000130', '0223456803', 'm.hassan@ciu.edu.eg', 'mounir@example.com', 'Ali Hassan', '201020000130', 'Brother', 'Cairo', 'Heliopolis', 'Thawra St', 'Egypt', 'Alexandria', 'Camp Cesar', 'Port Said St', 'Egypt', 'Cleared', 'None'),
(1039, 'Hala', 'Fathy', 'Said', 'هالة فتحي سعيد', 'Female', 'Egyptian', '1995-12-12', 'Tanta', 'Single', 'Muslim', 'Probation', '201010000131', '0223456804', 'h.said@ciu.edu.eg', 'hala@example.com', 'Fathy Said', '201020000131', 'Father', 'Cairo', 'Shoubra', 'Rod El Farag', 'Egypt', 'Tanta', 'Club', 'Club St', 'Egypt', 'Pending', 'None'),
(1040, 'Khaled', 'Mohsen', 'Ali', 'خالد محسن علي', 'Male', 'Egyptian', '1976-06-21', 'Cairo', 'Married', 'Muslim', 'Active', '201010000132', '0223456805', 'k.ali@ciu.edu.eg', 'khaled@example.com', 'Mohsen Ali', '201020000132', 'Father', 'Cairo', 'Nasr City', 'Makram Ebeid', 'Egypt', 'Cairo', 'Nasr City', 'Makram Ebeid', 'Egypt', 'Cleared', 'None'),
(1041, 'Aya', 'Ezz', 'Said', 'آية عز سعيد', 'Female', 'Egyptian', '1985-04-04', 'Cairo', 'Married', 'Muslim', 'Active', '201010000133', '0223456806', 'a.said@ciu.edu.eg', 'aya@example.com', 'Ezz Said', '201020000133', 'Husband', 'Cairo', 'Madinty', 'B2 Group 10', 'Egypt', 'Cairo', 'Madinty', 'B2 Group 10', 'Egypt', 'Cleared', 'None'),
(1042, 'Tamer', 'Samir', 'Ali', 'تامر سمير علي', 'Male', 'Egyptian', '1993-09-19', 'Giza', 'Single', 'Muslim', 'Active', '201010000134', '0223456807', 't.ali@ciu.edu.eg', 'tamer@example.com', 'Samir Ali', '201020000134', 'Father', 'Cairo', 'Rehab', 'Market St', 'Egypt', 'Cairo', 'Rehab', 'Market St', 'Egypt', 'Cleared', 'None'),
(1043, 'Reham', 'Mostafa', 'Said', 'ريهام مصطفى سعيد', 'Female', 'Egyptian', '1979-01-07', 'Cairo', 'Divorced', 'Muslim', 'Active', '201010000135', '0223456808', 'r.said@ciu.edu.eg', 'reham@example.com', 'Mostafa Said', '201020000135', 'Father', 'Cairo', 'Giza', 'Dokki St', 'Egypt', 'Cairo', 'Giza', 'Dokki St', 'Egypt', 'Cleared', 'None'),
(1044, 'Hany', 'Fouad', 'Ali', 'هاني فؤاد علي', 'Male', 'Egyptian', '1988-11-23', 'Cairo', 'Married', 'Christian', 'Active', '201010000136', '0223456809', 'h.ali@ciu.edu.eg', 'hany@example.com', 'Fouad Ali', '201020000136', 'Father', 'Cairo', 'Maadi', 'Canal St', 'Egypt', 'Cairo', 'Maadi', 'Canal St', 'Egypt', 'Cleared', 'None'),

-- =======================================================
-- Dept 107: Finance & Banking (New Dept, Need 10 employees)
-- =======================================================
(1045, 'Adham', 'Mounir', 'Said', 'أدهم منير سعيد', 'Male', 'Egyptian', '1985-05-15', 'Cairo', 'Married', 'Muslim', 'Active', '201010000137', '0223456810', 'a.said@ciu.edu.eg', 'adham@example.com', 'Mounir Said', '201020000137', 'Father', 'Cairo', 'Giza', 'Haram St', 'Egypt', 'Cairo', 'Giza', 'Haram St', 'Egypt', 'Cleared', 'None'),
(1046, 'Amal', 'Sherif', 'Ali', 'أمل شريف علي', 'Female', 'Egyptian', '1991-08-25', 'Cairo', 'Single', 'Muslim', 'Active', '201010000138', '0223456811', 'a.ali@ciu.edu.eg', 'amal@example.com', 'Sherif Ali', '201020000138', 'Father', 'Cairo', 'Maadi', 'Sarayat', 'Egypt', 'Cairo', 'Maadi', 'Sarayat', 'Egypt', 'Cleared', 'None'),
(1047, 'Bilal', 'Omar', 'Fouad', 'بلال عمر فؤاد', 'Male', 'Syrian', '1983-03-11', 'Aleppo', 'Married', 'Muslim', 'Active', '201010000139', '0223456812', 'b.fouad@ciu.edu.eg', 'bilal@example.com', 'Omar Fouad', '201020000139', 'Father', 'Cairo', 'Zamalek', 'Gezira St', 'Egypt', 'Aleppo', 'Old City', 'Souq', 'Syria', 'Cleared', 'None'),
(1048, 'Dalia', 'Hesham', 'Tarek', 'داليا هشام طارق', 'Female', 'Egyptian', '1994-01-20', 'Cairo', 'Single', 'Muslim', 'Probation', '201010000140', '0223456813', 'd.tarek@ciu.edu.eg', 'dalia@example.com', 'Hesham Tarek', '201020000140', 'Father', 'Cairo', 'Heliopolis', 'Roxy', 'Egypt', 'Cairo', 'Heliopolis', 'Roxy', 'Egypt', 'Pending', 'None'),
(1049, 'Fares', 'Ezz', 'Ali', 'فارس عز علي', 'Male', 'Egyptian', '1970-12-05', 'Cairo', 'Married', 'Muslim', 'Active', '201010000141', '0223456814', 'f.ali@ciu.edu.eg', 'fares@example.com', 'Ezz Ali', '201020000141', 'Father', 'Cairo', 'Shoubra', 'Khalafawy', 'Egypt', 'Cairo', 'Shoubra', 'Khalafawy', 'Egypt', 'Cleared', 'None'),
(1050, 'Ghada', 'Said', 'Ahmed', 'غادة سعيد أحمد', 'Female', 'Egyptian', '1987-06-29', 'Alexandria', 'Married', 'Muslim', 'Active', '201010000142', '0223456815', 'g.ahmed@ciu.edu.eg', 'ghada@example.com', 'Said Ahmed', '201020000142', 'Husband', 'Cairo', 'Nasr City', 'Zahraa', 'Egypt', 'Alexandria', 'Mandara', 'Beach St', 'Egypt', 'Cleared', 'None'),
(1051, 'Hossam', 'Adel', 'Hassan', 'حسام عادل حسن', 'Male', 'Egyptian', '1993-10-17', 'Cairo', 'Single', 'Muslim', 'Active', '201010000143', '0223456816', 'h.hassan@ciu.edu.eg', 'hossam@example.com', 'Adel Hassan', '201020000143', 'Father', 'Cairo', 'Madinty', 'Villas Zone', 'Egypt', 'Cairo', 'Madinty', 'Villas Zone', 'Egypt', 'Cleared', 'None'),
(1052, 'Ibtisam', 'Hamed', 'Ali', 'إبتسام حامد علي', 'Female', 'Egyptian', '1981-02-08', 'Giza', 'Widowed', 'Muslim', 'Leave', '201010000144', '0223456817', 'i.ali@ciu.edu.eg', 'ibtisam@example.com', 'Hamed Ali', '201020000144', 'Father', 'Cairo', 'Rehab', 'Gate 6', 'Egypt', 'Cairo', 'Rehab', 'Gate 6', 'Egypt', 'Cleared', 'None'),
(1053, 'Kareem', 'Tarek', 'Khalid', 'كريم طارق خالد', 'Male', 'Egyptian', '1979-05-18', 'Cairo', 'Married', 'Muslim', 'Active', '201010000145', '0223456818', 'k.khalid@ciu.edu.eg', 'kareem@example.com', 'Aisha Khalid', '201020000145', 'Sister', 'Cairo', 'Giza', 'Faisal St', 'Egypt', 'Cairo', 'Giza', 'Faisal St', 'Egypt', 'Cleared', 'None'),
(1054, 'Lina', 'Fahmy', 'Ali', 'لينا فهمي علي', 'Female', 'Egyptian', '1991-08-25', 'Cairo', 'Single', 'Christian', 'Active', '201010000146', '0223456819', 'l.ali@ciu.edu.eg', 'lina@example.com', 'Fahmy Ali', '201020000146', 'Father', 'Cairo', 'Maadi', 'Degla', 'Egypt', 'Cairo', 'Maadi', 'Degla', 'Egypt', 'Cleared', 'None'),

-- =======================================================
-- Dept 108: Oral Surgery (New Dept, Need 10 employees)
-- =======================================================
(1055, 'Mazen', 'Shoukry', 'Fouad', 'مازن شكري فؤاد', 'Male', 'Egyptian', '1983-03-11', 'Alexandria', 'Married', 'Christian', 'Active', '201010000147', '0323456820', 'm.fouad@atu.edu.eg', 'mazen@example.com', 'Nour Fouad', '201020000147', 'Sister', 'Alexandria', 'Zamalek', 'Geish St', 'Egypt', 'Alexandria', 'Raml', 'Tram St', 'Egypt', 'Cleared', 'None'),
(1056, 'Noha', 'Mounir', 'Tarek', 'نهى منير طارق', 'Female', 'Egyptian', '1994-01-20', 'Cairo', 'Single', 'Muslim', 'Probation', '201010000148', '0323456821', 'n.tarek@atu.edu.eg', 'noha@example.com', 'Maged Tarek', '201020000148', 'Uncle', 'Alexandria', 'Smouha', 'Club St', 'Egypt', 'Cairo', 'Heliopolis', 'Baghdad St', 'Egypt', 'Pending', 'None'),
(1057, 'Omar', 'Saad', 'Ali', 'عمر سعد علي', 'Male', 'Egyptian', '1970-12-05', 'Tanta', 'Married', 'Muslim', 'Active', '201010000149', '0323456822', 'o.ali@atu.edu.eg', 'omar@example.com', 'Ezzat Ali', '201020000149', 'Brother', 'Alexandria', 'Shoubra', 'Delta St', 'Egypt', 'Tanta', 'Center', 'Said St', 'Egypt', 'Cleared', 'None'),
(1058, 'Pakinam', 'Wael', 'Ahmed', 'باكينام وائل أحمد', 'Female', 'Egyptian', '1987-06-29', 'Alexandria', 'Married', 'Muslim', 'Active', '201010000150', '0323456823', 'p.ahmed@atu.edu.eg', 'pakinam@example.com', 'Said Ahmed', '201020000150', 'Father', 'Alexandria', 'Nasr City', 'Coastal Rd', 'Egypt', 'Alexandria', 'Sidi Bishr', 'Sea St', 'Egypt', 'Cleared', 'None'),
(1059, 'Qassem', 'Adel', 'Hassan', 'قاسم عادل حسن', 'Male', 'Egyptian', '1993-10-17', 'Cairo', 'Single', 'Muslim', 'Active', '201010000151', '0323456824', 'q.hassan@atu.edu.eg', 'qassem@example.com', 'Adel Hassan', '201020000151', 'Father', 'Alexandria', 'Madinty', 'Villa 5', 'Egypt', 'Cairo', 'New Cairo', 'Waterway', 'Egypt', 'Cleared', 'None'),
(1060, 'Rana', 'Hassan', 'Ali', 'رنا حسن علي', 'Female', 'Egyptian', '1981-02-08', 'Mansoura', 'Divorced', 'Muslim', 'Leave', '201010000152', '0323456825', 'r.ali@atu.edu.eg', 'rana@example.com', 'Hamed Ali', '201020000152', 'Father', 'Alexandria', 'Rehab', 'Gate 1', 'Egypt', 'Mansoura', 'University', 'Gamaa St', 'Egypt', 'Cleared', 'None'),
(1061, 'Samir', 'Mohamed', 'Khalid', 'سمير محمد خالد', 'Male', 'Egyptian', '1979-05-18', 'Alexandria', 'Married', 'Muslim', 'Active', '201010000153', '0323456826', 's.khalid@atu.edu.eg', 'samir@example.com', 'Aisha Khalid', '201020000153', 'Mother', 'Alexandria', 'Giza', 'Cairo Rd', 'Egypt', 'Alexandria', 'Miami', '45 St', 'Egypt', 'Cleared', 'None'),
(1062, 'Toka', 'Ali', 'Waleed', 'تقى علي وليد', 'Female', 'Egyptian', '1991-08-25', 'Alexandria', 'Single', 'Muslim', 'Active', '201010000154', '0323456827', 't.waleed@atu.edu.eg', 'toka@example.com', 'Waleed Ali', '201020000154', 'Father', 'Alexandria', 'Maadi', 'Sea View', 'Egypt', 'Alexandria', 'Glim', 'Tram St', 'Egypt', 'Cleared', 'None'),
(1063, 'Usama', 'Said', 'Fouad', 'أسامة سعيد فؤاد', 'Male', 'Syrian', '1983-03-11', 'Damascus', 'Married', 'Muslim', 'Active', '201010000155', '0323456828', 'u.fouad@atu.edu.eg', 'usama@example.com', 'Nour Fouad', '201020000155', 'Cousin', 'Alexandria', 'Zamalek', 'Nile St', 'Egypt', 'Damascus', 'Mezzeh', 'Villas', 'Syria', 'Cleared', 'None'),
(1064, 'Vicky', 'Tarek', 'Maged', 'فيكي طارق ماجد', 'Female', 'Egyptian', '1994-01-20', 'Cairo', 'Single', 'Christian', 'Probation', '201010000156', '0323456829', 'v.maged@atu.edu.eg', 'vicky@example.com', 'Maged Tarek', '201020000156', 'Father', 'Alexandria', 'Heliopolis', 'Airport Rd', 'Egypt', 'Cairo', 'Sheraton', 'Buildings', 'Egypt', 'Pending', 'None'),

-- =======================================================
-- Dept 109: Clinical Pharmacy (New Dept, Need 10 employees)
-- =======================================================
(1065, 'Wael', 'Ashraf', 'Ali', 'وائل أشرف علي', 'Male', 'Egyptian', '1970-12-05', 'Alexandria', 'Married', 'Muslim', 'Active', '201010000157', '0323456830', 'w.ali@atu.edu.eg', 'wael@example.com', 'Ezzat Ali', '201020000157', 'Brother', 'Alexandria', 'Shoubra', 'Port St', 'Egypt', 'Alexandria', 'Bahary', 'Qaitbay', 'Egypt', 'Cleared', 'None'),
(1066, 'Xenia', 'Fathy', 'Ahmed', 'زينيا فتحي أحمد', 'Female', 'Egyptian', '1987-06-29', 'Giza', 'Married', 'Christian', 'Active', '201010000158', '0323456831', 'x.ahmed@atu.edu.eg', 'xenia@example.com', 'Said Ahmed', '201020000158', 'Husband', 'Alexandria', 'Nasr City', 'City Light', 'Egypt', 'Cairo', 'Mohandessin', 'Syria St', 'Egypt', 'Cleared', 'None'),
(1067, 'Youssef', 'Ezz', 'Hassan', 'يوسف عز حسن', 'Male', 'Egyptian', '1993-10-17', 'Cairo', 'Single', 'Muslim', 'Active', '201010000159', '0323456832', 'y.hassan@atu.edu.eg', 'youssef@example.com', 'Adel Hassan', '201020000159', 'Father', 'Alexandria', 'Madinty', 'Sea Rd', 'Egypt', 'Cairo', 'New Cairo', 'Lotus', 'Egypt', 'Cleared', 'None'),
(1068, 'Zahra', 'Hassan', 'Ali', 'زهرة حسن علي', 'Female', 'Egyptian', '1981-02-08', 'Alexandria', 'Single', 'Muslim', 'Leave', '201010000160', '0323456833', 'z.ali@atu.edu.eg', 'zahra@example.com', 'Hamed Ali', '201020000160', 'Father', 'Alexandria', 'Rehab', 'Corniche', 'Egypt', 'Alexandria', 'Stanly', 'Bridge St', 'Egypt', 'Cleared', 'None'),
(1069, 'Amin', 'Adel', 'Said', 'أمين عادل سعيد', 'Male', 'Egyptian', '1985-05-15', 'Cairo', 'Married', 'Muslim', 'Active', '201010000161', '0323456834', 'a.said@atu.edu.eg', 'amin@example.com', 'Adel Said', '201020000161', 'Father', 'Alexandria', 'Giza', 'Desert Rd', 'Egypt', 'Cairo', 'Haram', 'Maryotteya', 'Egypt', 'Cleared', 'None'),
(1070, 'Baraa', 'Sherif', 'Ali', 'براء شريف علي', 'Female', 'Egyptian', '1991-08-25', 'Alexandria', 'Single', 'Muslim', 'Active', '201010000162', '0323456835', 'b.ali@atu.edu.eg', 'baraa@example.com', 'Sherif Ali', '201020000162', 'Father', 'Alexandria', 'Maadi', 'Sea St', 'Egypt', 'Alexandria', 'Roushdy', 'Syria St', 'Egypt', 'Cleared', 'None'),
(1071, 'Camil', 'Omar', 'Fouad', 'كامل عمر فؤاد', 'Male', 'Syrian', '1983-03-11', 'Homs', 'Married', 'Christian', 'Active', '201010000163', '0323456836', 'c.fouad@atu.edu.eg', 'camil@example.com', 'Omar Fouad', '201020000163', 'Father', 'Alexandria', 'Zamalek', 'Delta Rd', 'Egypt', 'Homs', 'Old City', 'Church St', 'Syria', 'Cleared', 'None'),
(1072, 'Dana', 'Hesham', 'Tarek', 'دانا هشام طارق', 'Female', 'Egyptian', '1994-01-20', 'Cairo', 'Single', 'Muslim', 'Probation', '201010000164', '0323456837', 'd.tarek@atu.edu.eg', 'dana@example.com', 'Hesham Tarek', '201020000164', 'Father', 'Alexandria', 'Heliopolis', 'Smouha Rd', 'Egypt', 'Cairo', 'Heliopolis', 'Orouba', 'Egypt', 'Pending', 'None'),
(1073, 'Essam', 'Ezz', 'Ali', 'عصام عز علي', 'Male', 'Egyptian', '1970-12-05', 'Tanta', 'Married', 'Muslim', 'Active', '201010000165', '0323456838', 'e.ali@atu.edu.eg', 'essam@example.com', 'Ezz Ali', '201020000165', 'Father', 'Alexandria', 'Shoubra', 'Canal St', 'Egypt', 'Tanta', 'Stadium', 'Gamaa St', 'Egypt', 'Cleared', 'None'),
(1074, 'Farida', 'Said', 'Ahmed', 'فريدة سعيد أحمد', 'Female', 'Egyptian', '1987-06-29', 'Alexandria', 'Married', 'Muslim', 'Active', '201010000166', '0323456839', 'f.ahmed@atu.edu.eg', 'farida@example.com', 'Said Ahmed', '201020000166', 'Husband', 'Alexandria', 'Nasr City', 'Green St', 'Egypt', 'Alexandria', 'Victoria', 'Tram St', 'Egypt', 'Cleared', 'None'),

-- =======================================================
-- Dept 110: Horticulture (New Dept, Need 10 employees)
-- =======================================================
(1075, 'Gaber', 'Adel', 'Hassan', 'جابر عادل حسن', 'Male', 'Egyptian', '1993-10-17', 'Aswan', 'Single', 'Muslim', 'Active', '201010000167', '0953456840', 'g.hassan@nvu.edu.eg', 'gaber@example.com', 'Adel Hassan', '201020000167', 'Father', 'Aswan', 'Madinty', 'Nile Rd', 'Egypt', 'Aswan', 'Corniche', 'Nile St', 'Egypt', 'Cleared', 'None'),
(1076, 'Hanan', 'Hamed', 'Ali', 'حنان حامد علي', 'Female', 'Egyptian', '1981-02-08', 'Luxor', 'Widowed', 'Muslim', 'Leave', '201010000168', '0953456841', 'h.ali@nvu.edu.eg', 'hanan@example.com', 'Hamed Ali', '201020000168', 'Father', 'Aswan', 'Rehab', 'Sahara St', 'Egypt', 'Luxor', 'Karnak', 'Temple Rd', 'Egypt', 'Cleared', 'None'),
(1077, 'Ibrahim', 'Tarek', 'Khalid', 'إبراهيم طارق خالد', 'Male', 'Egyptian', '1979-05-18', 'Qena', 'Married', 'Muslim', 'Active', '201010000169', '0953456842', 'i.khalid@nvu.edu.eg', 'ibrahim@example.com', 'Aisha Khalid', '201020000169', 'Sister', 'Aswan', 'Giza', 'South Valley', 'Egypt', 'Qena', 'Center', 'Station St', 'Egypt', 'Cleared', 'None'),
(1078, 'Jihan', 'Fahmy', 'Ali', 'جيهان فهمي علي', 'Female', 'Egyptian', '1991-08-25', 'Aswan', 'Single', 'Muslim', 'Active', '201010000170', '0953456843', 'j.ali@nvu.edu.eg', 'jihan@example.com', 'Waleed Ali', '201020000170', 'Father', 'Aswan', 'Maadi', 'High Dam Rd', 'Egypt', 'Aswan', 'Sahara', 'Airport Rd', 'Egypt', 'Cleared', 'None'),
(1079, 'Khaled', 'Shoukry', 'Fouad', 'خالد شكري فؤاد', 'Male', 'Egyptian', '1983-03-11', 'Cairo', 'Married', 'Muslim', 'Active', '201010000171', '0953456844', 'k.fouad@nvu.edu.eg', 'khaled@example.com', 'Nour Fouad', '201020000171', 'Wife', 'Aswan', 'Zamalek', 'Island St', 'Egypt', 'Cairo', 'Zamalek', '26 July', 'Egypt', 'Cleared', 'None'),
(1080, 'Laila', 'Mounir', 'Tarek', 'ليلى منير طارق', 'Female', 'Egyptian', '1994-01-20', 'Aswan', 'Single', 'Muslim', 'Probation', '201010000172', '0953456845', 'l.tarek@nvu.edu.eg', 'laila@example.com', 'Maged Tarek', '201020000172', 'Father', 'Aswan', 'Heliopolis', 'Souq St', 'Egypt', 'Aswan', 'Center', 'Market St', 'Egypt', 'Pending', 'None'),
(1081, 'Magdy', 'Saad', 'Ali', 'مجدي سعد علي', 'Male', 'Egyptian', '1970-12-05', 'Kom Ombo', 'Married', 'Christian', 'Active', '201010000173', '0953456846', 'm.ali@nvu.edu.eg', 'magdy@example.com', 'Ezzat Ali', '201020000173', 'Father', 'Aswan', 'Shoubra', 'River St', 'Egypt', 'Kom Ombo', 'Center', 'Sugar Factory', 'Egypt', 'Cleared', 'None'),
(1082, 'Naglaa', 'Wael', 'Ahmed', 'نجلاء وائل أحمد', 'Female', 'Egyptian', '1987-06-29', 'Edfu', 'Married', 'Muslim', 'Active', '201010000174', '0953456847', 'n.ahmed@nvu.edu.eg', 'naglaa@example.com', 'Said Ahmed', '201020000174', 'Husband', 'Aswan', 'Nasr City', 'Temple St', 'Egypt', 'Edfu', 'Horus', 'Main St', 'Egypt', 'Cleared', 'None'),
(1083, 'Osman', 'Adel', 'Hassan', 'عثمان عادل حسن', 'Male', 'Egyptian', '1993-10-17', 'Aswan', 'Single', 'Muslim', 'Active', '201010000175', '0953456848', 'o.hassan@nvu.edu.eg', 'osman@example.com', 'Adel Hassan', '201020000175', 'Father', 'Aswan', 'Madinty', 'Nubia St', 'Egypt', 'Aswan', 'Nubia', 'Village 1', 'Egypt', 'Cleared', 'None'),
(1084, 'Pakinam', 'Hassan', 'Ali', 'باكينام حسن علي', 'Female', 'Egyptian', '1981-02-08', 'Aswan', 'Divorced', 'Muslim', 'Leave', '201010000176', '0953456849', 'p.ali@nvu.edu.eg', 'pakinam@example.com', 'Hamed Ali', '201020000176', 'Father', 'Aswan', 'Rehab', 'Corniche', 'Egypt', 'Aswan', 'Atlas', 'Row 4', 'Egypt', 'Cleared', 'None'),

-- =======================================================
-- Dept 111: Hotel Management (New Dept, Need 10 employees)
-- =======================================================
(1085, 'Qasim', 'Mohamed', 'Khalid', 'قاسم محمد خالد', 'Male', 'Egyptian', '1979-05-18', 'Aswan', 'Married', 'Muslim', 'Active', '201010000177', '0953456850', 'q.khalid@nvu.edu.eg', 'qasim@example.com', 'Aisha Khalid', '201020000177', 'Mother', 'Aswan', 'Giza', 'Hotel Rd', 'Egypt', 'Aswan', 'Corniche', 'Hotel Row', 'Egypt', 'Cleared', 'None'),
(1086, 'Rania', 'Ali', 'Waleed', 'رانيا علي وليد', 'Female', 'Egyptian', '1991-08-25', 'Luxor', 'Single', 'Muslim', 'Active', '201010000178', '0953456851', 'r.waleed@nvu.edu.eg', 'rania@example.com', 'Waleed Ali', '201020000178', 'Father', 'Aswan', 'Maadi', 'Tourist St', 'Egypt', 'Luxor', 'East Bank', 'Station St', 'Egypt', 'Cleared', 'None'),
(1087, 'Saad', 'Said', 'Fouad', 'سعد سعيد فؤاد', 'Male', 'Syrian', '1983-03-11', 'Latakia', 'Married', 'Muslim', 'Active', '201010000179', '0953456852', 's.fouad@nvu.edu.eg', 'saad@example.com', 'Nour Fouad', '201020000179', 'Wife', 'Aswan', 'Zamalek', 'Nile View', 'Egypt', 'Latakia', 'Beach', 'Corniche', 'Syria', 'Cleared', 'None'),
(1088, 'Tala', 'Tarek', 'Maged', 'تالا طارق ماجد', 'Female', 'Egyptian', '1994-01-20', 'Cairo', 'Single', 'Muslim', 'Probation', '201010000180', '0953456853', 't.maged@nvu.edu.eg', 'tala@example.com', 'Maged Tarek', '201020000180', 'Father', 'Aswan', 'Heliopolis', 'Museum St', 'Egypt', 'Cairo', 'Heliopolis', 'Ahram St', 'Egypt', 'Pending', 'None'),
(1089, 'Umar', 'Ashraf', 'Ali', 'عمر أشرف علي', 'Male', 'Egyptian', '1970-12-05', 'Aswan', 'Married', 'Muslim', 'Active', '201010000181', '0953456854', 'u.ali@nvu.edu.eg', 'umar@example.com', 'Ezzat Ali', '201020000181', 'Brother', 'Aswan', 'Shoubra', 'Market Rd', 'Egypt', 'Aswan', 'Old Market', 'Spice St', 'Egypt', 'Cleared', 'None'),
(1090, 'Walaa', 'Fathy', 'Ahmed', 'ولاء فتحي أحمد', 'Female', 'Egyptian', '1987-06-29', 'Qena', 'Married', 'Muslim', 'Active', '201010000182', '0953456855', 'w.ahmed@nvu.edu.eg', 'walaa@example.com', 'Said Ahmed', '201020000182', 'Husband', 'Aswan', 'Nasr City', 'University Rd', 'Egypt', 'Qena', 'University', 'Dorm St', 'Egypt', 'Cleared', 'None'),
(1091, 'Yazan', 'Ezz', 'Hassan', 'يزن عز حسن', 'Male', 'Egyptian', '1993-10-17', 'Cairo', 'Single', 'Muslim', 'Active', '201010000183', '0953456856', 'y.hassan@nvu.edu.eg', 'yazan@example.com', 'Adel Hassan', '201020000183', 'Father', 'Aswan', 'Madinty', 'Dam Rd', 'Egypt', 'Cairo', 'Rehab', 'Gate 9', 'Egypt', 'Cleared', 'None'),
(1092, 'Zainab', 'Hassan', 'Ali', 'زينب حسن علي', 'Female', 'Egyptian', '1981-02-08', 'Aswan', 'Single', 'Muslim', 'Leave', '201010000184', '0953456857', 'z.ali@nvu.edu.eg', 'zainab@example.com', 'Hamed Ali', '201020000184', 'Father', 'Aswan', 'Rehab', 'Corniche', 'Egypt', 'Aswan', 'Corniche', 'Plaza', 'Egypt', 'Cleared', 'None'),
(1093, 'Adam', 'Adel', 'Said', 'آدم عادل سعيد', 'Male', 'Egyptian', '1985-05-15', 'Luxor', 'Married', 'Muslim', 'Active', '201010000185', '0953456858', 'a.said@nvu.edu.eg', 'adam@example.com', 'Adel Said', '201020000185', 'Father', 'Aswan', 'Giza', 'Valley Rd', 'Egypt', 'Luxor', 'West Bank', 'Ferry St', 'Egypt', 'Cleared', 'None'),
(1094, 'Basma', 'Sherif', 'Ali', 'بسمة شريف علي', 'Female', 'Egyptian', '1991-08-25', 'Aswan', 'Single', 'Muslim', 'Active', '201010000186', '0953456859', 'b.ali@nvu.edu.eg', 'basma@example.com', 'Sherif Ali', '201020000186', 'Father', 'Aswan', 'Maadi', 'Nile St', 'Egypt', 'Aswan', 'Corniche', 'Club', 'Egypt', 'Cleared', 'None'),

-- =======================================================
-- Dept 112: Curriculum Studies (New Dept, Need 10 employees)
-- =======================================================
(1095, 'Charbel', 'Omar', 'Fouad', 'شربل عمر فؤاد', 'Male', 'Syrian', '1983-03-11', 'Hama', 'Married', 'Christian', 'Active', '201010000187', '0693456860', 'c.fouad@sca.edu.eg', 'charbel@example.com', 'Omar Fouad', '201020000187', 'Father', 'Sharm', 'Zamalek', 'Peace Rd', 'Egypt', 'Hama', 'Orontes', 'River St', 'Syria', 'Cleared', 'None'),
(1096, 'Dina', 'Hesham', 'Tarek', 'دينا هشام طارق', 'Female', 'Egyptian', '1994-01-20', 'Cairo', 'Single', 'Muslim', 'Probation', '201010000188', '0693456861', 'd.tarek@sca.edu.eg', 'dina@example.com', 'Hesham Tarek', '201020000188', 'Father', 'Sharm', 'Heliopolis', 'Resort Rd', 'Egypt', 'Cairo', 'Heliopolis', 'Marghany', 'Egypt', 'Pending', 'None'),
(1097, 'Ehab', 'Ezz', 'Ali', 'إيهاب عز علي', 'Male', 'Egyptian', '1970-12-05', 'Suez', 'Married', 'Muslim', 'Active', '201010000189', '0693456862', 'e.ali@sca.edu.eg', 'ehab@example.com', 'Ezz Ali', '201020000189', 'Father', 'Sharm', 'Shoubra', 'Ring Rd', 'Egypt', 'Suez', 'Canal', 'Port St', 'Egypt', 'Cleared', 'None'),
(1098, 'Fawzia', 'Said', 'Ahmed', 'فوزية سعيد أحمد', 'Female', 'Egyptian', '1987-06-29', 'Ismailia', 'Married', 'Muslim', 'Active', '201010000190', '0693456863', 'f.ahmed@sca.edu.eg', 'fawzia@example.com', 'Said Ahmed', '201020000190', 'Husband', 'Sharm', 'Nasr City', 'Sunny Lakes', 'Egypt', 'Ismailia', 'Garden City', 'Lake View', 'Egypt', 'Cleared', 'None'),
(1099, 'Gamal', 'Adel', 'Hassan', 'جمال عادل حسن', 'Male', 'Egyptian', '1993-10-17', 'Cairo', 'Single', 'Muslim', 'Active', '201010000191', '0693456864', 'g.hassan@sca.edu.eg', 'gamal@example.com', 'Adel Hassan', '201020000191', 'Father', 'Sharm', 'Madinty', 'Nabq Bay', 'Egypt', 'Cairo', 'Madinty', 'Zone 7', 'Egypt', 'Cleared', 'None'),
(1100, 'Hoda', 'Hamed', 'Ali', 'هدى حامد علي', 'Female', 'Egyptian', '1981-02-08', 'Sharm', 'Single', 'Muslim', 'Leave', '201010000192', '0693456865', 'h.ali@sca.edu.eg', 'hoda@example.com', 'Hamed Ali', '201020000192', 'Father', 'Sharm', 'Rehab', 'Hadaba', 'Egypt', 'Sharm', 'Hadaba', 'Light House', 'Egypt', 'Cleared', 'None'),
(1101, 'Ihab', 'Tarek', 'Khalid', 'إيهاب طارق خالد', 'Male', 'Egyptian', '1979-05-18', 'Cairo', 'Married', 'Muslim', 'Active', '201010000193', '0693456866', 'i.khalid@sca.edu.eg', 'ihab@example.com', 'Aisha Khalid', '201020000193', 'Sister', 'Sharm', 'Giza', 'Naama', 'Egypt', 'Cairo', 'Giza', 'Haram', 'Egypt', 'Cleared', 'None'),
(1102, 'Jamil', 'Fahmy', 'Ali', 'جميل فهمي علي', 'Female', 'Egyptian', '1991-08-25', 'Cairo', 'Single', 'Christian', 'Active', '201010000194', '0693456867', 'j.ali@sca.edu.eg', 'jamil@example.com', 'Waleed Ali', '201020000194', 'Father', 'Sharm', 'Maadi', 'Sharkia', 'Egypt', 'Cairo', 'Maadi', 'Degla', 'Egypt', 'Cleared', 'None'),
(1103, 'Kamel', 'Shoukry', 'Fouad', 'كامل شكري فؤاد', 'Male', 'Egyptian', '1983-03-11', 'Alexandria', 'Married', 'Christian', 'Active', '201010000195', '0693456868', 'k.fouad@sca.edu.eg', 'kamel@example.com', 'Nour Fouad', '201020000195', 'Sister', 'Sharm', 'Zamalek', 'Old Market', 'Egypt', 'Alexandria', 'Sporting', 'Club St', 'Egypt', 'Cleared', 'None'),
(1104, 'Lamia', 'Mounir', 'Tarek', 'لمياء منير طارق', 'Female', 'Egyptian', '1994-01-20', 'Cairo', 'Single', 'Muslim', 'Probation', '201010000196', '0693456869', 'l.tarek@sca.edu.eg', 'lamia@example.com', 'Maged Tarek', '201020000196', 'Father', 'Sharm', 'Heliopolis', 'Airport', 'Egypt', 'Cairo', 'Heliopolis', 'Thawra', 'Egypt', 'Pending', 'None'),

-- =======================================================
-- Dept 113: English Language (New Dept, Need 10 employees)
-- =======================================================
(1105, 'Marwan', 'Saad', 'Ali', 'مروان سعد علي', 'Male', 'Egyptian', '1970-12-05', 'Port Said', 'Married', 'Muslim', 'Active', '201010000197', '0693456870', 'm.ali@sca.edu.eg', 'marwan@example.com', 'Ezzat Ali', '201020000197', 'Brother', 'Sharm', 'Shoubra', 'Coast Rd', 'Egypt', 'Port Said', 'Port Fouad', 'Canal View', 'Egypt', 'Cleared', 'None'),
(1106, 'Nabilah', 'Wael', 'Ahmed', 'نبيلة وائل أحمد', 'Female', 'Egyptian', '1987-06-29', 'Cairo', 'Married', 'Muslim', 'Active', '201010000198', '0693456871', 'n.ahmed@sca.edu.eg', 'nabilah@example.com', 'Said Ahmed', '201020000198', 'Husband', 'Sharm', 'Nasr City', 'Domina', 'Egypt', 'Cairo', 'Nasr City', 'Hassan Maamoun', 'Egypt', 'Cleared', 'None'),
(1107, 'Osama', 'Adel', 'Hassan', 'أسامة عادل حسن', 'Male', 'Egyptian', '1993-10-17', 'Cairo', 'Single', 'Muslim', 'Active', '201010000199', '0693456872', 'o.hassan@sca.edu.eg', 'osama@example.com', 'Adel Hassan', '201020000199', 'Father', 'Sharm', 'Madinty', 'Montazah', 'Egypt', 'Cairo', 'Madinty', 'B8', 'Egypt', 'Cleared', 'None'),
(1108, 'Passant', 'Hassan', 'Ali', 'بسانت حسن علي', 'Female', 'Egyptian', '1981-02-08', 'Sharm', 'Single', 'Muslim', 'Leave', '201010000200', '0693456873', 'p.ali@sca.edu.eg', 'passant@example.com', 'Hamed Ali', '201020000200', 'Father', 'Sharm', 'Rehab', 'Rowaysat', 'Egypt', 'Sharm', 'Rowaysat', 'Ind Area', 'Egypt', 'Cleared', 'None'),
(1109, 'Riad', 'Mohamed', 'Khalid', 'رياض محمد خالد', 'Male', 'Egyptian', '1979-05-18', 'Cairo', 'Married', 'Muslim', 'Active', '201010000201', '0693456874', 'r.khalid@sca.edu.eg', 'riad@example.com', 'Aisha Khalid', '201020000201', 'Mother', 'Sharm', 'Giza', 'Cliff', 'Egypt', 'Cairo', 'Giza', 'Faisal', 'Egypt', 'Cleared', 'None'),
(1110, 'Samar', 'Ali', 'Waleed', 'سمر علي وليد', 'Female', 'Egyptian', '1991-08-25', 'Cairo', 'Single', 'Muslim', 'Active', '201010000202', '0693456875', 's.waleed@sca.edu.eg', 'samar@example.com', 'Waleed Ali', '201020000202', 'Father', 'Sharm', 'Maadi', 'Tower', 'Egypt', 'Cairo', 'Maadi', 'Road 233', 'Egypt', 'Cleared', 'None'),
(1111, 'Taher', 'Said', 'Fouad', 'طاهر سعيد فؤاد', 'Male', 'Syrian', '1983-03-11', 'Damascus', 'Married', 'Muslim', 'Active', '201010000203', '0693456876', 't.fouad@sca.edu.eg', 'taher@example.com', 'Nour Fouad', '201020000203', 'Cousin', 'Sharm', 'Zamalek', 'Neama', 'Egypt', 'Damascus', 'Dummar', 'Project', 'Syria', 'Cleared', 'None'),
(1112, 'Warda', 'Tarek', 'Maged', 'وردة طارق ماجد', 'Female', 'Egyptian', '1994-01-20', 'Cairo', 'Single', 'Muslim', 'Probation', '201010000204', '0693456877', 'w.maged@sca.edu.eg', 'warda@example.com', 'Maged Tarek', '201020000204', 'Father', 'Sharm', 'Heliopolis', 'Park', 'Egypt', 'Cairo', 'Heliopolis', 'Salah Salem', 'Egypt', 'Pending', 'None'),
(1113, 'Yasser', 'Ashraf', 'Ali', 'ياسر أشرف علي', 'Male', 'Egyptian', '1970-12-05', 'Hurghada', 'Married', 'Muslim', 'Active', '201010000205', '0693456878', 'y.ali@sca.edu.eg', 'yasser@example.com', 'Ezzat Ali', '201020000205', 'Brother', 'Sharm', 'Shoubra', 'Bay', 'Egypt', 'Hurghada', 'Sheraton', 'Rd', 'Egypt', 'Cleared', 'None'),
(1114, 'Zahra', 'Fathy', 'Ahmed', 'زهرة فتحي أحمد', 'Female', 'Egyptian', '1987-06-29', 'Suez', 'Married', 'Muslim', 'Active', '201010000206', '0693456879', 'z.ahmed@sca.edu.eg', 'zahra@example.com', 'Said Ahmed', '201020000206', 'Husband', 'Sharm', 'Nasr City', 'Sharm Rd', 'Egypt', 'Suez', 'Port', 'Gate 1', 'Egypt', 'Cleared', 'None'),

-- =======================================================
-- Dept 114: Physics (New Dept, Need 10 employees)
-- =======================================================
(1115, 'Alaa', 'Ezz', 'Hassan', 'علاء عز حسن', 'Male', 'Egyptian', '1993-10-17', 'Mansoura', 'Single', 'Muslim', 'Active', '201010000207', '0483456880', 'a.hassan@dus.edu.eg', 'alaa@example.com', 'Adel Hassan', '201020000207', 'Father', 'Mansoura', 'Madinty', 'Gamaa St', 'Egypt', 'Mansoura', 'University', 'Main Gate', 'Egypt', 'Cleared', 'None'),
(1116, 'Bassel', 'Hassan', 'Ali', 'باسل حسن علي', 'Male', 'Egyptian', '1981-02-08', 'Mansoura', 'Married', 'Muslim', 'Leave', '201010000208', '0483456881', 'b.ali@dus.edu.eg', 'bassel@example.com', 'Hamed Ali', '201020000208', 'Father', 'Mansoura', 'Rehab', 'Canal Rd', 'Egypt', 'Mansoura', 'Toriel', 'Canal St', 'Egypt', 'Cleared', 'None'),
(1117, 'Dalal', 'Adel', 'Said', 'دلال عادل سعيد', 'Female', 'Egyptian', '1985-05-15', 'Damietta', 'Married', 'Muslim', 'Active', '201010000209', '0483456882', 'd.said@dus.edu.eg', 'dalal@example.com', 'Adel Said', '201020000209', 'Father', 'Mansoura', 'Giza', 'Nile St', 'Egypt', 'Damietta', 'Ras El Bar', 'Nile St', 'Egypt', 'Cleared', 'None'),
(1118, 'Ehab', 'Sherif', 'Ali', 'إيهاب شريف علي', 'Male', 'Egyptian', '1991-08-25', 'Mansoura', 'Single', 'Muslim', 'Active', '201010000210', '0483456883', 'e.ali@dus.edu.eg', 'ehab@example.com', 'Sherif Ali', '201020000210', 'Father', 'Mansoura', 'Maadi', 'Republic St', 'Egypt', 'Mansoura', 'Gimhoria', 'St 1', 'Egypt', 'Cleared', 'None'),
(1119, 'Fares', 'Omar', 'Fouad', 'فارس عمر فؤاد', 'Male', 'Syrian', '1983-03-11', 'Aleppo', 'Married', 'Muslim', 'Active', '201010000211', '0483456884', 'f.fouad@dus.edu.eg', 'fares@example.com', 'Omar Fouad', '201020000211', 'Father', 'Mansoura', 'Zamalek', 'Mashaya', 'Egypt', 'Aleppo', 'Jamiliyeh', 'Center', 'Syria', 'Cleared', 'None'),
(1120, 'Gamila', 'Hesham', 'Tarek', 'جميلة هشام طارق', 'Female', 'Egyptian', '1994-01-20', 'Cairo', 'Single', 'Muslim', 'Probation', '201010000212', '0483456885', 'g.tarek@dus.edu.eg', 'gamila@example.com', 'Hesham Tarek', '201020000212', 'Father', 'Mansoura', 'Heliopolis', 'Port Said St', 'Egypt', 'Cairo', 'Heliopolis', 'Korba', 'Egypt', 'Pending', 'None'),
(1121, 'Hany', 'Ezz', 'Ali', 'هاني عز علي', 'Male', 'Egyptian', '1970-12-05', 'Mansoura', 'Married', 'Muslim', 'Active', '201010000213', '0483456886', 'h.ali@dus.edu.eg', 'hany@example.com', 'Ezz Ali', '201020000213', 'Father', 'Mansoura', 'Shoubra', 'Suez Canal St', 'Egypt', 'Mansoura', 'Suez Canal', 'Main Rd', 'Egypt', 'Cleared', 'None'),
(1122, 'Inas', 'Said', 'Ahmed', 'إيناس سعيد أحمد', 'Female', 'Egyptian', '1987-06-29', 'Tanta', 'Married', 'Muslim', 'Active', '201010000214', '0483456887', 'i.ahmed@dus.edu.eg', 'inas@example.com', 'Said Ahmed', '201020000214', 'Husband', 'Mansoura', 'Nasr City', 'Geish St', 'Egypt', 'Tanta', 'Moheb', 'St 12', 'Egypt', 'Cleared', 'None'),
(1123, 'Jaber', 'Adel', 'Hassan', 'جابر عادل حسن', 'Male', 'Egyptian', '1993-10-17', 'Mansoura', 'Single', 'Muslim', 'Active', '201010000215', '0483456888', 'j.hassan@dus.edu.eg', 'jaber@example.com', 'Adel Hassan', '201020000215', 'Father', 'Mansoura', 'Madinty', 'Talkha Rd', 'Egypt', 'Mansoura', 'Talkha', 'Bridge St', 'Egypt', 'Cleared', 'None'),
(1124, 'Khadija', 'Hamed', 'Ali', 'خديجة حامد علي', 'Female', 'Egyptian', '1981-02-08', 'Mansoura', 'Widowed', 'Muslim', 'Leave', '201010000216', '0483456889', 'k.ali@dus.edu.eg', 'khadija@example.com', 'Hamed Ali', '201020000216', 'Father', 'Mansoura', 'Rehab', 'Semad', 'Egypt', 'Mansoura', 'Semad', 'Factory Rd', 'Egypt', 'Cleared', 'None'),

-- =======================================================
-- Dept 115: Urban Planning (New Dept, Need 10 employees)
-- =======================================================
(1125, 'Lotfy', 'Tarek', 'Khalid', 'لطفي طارق خالد', 'Male', 'Egyptian', '1979-05-18', 'Mansoura', 'Married', 'Muslim', 'Active', '201010000217', '0483456890', 'l.khalid@dus.edu.eg', 'lotfy@example.com', 'Aisha Khalid', '201020000217', 'Sister', 'Mansoura', 'Giza', 'Abbas St', 'Egypt', 'Mansoura', 'Abbas', 'Main St', 'Egypt', 'Cleared', 'None'),
(1126, 'Maha', 'Fahmy', 'Ali', 'مها فهمي علي', 'Female', 'Egyptian', '1991-08-25', 'Mansoura', 'Single', 'Christian', 'Active', '201010000218', '0483456891', 'm.ali@dus.edu.eg', 'maha@example.com', 'Waleed Ali', '201020000218', 'Father', 'Mansoura', 'Maadi', 'Toriel', 'Egypt', 'Mansoura', 'Toriel', 'New St', 'Egypt', 'Cleared', 'None'),
(1127, 'Nader', 'Shoukry', 'Fouad', 'نادر شكري فؤاد', 'Male', 'Egyptian', '1983-03-11', 'Cairo', 'Married', 'Christian', 'Active', '201010000219', '0483456892', 'n.fouad@dus.edu.eg', 'nader@example.com', 'Nour Fouad', '201020000219', 'Cousin', 'Mansoura', 'Zamalek', 'Mashaya', 'Egypt', 'Cairo', 'Zamalek', 'Brazil St', 'Egypt', 'Cleared', 'None'),
(1128, 'Ola', 'Mounir', 'Tarek', 'علا منير طارق', 'Female', 'Egyptian', '1994-01-20', 'Cairo', 'Single', 'Muslim', 'Probation', '201010000220', '0483456893', 'o.tarek@dus.edu.eg', 'ola@example.com', 'Maged Tarek', '201020000220', 'Father', 'Mansoura', 'Heliopolis', 'Gamaa', 'Egypt', 'Cairo', 'Nasr City', 'Youssef Abbas', 'Egypt', 'Pending', 'None'),
(1129, 'Qasim', 'Saad', 'Ali', 'قاسم سعد علي', 'Male', 'Egyptian', '1970-12-05', 'Mansoura', 'Married', 'Muslim', 'Active', '201010000221', '0483456894', 'q.ali@dus.edu.eg', 'qasim@example.com', 'Ezzat Ali', '201020000221', 'Brother', 'Mansoura', 'Shoubra', 'Canal', 'Egypt', 'Mansoura', 'Suez Canal', 'Bank St', 'Egypt', 'Cleared', 'None'),
(1130, 'Rasha', 'Wael', 'Ahmed', 'رشا وائل أحمد', 'Female', 'Egyptian', '1987-06-29', 'Damietta', 'Married', 'Muslim', 'Active', '201010000222', '0483456895', 'r.ahmed@dus.edu.eg', 'rasha@example.com', 'Said Ahmed', '201020000222', 'Husband', 'Mansoura', 'Nasr City', 'Port Said', 'Egypt', 'Damietta', 'Center', 'Nile St', 'Egypt', 'Cleared', 'None'),
(1131, 'Said', 'Adel', 'Hassan', 'سعيد عادل حسن', 'Male', 'Egyptian', '1993-10-17', 'Mansoura', 'Single', 'Muslim', 'Active', '201010000223', '0483456896', 's.hassan@dus.edu.eg', 'said@example.com', 'Adel Hassan', '201020000223', 'Father', 'Mansoura', 'Madinty', 'Talkha', 'Egypt', 'Mansoura', 'Talkha', 'Club St', 'Egypt', 'Cleared', 'None'),
(1132, 'Tala', 'Hassan', 'Ali', 'تالا حسن علي', 'Female', 'Egyptian', '1981-02-08', 'Mansoura', 'Single', 'Muslim', 'Leave', '201010000224', '0483456897', 't.ali@dus.edu.eg', 'tala@example.com', 'Hamed Ali', '201020000224', 'Father', 'Mansoura', 'Rehab', 'University', 'Egypt', 'Mansoura', 'University', 'Dorm Rd', 'Egypt', 'Cleared', 'None'),
(1133, 'Usama', 'Mohamed', 'Khalid', 'أسامة محمد خالد', 'Male', 'Egyptian', '1979-05-18', 'Mansoura', 'Married', 'Muslim', 'Active', '201010000225', '0483456898', 'u.khalid@dus.edu.eg', 'usama@example.com', 'Aisha Khalid', '201020000225', 'Mother', 'Mansoura', 'Giza', 'Geish', 'Egypt', 'Mansoura', 'Geish', 'Barracks', 'Egypt', 'Cleared', 'None'),
(1134, 'Wafaa', 'Ali', 'Waleed', 'وفاء علي وليد', 'Female', 'Egyptian', '1991-08-25', 'Mansoura', 'Single', 'Muslim', 'Active', '201010000226', '0483456899', 'w.waleed@dus.edu.eg', 'wafaa@example.com', 'Waleed Ali', '201020000226', 'Father', 'Mansoura', 'Maadi', 'Toriel', 'Egypt', 'Mansoura', 'Toriel', 'Old St', 'Egypt', 'Cleared', 'None'),

-- =======================================================
-- Dept 116: Pediatric Nursing (New Dept, Need 10 employees)
-- =======================================================
(1135, 'Yassin', 'Said', 'Fouad', 'ياسين سعيد فؤاد', 'Male', 'Syrian', '1983-03-11', 'Homs', 'Married', 'Muslim', 'Active', '201010000227', '0483456900', 'y.fouad@dus.edu.eg', 'yassin@example.com', 'Nour Fouad', '201020000227', 'Cousin', 'Mansoura', 'Zamalek', 'Mashaya', 'Egypt', 'Homs', 'Center', 'Clock St', 'Syria', 'Cleared', 'None'),
(1136, 'Zina', 'Tarek', 'Maged', 'زينة طارق ماجد', 'Female', 'Egyptian', '1994-01-20', 'Cairo', 'Single', 'Muslim', 'Probation', '201010000228', '0483456901', 'z.maged@dus.edu.eg', 'zina@example.com', 'Maged Tarek', '201020000228', 'Father', 'Mansoura', 'Heliopolis', 'Gamaa', 'Egypt', 'Cairo', 'Heliopolis', 'Beirut St', 'Egypt', 'Pending', 'None'),
(1137, 'Ayman', 'Ashraf', 'Ali', 'أيمن أشرف علي', 'Male', 'Egyptian', '1970-12-05', 'Mansoura', 'Married', 'Muslim', 'Active', '201010000229', '0483456902', 'a.ali@dus.edu.eg', 'ayman@example.com', 'Ezzat Ali', '201020000229', 'Brother', 'Mansoura', 'Shoubra', 'Canal', 'Egypt', 'Mansoura', 'Suez Canal', 'School St', 'Egypt', 'Cleared', 'None'),
(1138, 'Basant', 'Fathy', 'Ahmed', 'بسانت فتحي أحمد', 'Female', 'Egyptian', '1987-06-29', 'Tanta', 'Married', 'Muslim', 'Active', '201010000230', '0483456903', 'b.ahmed@dus.edu.eg', 'basant@example.com', 'Said Ahmed', '201020000230', 'Husband', 'Mansoura', 'Nasr City', 'Port Said', 'Egypt', 'Tanta', 'Gharbia', 'Main Rd', 'Egypt', 'Cleared', 'None'),
(1139, 'Dina', 'Ezz', 'Hassan', 'دينا عز حسن', 'Female', 'Egyptian', '1993-10-17', 'Mansoura', 'Single', 'Muslim', 'Active', '201010000231', '0483456904', 'd.hassan@dus.edu.eg', 'dina@example.com', 'Adel Hassan', '201020000231', 'Father', 'Mansoura', 'Madinty', 'Talkha', 'Egypt', 'Mansoura', 'Talkha', 'River Rd', 'Egypt', 'Cleared', 'None'),
(1140, 'Eyad', 'Hassan', 'Ali', 'إياد حسن علي', 'Male', 'Egyptian', '1981-02-08', 'Mansoura', 'Married', 'Muslim', 'Leave', '201010000232', '0483456905', 'e.ali@dus.edu.eg', 'eyad@example.com', 'Hamed Ali', '201020000232', 'Father', 'Mansoura', 'Rehab', 'University', 'Egypt', 'Mansoura', 'University', 'Gate 2', 'Egypt', 'Cleared', 'None'),
(1141, 'Faten', 'Adel', 'Said', 'فاتن عادل سعيد', 'Female', 'Egyptian', '1985-05-15', 'Cairo', 'Married', 'Muslim', 'Active', '201010000233', '0483456906', 'f.said@dus.edu.eg', 'faten@example.com', 'Adel Said', '201020000233', 'Father', 'Mansoura', 'Giza', 'Nile', 'Egypt', 'Cairo', 'Giza', 'Nile St', 'Egypt', 'Cleared', 'None'),
(1142, 'Ghada', 'Sherif', 'Ali', 'غادة شريف علي', 'Female', 'Egyptian', '1991-08-25', 'Mansoura', 'Single', 'Muslim', 'Active', '201010000234', '0483456907', 'g.ali@dus.edu.eg', 'ghada@example.com', 'Sherif Ali', '201020000234', 'Father', 'Mansoura', 'Maadi', 'Republic', 'Egypt', 'Mansoura', 'Gimhoria', 'Cinema St', 'Egypt', 'Cleared', 'None'),
(1143, 'Hatem', 'Omar', 'Fouad', 'حاتم عمر فؤاد', 'Male', 'Syrian', '1983-03-11', 'Aleppo', 'Married', 'Muslim', 'Active', '201010000235', '0483456908', 'h.fouad@dus.edu.eg', 'hatem@example.com', 'Omar Fouad', '201020000235', 'Father', 'Mansoura', 'Zamalek', 'Mashaya', 'Egypt', 'Aleppo', 'Seif', 'Dawla', 'Syria', 'Cleared', 'None'),
(1144, 'Inji', 'Hesham', 'Tarek', 'إنجي هشام طارق', 'Female', 'Egyptian', '1994-01-20', 'Cairo', 'Single', 'Muslim', 'Probation', '201010000236', '0483456909', 'i.tarek@dus.edu.eg', 'inji@example.com', 'Hesham Tarek', '201020000236', 'Father', 'Mansoura', 'Heliopolis', 'Port Said', 'Egypt', 'Cairo', 'Heliopolis', 'Khalifa St', 'Egypt', 'Pending', 'None'),
-- =======================================================
-- Dept 118: Student Affairs (Delta Univ) - 10 Employees
-- =======================================================
(1155, 'Mohamed', 'Salah', 'Ghaly', 'محمد صلاح غالي', 'Male', 'Egyptian', '1987-06-15', 'Mansoura', 'Married', 'Muslim', 'Active', '0483456920', '0482223333', 'm.ghaly@dus.edu.eg', 'mohamed@example.com', 'Salah Ghaly', '201011112232', 'Father', 'Mansoura', 'Gimhoria', 'Bank St', 'Egypt', 'Mansoura', 'Gimhoria', 'Bank St', 'Egypt', 'Cleared', 'None'),
(1156, 'Sara', 'Mahmoud', 'Khatib', 'سارة محمود خطيب', 'Female', 'Egyptian', '1993-02-28', 'Mansoura', 'Single', 'Muslim', 'Active', '0483456921', '0482223334', 's.khatib@dus.edu.eg', 'sara@example.com', 'Mahmoud Khatib', '201011112233', 'Father', 'Mansoura', 'Toriel', 'Saad Zaghloul', 'Egypt', 'Mansoura', 'Toriel', 'Saad Zaghloul', 'Egypt', 'Cleared', 'None'),
(1157, 'Hassan', 'Fathy', 'Sorour', 'حسن فتحي سرور', 'Male', 'Egyptian', '1980-09-10', 'Damietta', 'Married', 'Muslim', 'Active', '0483456922', '0482223335', 'h.sorour@dus.edu.eg', 'hassan@example.com', 'Fathy Sorour', '201011112234', 'Father', 'Mansoura', 'Mashaya', 'Nile Rd', 'Egypt', 'Damietta', 'Ras El Bar', '101 St', 'Egypt', 'Cleared', 'None'),
(1158, 'Noha', 'Samir', 'Zaki', 'نهى سمير زكي', 'Female', 'Egyptian', '1995-12-05', 'Mansoura', 'Single', 'Christian', 'Probation', '0483456923', '0482223336', 'n.zaki@dus.edu.eg', 'noha@example.com', 'Samir Zaki', '201011112235', 'Father', 'Mansoura', 'University', 'Gamaa St', 'Egypt', 'Mansoura', 'University', 'Gamaa St', 'Egypt', 'Pending', 'None'),
(1159, 'Ali', 'Maher', 'Hamza', 'علي ماهر حمزة', 'Male', 'Egyptian', '1990-07-20', 'Mansoura', 'Married', 'Muslim', 'Active', '0483456924', '0482223337', 'a.hamza@dus.edu.eg', 'ali@example.com', 'Maher Hamza', '201011112236', 'Father', 'Mansoura', 'Suez Canal', 'Canal Rd', 'Egypt', 'Mansoura', 'Suez Canal', 'Canal Rd', 'Egypt', 'Cleared', 'None'),
(1160, 'Reem', 'Ashraf', 'Mourad', 'ريم أشرف مراد', 'Female', 'Egyptian', '1992-04-12', 'Mansoura', 'Single', 'Muslim', 'Active', '0483456925', '0482223338', 'r.mourad@dus.edu.eg', 'reem@example.com', 'Ashraf Mourad', '201011112237', 'Father', 'Mansoura', 'Haye El Gamaa', 'Side St', 'Egypt', 'Mansoura', 'Haye El Gamaa', 'Side St', 'Egypt', 'Cleared', 'None'),
(1161, 'Tarek', 'Hamed', 'Shaker', 'طارق حامد شاكر', 'Male', 'Egyptian', '1985-01-30', 'Mansoura', 'Married', 'Muslim', 'Active', '0483456926', '0482223339', 't.shaker@dus.edu.eg', 'tarek@example.com', 'Hamed Shaker', '201011112238', 'Father', 'Mansoura', 'Talkha', 'Bridge Rd', 'Egypt', 'Mansoura', 'Talkha', 'Bridge Rd', 'Egypt', 'Cleared', 'None'),
(1162, 'Laila', 'Omar', 'Sharif', 'ليلى عمر شريف', 'Female', 'Egyptian', '1988-11-15', 'Mansoura', 'Divorced', 'Muslim', 'Leave', '0483456927', '0482223340', 'l.sharif@dus.edu.eg', 'laila@example.com', 'Omar Sharif', '201011112239', 'Father', 'Mansoura', 'Semad', 'Factory Rd', 'Egypt', 'Mansoura', 'Semad', 'Factory Rd', 'Egypt', 'Cleared', 'None'),
(1163, 'Youssef', 'Amr', 'Diab', 'يوسف عمرو دياب', 'Male', 'Egyptian', '1994-08-08', 'Mansoura', 'Single', 'Muslim', 'Active', '0483456928', '0482223341', 'y.diab@dus.edu.eg', 'youssef@example.com', 'Amr Diab', '201011112240', 'Father', 'Mansoura', 'Awkaf', 'Mosque St', 'Egypt', 'Mansoura', 'Awkaf', 'Mosque St', 'Egypt', 'Cleared', 'None'),
(1164, 'Mina', 'Gerges', 'Boulos', 'مينا جرجس بولس', 'Male', 'Egyptian', '1991-03-25', 'Mansoura', 'Married', 'Christian', 'Active', '0483456929', '0482223342', 'm.boulos@dus.edu.eg', 'mina@example.com', 'Gerges Boulos', '201011112241', 'Father', 'Mansoura', 'Sekka', 'Train St', 'Egypt', 'Mansoura', 'Sekka', 'Train St', 'Egypt', 'Cleared', 'None'),

-- =======================================================
-- Dept 119: Admissions Office (Sinai College) - 10 Employees
-- =======================================================
(1165, 'Rami', 'Said', 'Emam', 'رامي سعيد إمام', 'Male', 'Egyptian', '1986-05-10', 'Cairo', 'Married', 'Muslim', 'Active', '0693456930', '0692223333', 'r.emam@sca.edu.eg', 'rami@example.com', 'Said Emam', '201011112242', 'Father', 'Sharm', 'Naama Bay', 'Main Rd', 'Egypt', 'Cairo', 'Mohandessin', 'Lebanon Sq', 'Egypt', 'Cleared', 'None'),
(1166, 'Nada', 'Hassan', 'Youssef', 'ندى حسن يوسف', 'Female', 'Egyptian', '1993-09-18', 'Cairo', 'Single', 'Muslim', 'Active', '0693456931', '0692223334', 'n.youssef@sca.edu.eg', 'nada@example.com', 'Hassan Youssef', '201011112243', 'Father', 'Sharm', 'Hadaba', 'Fanar St', 'Egypt', 'Cairo', 'Dokki', 'Messaha', 'Egypt', 'Cleared', 'None'),
(1167, 'Karim', 'Abdel', 'Aziz', 'كريم عبد العزيز', 'Male', 'Egyptian', '1982-12-30', 'Giza', 'Married', 'Muslim', 'Active', '0693456932', '0692223335', 'k.aziz@sca.edu.eg', 'karim@example.com', 'Abdel Aziz', '201011112244', 'Father', 'Sharm', 'Sharkia', 'Resort Rd', 'Egypt', 'Giza', 'Agouza', 'Nile St', 'Egypt', 'Cleared', 'None'),
(1168, 'Aya', 'Mohamed', 'Ramadan', 'آية محمد رمضان', 'Female', 'Egyptian', '1995-02-14', 'Cairo', 'Single', 'Muslim', 'Probation', '0693456933', '0692223336', 'a.ramadan@sca.edu.eg', 'aya@example.com', 'Mohamed Ramadan', '201011112245', 'Father', 'Sharm', 'Nabq', 'Lagoon View', 'Egypt', 'Cairo', 'Haram', 'Arts St', 'Egypt', 'Pending', 'None'),
(1169, 'Maged', 'Helmy', 'Zaki', 'ماجد حلمي زكي', 'Male', 'Egyptian', '1990-06-22', 'Alexandria', 'Married', 'Christian', 'Active', '0693456934', '0692223337', 'm.zaki@sca.edu.eg', 'maged@example.com', 'Helmy Zaki', '201011112246', 'Father', 'Sharm', 'Hay El Nour', 'Peace Rd', 'Egypt', 'Alexandria', 'Ibrahimia', 'Lagget', 'Egypt', 'Cleared', 'None'),
(1170, 'Hanan', 'Turk', 'Adam', 'حنان ترك آدم', 'Female', 'Egyptian', '1989-11-11', 'Cairo', 'Divorced', 'Muslim', 'Active', '0693456935', '0692223338', 'h.adam@sca.edu.eg', 'hanan@example.com', 'Turk Adam', '201011112247', 'Father', 'Sharm', 'Old Market', 'Souq St', 'Egypt', 'Cairo', 'Maadi', 'St 9', 'Egypt', 'Cleared', 'None'),
(1171, 'Amr', 'Waked', 'Saeed', 'عمرو واكد سعيد', 'Male', 'Egyptian', '1984-08-05', 'Cairo', 'Married', 'Muslim', 'Active', '0693456936', '0692223339', 'a.saeed@sca.edu.eg', 'amr@example.com', 'Waked Saeed', '201011112248', 'Father', 'Sharm', 'Delta Sharm', 'Villa 12', 'Egypt', 'Cairo', 'Tagamoa', 'Lake View', 'Egypt', 'Cleared', 'None'),
(1172, 'Yasmin', 'Sabry', 'Mahmoud', 'ياسمين صبري محمود', 'Female', 'Egyptian', '1992-01-20', 'Alexandria', 'Single', 'Muslim', 'Leave', '0693456937', '0692223340', 'y.mahmoud@sca.edu.eg', 'yasmin@example.com', 'Sabry Mahmoud', '201011112249', 'Father', 'Sharm', 'Rowaysat', 'Ind St', 'Egypt', 'Alexandria', 'Shatby', 'Corniche', 'Egypt', 'Cleared', 'None'),
(1173, 'Khaled', 'Nabawy', 'Saleh', 'خالد نبوي صالح', 'Male', 'Egyptian', '1994-04-15', 'Cairo', 'Single', 'Muslim', 'Active', '0693456938', '0692223341', 'k.saleh@sca.edu.eg', 'khaled@example.com', 'Nabawy Saleh', '201011112250', 'Father', 'Sharm', 'Montazah', 'Sea View', 'Egypt', 'Cairo', 'Rehab', 'Gate 1', 'Egypt', 'Cleared', 'None'),
(1174, 'Mona', 'Zaki', 'Ahmed', 'منى زكي أحمد', 'Female', 'Egyptian', '1991-10-08', 'Cairo', 'Married', 'Muslim', 'Active', '0693456939', '0692223342', 'm.ahmed@sca.edu.eg', 'mona@example.com', 'Zaki Ahmed', '201011112251', 'Father', 'Sharm', 'Naama Bay', 'King St', 'Egypt', 'Cairo', 'Zamalek', 'Maraashly', 'Egypt', 'Cleared', 'None'),

-- =======================================================
-- Dept 120: Campus Security (Cairo Univ) - 10 Employees
-- =======================================================
(1175, 'Sayed', 'Ragab', 'Hassan', 'سيد رجب حسن', 'Male', 'Egyptian', '1975-09-09', 'Cairo', 'Married', 'Muslim', 'Active', '0223456940', '0222223333', 's.hassan@ciu.edu.eg', 'sayed@example.com', 'Ragab Hassan', '201011112252', 'Father', 'Cairo', 'Sayeda Zeinab', 'Port Said St', 'Egypt', 'Cairo', 'Sayeda Zeinab', 'Port Said St', 'Egypt', 'Cleared', 'None'),
(1176, 'Mohamed', 'Lotfy', 'Mansour', 'محمد لطفي منصور', 'Male', 'Egyptian', '1980-03-15', 'Giza', 'Married', 'Muslim', 'Active', '0223456941', '0222223334', 'm.mansour@ciu.edu.eg', 'mohamed@example.com', 'Lotfy Mansour', '201011112253', 'Father', 'Cairo', 'Imbaba', 'Nile St', 'Egypt', 'Cairo', 'Imbaba', 'Nile St', 'Egypt', 'Cleared', 'None'),
(1177, 'Ashraf', 'Abdel', 'Baky', 'أشرف عبد الباقي', 'Male', 'Egyptian', '1978-11-20', 'Cairo', 'Married', 'Muslim', 'Active', '0223456942', '0222223335', 'a.baky@ciu.edu.eg', 'ashraf@example.com', 'Abdel Baky', '201011112254', 'Father', 'Cairo', 'Hadayek Kobba', 'Misr Sudan', 'Egypt', 'Cairo', 'Hadayek Kobba', 'Misr Sudan', 'Egypt', 'Cleared', 'None'),
(1178, 'Ahmed', 'Sakka', 'Fares', 'أحمد سقا فارس', 'Male', 'Egyptian', '1985-05-05', 'Cairo', 'Married', 'Muslim', 'Active', '0223456943', '0222223336', 'a.fares@ciu.edu.eg', 'ahmed@example.com', 'Sakka Fares', '201011112255', 'Father', 'Cairo', 'Mohandessin', 'Shehab St', 'Egypt', 'Cairo', 'Mohandessin', 'Shehab St', 'Egypt', 'Cleared', 'None'),
(1179, 'Amir', 'Karara', 'Selim', 'أمير كرارة سليم', 'Male', 'Egyptian', '1988-08-10', 'Cairo', 'Married', 'Muslim', 'Active', '0223456944', '0222223337', 'a.selim@ciu.edu.eg', 'amir@example.com', 'Karara Selim', '201011112256', 'Father', 'Cairo', 'Tagamoa', '90 St', 'Egypt', 'Cairo', 'Tagamoa', '90 St', 'Egypt', 'Cleared', 'None'),
(1180, 'Yasser', 'Galal', 'Tawfik', 'ياسر جلال توفيق', 'Male', 'Egyptian', '1982-04-16', 'Alexandria', 'Married', 'Muslim', 'Active', '0223456945', '0222223338', 'y.tawfik@ciu.edu.eg', 'yasser@example.com', 'Galal Tawfik', '201011112257', 'Father', 'Cairo', 'Obour', 'Golf City', 'Egypt', 'Alexandria', 'Agami', 'Hanoville', 'Egypt', 'Cleared', 'None'),
(1181, 'Magdy', 'Kamel', 'Rashid', 'مجدي كامل رشيد', 'Male', 'Egyptian', '1990-02-02', 'Cairo', 'Single', 'Muslim', 'Probation', '0223456946', '0222223339', 'm.rashid@ciu.edu.eg', 'magdy@example.com', 'Kamel Rashid', '201011112258', 'Father', 'Cairo', 'Shoubra', 'Shoubra St', 'Egypt', 'Cairo', 'Shoubra', 'Shoubra St', 'Egypt', 'Pending', 'None'),
(1182, 'Mahmoud', 'Hemida', 'Hassan', 'محمود حميدة حسن', 'Male', 'Egyptian', '1965-01-01', 'Giza', 'Married', 'Muslim', 'Leave', '0223456947', '0222223340', 'm.hassan@ciu.edu.eg', 'mahmoud@example.com', 'Hemida Hassan', '201011112259', 'Father', 'Cairo', 'Manial', 'Roda St', 'Egypt', 'Cairo', 'Manial', 'Roda St', 'Egypt', 'Cleared', 'None'),
(1183, 'Hassan', 'Hosny', 'Mourad', 'حسن حسني مراد', 'Male', 'Egyptian', '1992-12-12', 'Cairo', 'Single', 'Muslim', 'Active', '0223456948', '0222223341', 'h.mourad@ciu.edu.eg', 'hassan@example.com', 'Hosny Mourad', '201011112260', 'Father', 'Cairo', 'Helwan', 'Metro St', 'Egypt', 'Cairo', 'Helwan', 'Metro St', 'Egypt', 'Cleared', 'None'),
(1184, 'Lotfy', 'Labib', 'Nashed', 'لطفي لبيب ناشد', 'Male', 'Egyptian', '1989-07-07', 'Beni Suef', 'Married', 'Christian', 'Active', '0223456949', '0222223342', 'l.nashed@ciu.edu.eg', 'lotfy@example.com', 'Labib Nashed', '201011112261', 'Father', 'Cairo', 'Faisal', '20 St', 'Egypt', 'Beni Suef', 'Center', 'Station Rd', 'Egypt', 'Cleared', 'None');


INSERT INTO CONTRACT (Contract_ID, Contract_Name, Type, Description, Default_Duration, Work_Modality, Eligibility_Criteria) VALUES
-- Set 1: Basic Contract Types (Referenced in auto-generated assignments)
(1, 'Full-Time Permanent', 'Permanent', 'Standard indefinite contract', 60, 'Full Time', 'All Staff'),
(2, 'Probationary', 'Probationary', 'Initial 3-month probation', 3, 'Full Time', 'New Hires'),
(3, 'Remote Consultant', 'Temporary', 'Project based consulting', 12, 'Remote', 'Specialists');

INSERT INTO JOB_ASSIGNMENT (Assignment_ID, Employee_ID, Job_ID, Contract_ID, Start_Date, End_Date, Status, Assigned_Salary) VALUES

-- =======================================================
-- GROUP 1: Original Depts (CS, Anatomy, Design)
-- Employees 1007-1034 -> Assignment IDs 12007-12034
-- =======================================================
(12007, 1007, 9002, 1, '2019-01-10', '2029-01-01', 'Active', 14500.00),
(12008, 1008, 9002, 1, '2020-03-15', '2030-01-01', 'Active', 13000.00),
(12009, 1009, 9002, 1, '2021-09-01', '2028-01-01', 'Active', 12500.00),
(12010, 1010, 9002, 2, '2024-02-01', '2025-02-01', 'Active', 10000.00),
(12011, 1011, 9002, 1, '2015-05-20', '2026-05-20', 'Inactive', 15000.00),
(12012, 1012, 9002, 1, '2018-11-11', '2028-01-01', 'Active', 14000.00),
(12013, 1013, 9002, 1, '2022-08-01', '2030-01-01', 'Active', 11000.00),
(12014, 1014, 9002, 1, '2019-04-01', '2029-01-01', 'Active', 13500.00),
(12015, 1015, 9005, 1, '2016-01-01', '2027-01-01', 'Active', 15500.00),
(12016, 1016, 9005, 1, '2020-05-01', '2030-01-01', 'Active', 12000.00),
(12017, 1017, 9005, 1, '2018-09-01', '2028-01-01', 'Active', 14000.00),
(12018, 1018, 9005, 1, '2015-02-01', '2026-01-01', 'Active', 16000.00),
(12019, 1019, 9005, 1, '2021-03-01', '2029-01-01', 'Active', 11500.00),
(12020, 1020, 9005, 2, '2024-01-01', '2025-01-01', 'Active', 9500.00),
(12021, 1021, 9005, 1, '2017-07-01', '2027-01-01', 'Active', 15000.00),
(12022, 1022, 9005, 1, '2019-12-01', '2025-12-01', 'Inactive', 13000.00),
(12023, 1023, 9005, 1, '2022-06-01', '2030-01-01', 'Active', 10500.00),
(12024, 1024, 9005, 1, '2023-08-01', '2030-01-01', 'Active', 10000.00),
(12025, 1025, 9006, 1, '2015-03-15', '2027-01-01', 'Active', 29000.00),
(12026, 1026, 9006, 1, '2018-01-10', '2028-01-01', 'Active', 26000.00),
(12027, 1027, 9006, 1, '2020-11-01', '2030-01-01', 'Active', 22000.00),
(12028, 1028, 9006, 1, '2012-06-01', '2025-01-01', 'Inactive', 30000.00),
(12029, 1029, 9006, 1, '2019-09-01', '2029-01-01', 'Active', 25000.00),
(12030, 1030, 9006, 1, '2021-04-01', '2028-01-01', 'Active', 21000.00),
(12031, 1031, 9006, 1, '2016-10-01', '2026-01-01', 'Active', 28000.00),
(12032, 1032, 9006, 2, '2024-05-01', '2025-05-01', 'Active', 19000.00),
(12033, 1033, 9006, 1, '2022-02-01', '2030-01-01', 'Active', 20000.00),
(12034, 1034, 9006, 1, '2023-01-01', '2029-01-01', 'Active', 19500.00),

-- =======================================================
-- GROUP 2: New Academic Depts
-- Employees 1035-1144 -> Assignment IDs 12035-12144
-- =======================================================
-- Public Law (Job 9007)
(12035, 1035, 9007, 1, '2014-09-01', '2029-01-01', 'Active', 38000.00),
(12036, 1036, 9007, 1, '2016-02-01', '2028-01-01', 'Active', 35000.00),
(12037, 1037, 9007, 1, '2018-11-01', '2029-01-01', 'Active', 32000.00),
(12038, 1038, 9007, 1, '2015-05-01', '2027-01-01', 'Active', 36000.00),
(12039, 1039, 9007, 2, '2024-01-01', '2025-01-01', 'Active', 26000.00),
(12040, 1040, 9007, 1, '2019-08-01', '2030-01-01', 'Active', 30000.00),
(12041, 1041, 9007, 1, '2021-03-01', '2028-01-01', 'Active', 28000.00),
(12042, 1042, 9007, 1, '2022-10-01', '2029-01-01', 'Active', 27000.00),
(12043, 1043, 9007, 1, '2017-06-01', '2027-01-01', 'Active', 33000.00),
(12044, 1044, 9007, 1, '2020-12-01', '2030-01-01', 'Active', 29000.00),

-- Finance (Job 9008)
(12045, 1045, 9008, 1, '2018-01-01', '2028-01-01', 'Active', 25000.00),
(12046, 1046, 9008, 1, '2019-05-01', '2029-01-01', 'Active', 23000.00),
(12047, 1047, 9008, 1, '2020-09-01', '2030-01-01', 'Active', 21000.00),
(12048, 1048, 9008, 2, '2024-03-01', '2025-03-01', 'Active', 16000.00),
(12049, 1049, 9008, 1, '2015-11-01', '2027-01-01', 'Active', 27000.00),
(12050, 1050, 9008, 1, '2021-02-01', '2028-01-01', 'Active', 19000.00),
(12051, 1051, 9008, 1, '2022-07-01', '2029-01-01', 'Active', 17000.00),
(12052, 1052, 9008, 1, '2016-04-01', '2026-04-01', 'Inactive', 26000.00),
(12053, 1053, 9008, 1, '2017-10-01', '2027-01-01', 'Active', 24000.00),
(12054, 1054, 9008, 1, '2023-01-01', '2030-01-01', 'Active', 18000.00),

-- Oral Surgery (Job 9009)
(12055, 1055, 9009, 1, '2010-05-01', '2026-01-01', 'Active', 60000.00),
(12056, 1056, 9009, 2, '2024-02-01', '2025-02-01', 'Active', 46000.00),
(12057, 1057, 9009, 1, '2012-09-01', '2027-01-01', 'Active', 58000.00),
(12058, 1058, 9009, 1, '2015-03-01', '2028-01-01', 'Active', 55000.00),
(12059, 1059, 9009, 1, '2018-08-01', '2029-01-01', 'Active', 52000.00),
(12060, 1060, 9009, 1, '2016-01-01', '2026-01-01', 'Inactive', 54000.00),
(12061, 1061, 9009, 1, '2019-11-01', '2030-01-01', 'Active', 50000.00),
(12062, 1062, 9009, 1, '2021-06-01', '2028-01-01', 'Active', 49000.00),
(12063, 1063, 9009, 1, '2014-04-01', '2027-01-01', 'Active', 56000.00),
(12064, 1064, 9009, 2, '2023-12-01', '2024-12-01', 'Active', 47000.00),

-- Clinical Pharmacy (Job 9010)
(12065, 1065, 9010, 1, '2019-01-01', '2029-01-01', 'Active', 16000.00),
(12066, 1066, 9010, 1, '2020-04-01', '2030-01-01', 'Active', 15000.00),
(12067, 1067, 9010, 1, '2021-08-01', '2028-01-01', 'Active', 14000.00),
(12068, 1068, 9010, 1, '2018-05-01', '2026-05-01', 'Inactive', 15500.00),
(12069, 1069, 9010, 1, '2022-02-01', '2030-01-01', 'Active', 13500.00),
(12070, 1070, 9010, 1, '2023-09-01', '2029-01-01', 'Active', 12500.00),
(12071, 1071, 9010, 1, '2017-11-01', '2027-01-01', 'Active', 17000.00),
(12072, 1072, 9010, 2, '2024-03-01', '2025-03-01', 'Active', 12000.00),
(12073, 1073, 9010, 1, '2016-07-01', '2026-01-01', 'Active', 17500.00),
(12074, 1074, 9010, 1, '2019-12-01', '2029-01-01', 'Active', 15800.00),

-- Horticulture (Job 9011)
(12075, 1075, 9011, 1, '2018-03-01', '2028-01-01', 'Active', 22000.00),
(12076, 1076, 9011, 1, '2017-06-01', '2026-06-01', 'Inactive', 23000.00),
(12077, 1077, 9011, 1, '2019-09-01', '2029-01-01', 'Active', 20000.00),
(12078, 1078, 9011, 1, '2020-12-01', '2030-01-01', 'Active', 19000.00),
(12079, 1079, 9011, 1, '2015-02-01', '2026-01-01', 'Active', 23500.00),
(12080, 1080, 9011, 2, '2024-04-01', '2025-04-01', 'Active', 15000.00),
(12081, 1081, 9011, 1, '2021-05-01', '2028-01-01', 'Active', 18000.00),
(12082, 1082, 9011, 1, '2022-08-01', '2029-01-01', 'Active', 17000.00),
(12083, 1083, 9011, 1, '2016-11-01', '2027-01-01', 'Active', 22500.00),
(12084, 1084, 9011, 1, '2023-01-01', '2026-01-01', 'Inactive', 16000.00),

-- Hotel Management (Job 9012)
(12085, 1085, 9012, 1, '2019-04-01', '2029-01-01', 'Active', 14000.00),
(12086, 1086, 9012, 1, '2020-07-01', '2030-01-01', 'Active', 13000.00),
(12087, 1087, 9012, 1, '2018-10-01', '2028-01-01', 'Active', 14500.00),
(12088, 1088, 9012, 2, '2024-01-01', '2025-01-01', 'Active', 10500.00),
(12089, 1089, 9012, 1, '2021-03-01', '2029-01-01', 'Active', 12500.00),
(12090, 1090, 9012, 1, '2022-06-01', '2030-01-01', 'Active', 12000.00),
(12091, 1091, 9012, 1, '2017-09-01', '2027-01-01', 'Active', 15000.00),
(12092, 1092, 9012, 1, '2016-02-01', '2026-02-01', 'Inactive', 15500.00),
(12093, 1093, 9012, 1, '2023-11-01', '2030-01-01', 'Active', 11000.00),
(12094, 1094, 9012, 1, '2015-12-01', '2026-01-01', 'Active', 15800.00),

-- Curriculum Studies (Job 9013)
(12095, 1095, 9013, 1, '2018-01-01', '2028-01-01', 'Active', 28000.00),
(12096, 1096, 9013, 2, '2024-05-01', '2025-05-01', 'Active', 19000.00),
(12097, 1097, 9013, 1, '2015-06-01', '2026-01-01', 'Active', 29500.00),
(12098, 1098, 9013, 1, '2019-10-01', '2029-01-01', 'Active', 25000.00),
(12099, 1099, 9013, 1, '2021-04-01', '2030-01-01', 'Active', 23000.00),
(12100, 1100, 9013, 1, '2016-08-01', '2026-08-01', 'Inactive', 28500.00),
(12101, 1101, 9013, 1, '2017-12-01', '2027-01-01', 'Active', 27000.00),
(12102, 1102, 9013, 1, '2022-09-01', '2030-01-01', 'Active', 21000.00),
(12103, 1103, 9013, 1, '2020-02-01', '2029-01-01', 'Active', 24500.00),
(12104, 1104, 9013, 2, '2023-11-01', '2024-11-01', 'Active', 20000.00),

-- English Language (Job 9014)
(12105, 1105, 9014, 1, '2010-03-01', '2026-01-01', 'Active', 40000.00),
(12106, 1106, 9014, 1, '2015-07-01', '2027-01-01', 'Active', 38000.00),
(12107, 1107, 9014, 1, '2018-11-01', '2028-01-01', 'Active', 35000.00),
(12108, 1108, 9014, 1, '2012-01-01', '2026-01-01', 'Inactive', 39000.00),
(12109, 1109, 9014, 1, '2020-05-01', '2030-01-01', 'Active', 33000.00),
(12110, 1110, 9014, 1, '2021-09-01', '2030-01-01', 'Active', 32000.00),
(12111, 1111, 9014, 1, '2014-04-01', '2026-01-01', 'Active', 39000.00),
(12112, 1112, 9014, 2, '2024-02-01', '2025-02-01', 'Active', 29000.00),
(12113, 1113, 9014, 1, '2016-12-01', '2027-01-01', 'Active', 37000.00),
(12114, 1114, 9014, 1, '2019-06-01', '2029-01-01', 'Active', 34500.00),

-- Physics (Job 9015)
(12115, 1115, 9015, 1, '2019-02-01', '2029-01-01', 'Active', 28000.00),
(12116, 1116, 9015, 1, '2017-08-01', '2026-08-01', 'Inactive', 30000.00),
(12117, 1117, 9015, 1, '2020-11-01', '2030-01-01', 'Active', 26000.00),
(12118, 1118, 9015, 1, '2021-04-01', '2030-01-01', 'Active', 25000.00),
(12119, 1119, 9015, 1, '2015-09-01', '2026-01-01', 'Active', 31000.00),
(12120, 1120, 9015, 2, '2024-01-01', '2025-01-01', 'Active', 21000.00),
(12121, 1121, 9015, 1, '2016-03-01', '2027-01-01', 'Active', 29500.00),
(12122, 1122, 9015, 1, '2022-07-01', '2029-01-01', 'Active', 23000.00),
(12123, 1123, 9015, 1, '2018-12-01', '2028-01-01', 'Active', 27500.00),
(12124, 1124, 9015, 1, '2023-10-01', '2026-10-01', 'Inactive', 22000.00),

-- Urban Planning (Job 9016)
(12125, 1125, 9016, 1, '2014-06-01', '2027-01-01', 'Active', 45000.00),
(12126, 1126, 9016, 1, '2019-10-01', '2029-01-01', 'Active', 38000.00),
(12127, 1127, 9016, 1, '2016-02-01', '2028-01-01', 'Active', 42000.00),
(12128, 1128, 9016, 2, '2024-04-01', '2025-04-01', 'Active', 32000.00),
(12129, 1129, 9016, 1, '2012-08-01', '2026-01-01', 'Active', 46000.00),
(12130, 1130, 9016, 1, '2021-01-01', '2030-01-01', 'Active', 36000.00),
(12131, 1131, 9016, 1, '2022-05-01', '2029-01-01', 'Active', 34000.00),
(12132, 1132, 9016, 1, '2017-11-01', '2026-11-01', 'Inactive', 40000.00),
(12133, 1133, 9016, 1, '2015-03-01', '2027-01-01', 'Active', 44000.00),
(12134, 1134, 9016, 1, '2020-09-01', '2030-01-01', 'Active', 37000.00),

-- Pediatric Nursing (Job 9017)
(12135, 1135, 9017, 1, '2019-07-01', '2029-01-01', 'Active', 13000.00),
(12136, 1136, 9017, 2, '2024-03-01', '2025-03-01', 'Active', 9500.00),
(12137, 1137, 9017, 1, '2016-12-01', '2027-01-01', 'Active', 14000.00),
(12138, 1138, 9017, 1, '2021-05-01', '2030-01-01', 'Active', 11500.00),
(12139, 1139, 9017, 1, '2022-10-01', '2029-01-01', 'Active', 10500.00),
(12140, 1140, 9017, 1, '2018-02-01', '2026-02-01', 'Inactive', 13500.00),
(12141, 1141, 9017, 1, '2017-09-01', '2028-01-01', 'Active', 13800.00),
(12142, 1142, 9017, 1, '2020-11-01', '2030-01-01', 'Active', 12000.00),
(12143, 1143, 9017, 1, '2015-04-01', '2026-01-01', 'Active', 14500.00),
(12144, 1144, 9017, 2, '2023-08-01', '2024-08-01', 'Active', 10000.00),

-- =======================================================
-- GROUP 3: New Administrative Depts
-- Employees 1145-1184 -> Assignment IDs 12145-12184
-- =======================================================
-- IT Services (Job 9018)
(12145, 1145, 9018, 1, '2018-01-01', '2028-01-01', 'Active', 18000.00),
(12146, 1146, 9018, 1, '2019-05-01', '2029-01-01', 'Active', 17000.00),
(12147, 1147, 9018, 1, '2020-03-01', '2030-01-01', 'Active', 16000.00),
(12148, 1148, 9018, 2, '2024-02-01', '2025-02-01', 'Active', 12000.00),
(12149, 1149, 9018, 1, '2021-08-01', '2029-01-01', 'Active', 15000.00),
(12150, 1150, 9018, 1, '2017-11-01', '2027-01-01', 'Active', 19000.00),
(12151, 1151, 9018, 1, '2022-06-01', '2030-01-01', 'Active', 14000.00),
(12152, 1152, 9018, 1, '2016-09-01', '2026-09-01', 'Inactive', 17500.00),
(12153, 1153, 9018, 1, '2023-01-01', '2030-01-01', 'Active', 13000.00),
(12154, 1154, 9018, 1, '2015-04-01', '2026-01-01', 'Active', 19500.00),

-- Student Affairs (Job 9019)
(12155, 1155, 9019, 1, '2019-02-01', '2029-01-01', 'Active', 12000.00),
(12156, 1156, 9019, 1, '2020-07-01', '2030-01-01', 'Active', 11000.00),
(12157, 1157, 9019, 1, '2018-04-01', '2028-01-01', 'Active', 13000.00),
(12158, 1158, 9019, 2, '2024-03-01', '2025-03-01', 'Active', 9000.00),
(12159, 1159, 9019, 1, '2021-09-01', '2029-01-01', 'Active', 10000.00),
(12160, 1160, 9019, 1, '2022-11-01', '2030-01-01', 'Active', 9500.00),
(12161, 1161, 9019, 1, '2017-06-01', '2027-01-01', 'Active', 14000.00),
(12162, 1162, 9019, 1, '2016-12-01', '2026-12-01', 'Inactive', 12500.00),
(12163, 1163, 9019, 1, '2023-05-01', '2030-01-01', 'Active', 9200.00),
(12164, 1164, 9019, 1, '2015-10-01', '2026-01-01', 'Active', 14500.00),

-- Admissions Office (Job 9020)
(12165, 1165, 9020, 1, '2018-03-01', '2028-01-01', 'Active', 16000.00),
(12166, 1166, 9020, 1, '2019-08-01', '2029-01-01', 'Active', 15000.00),
(12167, 1167, 9020, 1, '2020-01-01', '2030-01-01', 'Active', 14000.00),
(12168, 1168, 9020, 2, '2024-04-01', '2025-04-01', 'Active', 11000.00),
(12169, 1169, 9020, 1, '2021-05-01', '2029-01-01', 'Active', 13000.00),
(12170, 1170, 9020, 1, '2017-09-01', '2027-01-01', 'Active', 17000.00),
(12171, 1171, 9020, 1, '2022-02-01', '2030-01-01', 'Active', 12000.00),
(12172, 1172, 9020, 1, '2016-06-01', '2026-06-01', 'Inactive', 15500.00),
(12173, 1173, 9020, 1, '2023-07-01', '2030-01-01', 'Active', 11500.00),
(12174, 1174, 9020, 1, '2015-11-01', '2026-01-01', 'Active', 17500.00),

-- Campus Security (Job 9021)
(12175, 1175, 9021, 1, '2010-01-01', '2026-01-01', 'Active', 9500.00),
(12176, 1176, 9021, 1, '2015-05-01', '2027-01-01', 'Active', 8500.00),
(12177, 1177, 9021, 1, '2012-08-01', '2026-01-01', 'Active', 9000.00),
(12178, 1178, 9021, 1, '2018-03-01', '2028-01-01', 'Active', 7500.00),
(12179, 1179, 9021, 1, '2020-11-01', '2030-01-01', 'Active', 7000.00),
(12180, 1180, 9021, 1, '2016-04-01', '2026-01-01', 'Active', 8000.00),
(12181, 1181, 9021, 2, '2024-01-01', '2025-01-01', 'Active', 6000.00),
(12182, 1182, 9021, 1, '2005-02-01', '2026-02-01', 'Inactive', 10000.00),
(12183, 1183, 9021, 1, '2022-09-01', '2030-01-01', 'Active', 6500.00),
(12184, 1184, 9021, 1, '2019-06-01', '2029-01-01', 'Active', 7200.00);

INSERT INTO EMPLOYEE_KPI_SCORE (Assignment_ID, KPI_ID, Performance_Cycle_ID, Actual_Value, Employee_Score, Weighted_Score, Reviewer_ID, Comments, Review_Date) VALUES
-- Job 9007 (Law) - Target: 2 Journals, 4 Syllabus Updates
(12035, 11007, 13001, 2.00, 95.00, 95.00, 1001, 'Met publication target', '2025-01-15'),
(12035, 11008, 13001, 4.00, 90.00, 90.00, 1001, 'Curriculum updated', '2025-01-15'),
(12036, 11007, 13001, 3.00, 100.00, 100.00, 1001, 'Exceeded target', '2025-01-15'),
(12036, 11008, 13001, 3.00, 85.00, 85.00, 1001, 'Missing one module', '2025-01-15'),
-- ... (Repeating logic for remaining employees in Law Dept) ...
(12040, 11007, 13001, 2.00, 92.00, 92.00, 1001, 'Good work', '2025-01-15'),
(12040, 11008, 13001, 4.00, 94.00, 94.00, 1001, 'On time', '2025-01-15'),

-- Job 9008 (Finance) - Target: 12 Hours, 4.2 Rating
(12045, 11009, 13001, 12.00, 95.00, 95.00, 1001, 'Met hours', '2025-01-15'),
(12045, 11010, 13001, 4.50, 98.00, 98.00, 1001, 'Great feedback', '2025-01-15'),
(12046, 11009, 13001, 11.00, 88.00, 88.00, 1001, 'Slightly under', '2025-01-15'),
(12046, 11010, 13001, 4.10, 90.00, 90.00, 1001, 'Good feedback', '2025-01-15'),
(12050, 11009, 13001, 13.00, 100.00, 100.00, 1001, 'Extra hours', '2025-01-15'),
(12050, 11010, 13001, 4.30, 92.00, 92.00, 1001, 'Solid performance', '2025-01-15'),

-- Job 9009 (Oral Surgery) - Target: 150 Patients, 99.5% Success
(12055, 11011, 13001, 160.00, 100.00, 100.00, 1001, 'High volume', '2025-01-15'),
(12055, 11012, 13001, 99.90, 100.00, 100.00, 1001, 'Perfect record', '2025-01-15'),
(12056, 11011, 13001, 145.00, 90.00, 90.00, 1001, 'Near target', '2025-01-15'),
(12056, 11012, 13001, 99.00, 85.00, 85.00, 1001, 'Acceptable', '2025-01-15'),
(12060, 11011, 13001, 155.00, 98.00, 98.00, 1001, 'Good volume', '2025-01-15'),
(12060, 11012, 13001, 99.60, 95.00, 95.00, 1001, 'Safe practice', '2025-01-15'),

-- Job 9010 (Pharmacy) - Target: 20 Labs, 100% Audit
(12065, 11013, 13001, 20.00, 95.00, 95.00, 1001, 'Met target', '2025-01-15'),
(12065, 11014, 13001, 100.00, 100.00, 100.00, 1001, 'Audit passed', '2025-01-15'),
(12066, 11013, 13001, 19.00, 90.00, 90.00, 1001, 'Missed one lab', '2025-01-15'),
(12066, 11014, 13001, 98.00, 90.00, 90.00, 1001, 'Minor finding', '2025-01-15'),
(12070, 11013, 13001, 21.00, 98.00, 98.00, 1001, 'Extra effort', '2025-01-15'),
(12070, 11014, 13001, 100.00, 100.00, 100.00, 1001, 'Clean audit', '2025-01-15'),

-- Job 9011 (Horticulture) - Target: 10% Yield, 30 Trainees
(12075, 11015, 13001, 11.50, 100.00, 100.00, 1001, 'Great yield', '2025-01-15'),
(12075, 11016, 13001, 32.00, 100.00, 100.00, 1001, 'Good turnout', '2025-01-15'),
(12076, 11015, 13001, 9.50, 90.00, 90.00, 1001, 'Near target', '2025-01-15'),
(12076, 11016, 13001, 28.00, 88.00, 88.00, 1001, 'Low attendance', '2025-01-15'),
(12080, 11015, 13001, 10.00, 95.00, 95.00, 1001, 'On target', '2025-01-15'),
(12080, 11016, 13001, 35.00, 100.00, 100.00, 1001, 'High attendance', '2025-01-15');

INSERT INTO EMPLOYEE_KPI_SCORE (Assignment_ID, KPI_ID, Performance_Cycle_ID, Actual_Value, Employee_Score, Weighted_Score, Reviewer_ID, Comments, Review_Date) VALUES
-- Job 9012 (Hotel Mgmt) - Target: 15 Sims, 9.0 Sat
(12085, 11017, 13001, 15.00, 95.00, 95.00, 1001, 'Met target', '2025-01-15'),
(12085, 11018, 13001, 9.20, 98.00, 98.00, 1001, 'Happy guests', '2025-01-15'),
(12086, 11017, 13001, 14.00, 90.00, 90.00, 1001, 'Missed one sim', '2025-01-15'),
(12086, 11018, 13001, 8.80, 88.00, 88.00, 1001, 'Below target', '2025-01-15'),
(12090, 11017, 13001, 16.00, 100.00, 100.00, 1001, 'Extra sim', '2025-01-15'),
(12090, 11018, 13001, 9.50, 100.00, 100.00, 1001, 'Excellent', '2025-01-15'),

-- Job 9013 (Curriculum) - Target: 8 Modules, 100% Compliance
(12095, 11019, 13001, 8.00, 95.00, 95.00, 1001, 'Done', '2025-01-15'),
(12095, 11020, 13001, 100.00, 100.00, 100.00, 1001, 'Compliant', '2025-01-15'),
(12096, 11019, 13001, 7.00, 85.00, 85.00, 1001, 'Delayed', '2025-01-15'),
(12096, 11020, 13001, 95.00, 90.00, 90.00, 1001, 'Minor issue', '2025-01-15'),
(12100, 11019, 13001, 9.00, 98.00, 98.00, 1001, 'Ahead of schedule', '2025-01-15'),
(12100, 11020, 13001, 100.00, 100.00, 100.00, 1001, 'Compliant', '2025-01-15'),

-- Job 9014 (English) - Target: 5 Citations, Rank 5
(12105, 11021, 13001, 6.00, 100.00, 100.00, 1001, 'Highly cited', '2025-01-15'),
(12105, 11022, 13001, 4.00, 100.00, 100.00, 1001, 'Top 4', '2025-01-15'),
(12106, 11021, 13001, 4.00, 85.00, 85.00, 1001, 'Good citations', '2025-01-15'),
(12106, 11022, 13001, 6.00, 80.00, 80.00, 1001, 'Rank dropped', '2025-01-15'),
(12110, 11021, 13001, 5.00, 95.00, 95.00, 1001, 'Met target', '2025-01-15'),
(12110, 11022, 13001, 5.00, 95.00, 95.00, 1001, 'Stable rank', '2025-01-15'),

-- Job 9015 (Physics) - Target: 50k USD, 0 Safety Incidents
(12115, 11023, 13001, 55000.00, 100.00, 100.00, 1001, 'Great grant', '2025-01-15'),
(12115, 11024, 13001, 0.00, 100.00, 100.00, 1001, 'Safe lab', '2025-01-15'),
(12116, 11023, 13001, 40000.00, 80.00, 80.00, 1001, 'Under target', '2025-01-15'),
(12116, 11024, 13001, 1.00, 50.00, 50.00, 1001, 'Minor incident', '2025-01-15'),
(12120, 11023, 13001, 50000.00, 95.00, 95.00, 1001, 'Met target', '2025-01-15'),
(12120, 11024, 13001, 0.00, 100.00, 100.00, 1001, 'Safe lab', '2025-01-15'),

-- Job 9016 (Urban Planning) - Target: 2 Projects, 3 PhDs
(12125, 11025, 13001, 2.00, 95.00, 95.00, 1001, 'Completed', '2025-01-15'),
(12125, 11026, 13001, 3.00, 95.00, 95.00, 1001, 'Met target', '2025-01-15'),
(12126, 11025, 13001, 1.00, 70.00, 70.00, 1001, 'One pending', '2025-01-15'),
(12126, 11026, 13001, 2.00, 80.00, 80.00, 1001, 'Delayed thesis', '2025-01-15'),
(12130, 11025, 13001, 3.00, 100.00, 100.00, 1001, 'Extra project', '2025-01-15'),
(12130, 11026, 13001, 4.00, 100.00, 100.00, 1001, 'Great mentorship', '2025-01-15'),

-- Job 9017 (Nursing) - Target: 40 Rounds, 90% Pass Rate
(12135, 11027, 13001, 42.00, 100.00, 100.00, 1001, 'High activity', '2025-01-15'),
(12135, 11028, 13001, 95.00, 100.00, 100.00, 1001, 'Great results', '2025-01-15'),
(12136, 11027, 13001, 38.00, 90.00, 90.00, 1001, 'Near target', '2025-01-15'),
(12136, 11028, 13001, 88.00, 90.00, 90.00, 1001, 'Good pass rate', '2025-01-15'),
(12140, 11027, 13001, 40.00, 95.00, 95.00, 1001, 'Met target', '2025-01-15'),
(12140, 11028, 13001, 92.00, 95.00, 95.00, 1001, 'Solid results', '2025-01-15');


INSERT INTO Employee_Training (ET_ID, Employee_ID, Program_ID, Completion_Status) VALUES
-- 1. IT Services Dept (Employees 1145-1154): Enrolled in Python & CyberSec
(6006, 1145, 5006, 'Completed'), (6007, 1146, 5006, 'Still in progress'),
(6008, 1147, 5007, 'Completed'), (6009, 1148, 5007, 'Completed'),
(6010, 1149, 5006, 'Completed'), (6011, 1150, 5011, 'Still in progress'), -- Power BI
(6012, 1151, 5007, 'Completed'), (6013, 1152, 5006, 'Droped'),
(6014, 1153, 5007, 'Completed'), (6015, 1154, 5011, 'Completed'),

-- 2. Finance Dept (Employees 1045-1054): Enrolled in Excel & Compliance
(6016, 1045, 5015, 'Completed'), (6017, 1046, 5015, 'Completed'),
(6018, 1047, 5013, 'Completed'), (6019, 1048, 5015, 'Still in progress'),
(6020, 1049, 5013, 'Completed'), (6021, 1050, 5015, 'Completed'),
(6022, 1051, 5013, 'Still in progress'), (6023, 1052, 5015, 'Completed'),
(6024, 1053, 5015, 'Completed'), (6025, 1054, 5013, 'Completed'),

-- 3. Public Law Dept (Employees 1035-1044): Enrolled in Conflict Res & Leadership
(6026, 1035, 5008, 'Completed'), (6027, 1036, 5014, 'Still in progress'),
(6028, 1037, 5008, 'Completed'), (6029, 1038, 5008, 'Completed'),
(6030, 1039, 5014, 'Completed'), (6031, 1040, 5008, 'Droped'),
(6032, 1041, 5014, 'Still in progress'), (6033, 1042, 5008, 'Completed'),
(6034, 1043, 5014, 'Completed'), (6035, 1044, 5008, 'Completed'),

-- 4. Admissions Office (Employees 1165-1174): Enrolled in Communication & GDPR
(6036, 1165, 5012, 'Completed'), (6037, 1166, 5013, 'Completed'),
(6038, 1167, 5012, 'Still in progress'), (6039, 1168, 5013, 'Completed'),
(6040, 1169, 5012, 'Completed'), (6041, 1170, 5013, 'Completed'),
(6042, 1171, 5012, 'Completed'), (6043, 1172, 5013, 'Still in progress'),
(6044, 1173, 5012, 'Droped'), (6045, 1174, 5013, 'Completed'),

-- 5. Security Dept (Employees 1175-1184): Enrolled in Safety & Conflict Res
(6046, 1175, 5008, 'Completed'), (6047, 1176, 5002, 'Completed'), -- Workplace Safety
(6048, 1177, 5008, 'Completed'), (6049, 1178, 5002, 'Completed'),
(6050, 1179, 5008, 'Still in progress'), (6051, 1180, 5002, 'Completed'),
(6052, 1181, 5008, 'Completed'), (6053, 1182, 5002, 'Completed'),
(6054, 1183, 5008, 'Still in progress'), (6055, 1184, 5002, 'Completed'),

-- 6. Senior Academic Staff (Selected): Enrolled in Strategic Thinking
(6056, 1055, 5014, 'Completed'), -- Head of Oral Surgery
(6057, 1105, 5014, 'Completed'), -- Senior English Prof
(6058, 1125, 5014, 'Still in progress'), -- Urban Planning Lead
(6059, 1001, 5009, 'Completed'), -- Software Engineer (Project Mgmt)
(6060, 1006, 5009, 'Completed'), -- Senior Dev (Project Mgmt)
(6061, 1015, 5010, 'Completed'), -- Lab Tech (Diversity)
(6062, 1025, 5011, 'Completed'), -- Design Instructor (Power BI)
(6063, 1075, 5009, 'Still in progress'),
(6064, 1085, 5012, 'Completed'),
(6065, 1095, 5010, 'Completed');

INSERT INTO Training_Program (Program_ID, Program_Code, Title, Objectives, Type, Subtype, Delivery_Method, Approval_Status) VALUES
(5006, 'TP-TECH-03', 'Python for Data Analysis', 'Data manipulation basics', 'Internal', 'Technical', 'Virtual', 'Approved'),
(5007, 'TP-CMP-02', 'Cybersecurity Awareness', 'Phishing and password security', 'Internal', 'Compliance', 'Virtual', 'Approved'),
(5008, 'TP-SFT-02', 'Conflict Resolution', 'Managing workplace disputes', 'External', 'Soft Skill', 'In-person', 'Approved'),
(5009, 'TP-MGT-01', 'Project Management Fund.', 'PMBOK basics', 'External', 'Technical', 'Blended', 'Approved'),
(5010, 'TP-HR-02', 'Diversity & Inclusion', 'Fostering inclusive culture', 'Internal', 'Compliance', 'Virtual', 'Approved'),
(5011, 'TP-TECH-04', 'Power BI Dashboarding', 'Visualizing HR data', 'Internal', 'Technical', 'In-person', 'Approved'),
(5012, 'TP-SFT-03', 'Effective Communication', 'Email and verbal skills', 'External', 'Soft Skill', 'Virtual', 'Pending'),
(5013, 'TP-CMP-03', 'GDPR & Data Privacy', 'Handling personal data', 'Internal', 'Compliance', 'Virtual', 'Approved'),
(5014, 'TP-LD-02', 'Strategic Thinking', 'Long-term planning skills', 'External', 'Leadership', 'In-person', 'Approved'),
(5015, 'TP-ADM-01', 'Advanced Excel', 'Pivot tables and macros', 'Internal', 'Technical', 'Virtual', 'Approved');

INSERT INTO Training_Certificate (Certificate_ID, ET_ID, Issue_Date, Certificate_File_Path) VALUES
-- From IT Group
(7006, 6006, '2024-05-10', '/files/certs/CERT-6006.pdf'),
(7007, 6008, '2024-06-12', '/files/certs/CERT-6008.pdf'),
(7008, 6009, '2024-06-15', '/files/certs/CERT-6009.pdf'),
(7009, 6010, '2024-07-01', '/files/certs/CERT-6010.pdf'),
(7010, 6012, '2024-08-20', '/files/certs/CERT-6012.pdf'),
(7011, 6014, '2024-09-05', '/files/certs/CERT-6014.pdf'),
(7012, 6015, '2024-10-10', '/files/certs/CERT-6015.pdf'),

-- From Finance Group
(7013, 6016, '2024-03-15', '/files/certs/CERT-6016.pdf'),
(7014, 6017, '2024-03-18', '/files/certs/CERT-6017.pdf'),
(7015, 6018, '2024-04-20', '/files/certs/CERT-6018.pdf'),
(7016, 6020, '2024-05-22', '/files/certs/CERT-6020.pdf'),
(7017, 6021, '2024-06-10', '/files/certs/CERT-6021.pdf'),
(7018, 6023, '2024-07-15', '/files/certs/CERT-6023.pdf'),
(7019, 6024, '2024-08-01', '/files/certs/CERT-6024.pdf'),
(7020, 6025, '2024-09-12', '/files/certs/CERT-6025.pdf'),

-- From Law Group
(7021, 6026, '2024-02-10', '/files/certs/CERT-6026.pdf'),
(7022, 6028, '2024-03-05', '/files/certs/CERT-6028.pdf'),
(7023, 6029, '2024-04-12', '/files/certs/CERT-6029.pdf'),
(7024, 6030, '2024-05-20', '/files/certs/CERT-6030.pdf'),
(7025, 6033, '2024-06-15', '/files/certs/CERT-6033.pdf'),
(7026, 6034, '2024-07-20', '/files/certs/CERT-6034.pdf'),
(7027, 6035, '2024-08-10', '/files/certs/CERT-6035.pdf'),

-- From Admissions Group
(7028, 6036, '2024-01-20', '/files/certs/CERT-6036.pdf'),
(7029, 6037, '2024-02-15', '/files/certs/CERT-6037.pdf'),
(7030, 6039, '2024-03-20', '/files/certs/CERT-6039.pdf'),
(7031, 6040, '2024-04-25', '/files/certs/CERT-6040.pdf'),
(7032, 6041, '2024-05-30', '/files/certs/CERT-6041.pdf'),
(7033, 6042, '2024-06-10', '/files/certs/CERT-6042.pdf'),
(7034, 6045, '2024-07-15', '/files/certs/CERT-6045.pdf'),

-- From Security Group
(7035, 6046, '2024-01-10', '/files/certs/CERT-6046.pdf'),
(7036, 6047, '2024-01-15', '/files/certs/CERT-6047.pdf'),
(7037, 6048, '2024-02-10', '/files/certs/CERT-6048.pdf'),
(7038, 6049, '2024-02-15', '/files/certs/CERT-6049.pdf'),
(7039, 6051, '2024-03-20', '/files/certs/CERT-6051.pdf'),
(7040, 6052, '2024-04-10', '/files/certs/CERT-6052.pdf'),
(7041, 6053, '2024-05-15', '/files/certs/CERT-6053.pdf'),
(7042, 6055, '2024-06-20', '/files/certs/CERT-6055.pdf'),

-- From Misc Senior Group
(7043, 6056, '2024-11-01', '/files/certs/CERT-6056.pdf'),
(7044, 6057, '2024-11-15', '/files/certs/CERT-6057.pdf'),
(7045, 6059, '2024-12-01', '/files/certs/CERT-6059.pdf'),
(7046, 6060, '2024-12-10', '/files/certs/CERT-6060.pdf'),
(7047, 6061, '2024-12-15', '/files/certs/CERT-6061.pdf'),
(7048, 6062, '2024-12-20', '/files/certs/CERT-6062.pdf'),
(7049, 6064, '2024-12-22', '/files/certs/CERT-6064.pdf'),
(7050, 6065, '2024-12-28', '/files/certs/CERT-6065.pdf');


INSERT INTO APPRAISAL (Assignment_ID, Cycle_ID, Appraisal_Date, Overall_Score, Manager_Comments, HR_Comments, Employee_Comments, Reviewer_ID) VALUES
(12035, 13001, '2025-01-20', 92.50, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12036, 13001, '2025-01-20', 88.00, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12037, 13001, '2025-01-20', 76.80, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12038, 13001, '2025-01-20', 85.40, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12039, 13001, '2025-01-20', 91.20, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12040, 13001, '2025-01-20', 83.60, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12041, 13001, '2025-01-20', 79.90, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12042, 13001, '2025-01-20', 94.70, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12043, 13001, '2025-01-20', 87.10, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12044, 13001, '2025-01-20', 81.50, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12045, 13001, '2025-01-20', 96.20, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12046, 13001, '2025-01-20', 89.30, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12047, 13001, '2025-01-20', 77.80, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12048, 13001, '2025-01-20', 84.00, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12049, 13001, '2025-01-20', 90.50, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12050, 13001, '2025-01-20', 82.90, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12051, 13001, '2025-01-20', 78.20, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12052, 13001, '2025-01-20', 93.60, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12053, 13001, '2025-01-20', 86.40, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12054, 13001, '2025-01-20', 80.80, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12055, 13001, '2025-01-20', 98.00, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12056, 13001, '2025-01-20', 92.50, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12057, 13001, '2025-01-20', 85.00, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12058, 13001, '2025-01-20', 79.50, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12059, 13001, '2025-01-20', 88.70, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12060, 13001, '2025-01-20', 83.20, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12061, 13001, '2025-01-20', 91.80, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12062, 13001, '2025-01-20', 87.60, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12063, 13001, '2025-01-20', 80.20, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12064, 13001, '2025-01-20', 95.90, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12065, 13001, '2025-01-20', 76.00, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12066, 13001, '2025-01-20', 84.50, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12067, 13001, '2025-01-20', 89.80, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12068, 13001, '2025-01-20', 94.20, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12069, 13001, '2025-01-20', 81.10, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12070, 13001, '2025-01-20', 86.90, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12071, 13001, '2025-01-20', 77.50, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12072, 13001, '2025-01-20', 90.00, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12073, 13001, '2025-01-20', 82.30, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12074, 13001, '2025-01-20', 97.10, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12075, 13001, '2025-01-20', 88.90, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12076, 13001, '2025-01-20', 83.00, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12077, 13001, '2025-01-20', 78.70, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12078, 13001, '2025-01-20', 92.40, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12079, 13001, '2025-01-20', 85.60, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12080, 13001, '2025-01-20', 91.50, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12081, 13001, '2025-01-20', 79.30, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12082, 13001, '2025-01-20', 87.80, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12083, 13001, '2025-01-20', 95.20, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12084, 13001, '2025-01-20', 80.10, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12085, 13001, '2025-01-20', 84.90, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12086, 13001, '2025-01-20', 89.00, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12087, 13001, '2025-01-20', 93.50, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12088, 13001, '2025-01-20', 76.20, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12089, 13001, '2025-01-20', 82.80, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12090, 13001, '2025-01-20', 90.70, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12091, 13001, '2025-01-20', 86.50, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12092, 13001, '2025-01-20', 81.90, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12093, 13001, '2025-01-20', 96.80, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12094, 13001, '2025-01-20', 78.90, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12095, 13001, '2025-01-20', 87.40, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12096, 13001, '2025-01-20', 92.10, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12097, 13001, '2025-01-20', 83.70, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12098, 13001, '2025-01-20', 91.00, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12099, 13001, '2025-01-20', 75.80, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12100, 13001, '2025-01-20', 85.20, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006);

INSERT INTO APPRAISAL (Assignment_ID, Cycle_ID, Appraisal_Date, Overall_Score, Manager_Comments, HR_Comments, Employee_Comments, Reviewer_ID) VALUES
(12101, 13001, '2025-01-20', 94.50, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12102, 13001, '2025-01-20', 88.30, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12103, 13001, '2025-01-20', 80.60, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12104, 13001, '2025-01-20', 89.50, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12105, 13001, '2025-01-20', 93.00, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12106, 13001, '2025-01-20', 84.70, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12107, 13001, '2025-01-20', 77.00, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12108, 13001, '2025-01-20', 90.30, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12109, 13001, '2025-01-20', 82.50, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12110, 13001, '2025-01-20', 95.40, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12111, 13001, '2025-01-20', 86.20, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12112, 13001, '2025-01-20', 79.60, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12113, 13001, '2025-01-20', 92.80, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12114, 13001, '2025-01-20', 85.90, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12115, 13001, '2025-01-20', 81.20, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12116, 13001, '2025-01-20', 97.70, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12117, 13001, '2025-01-20', 89.10, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12118, 13001, '2025-01-20', 76.60, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12119, 13001, '2025-01-20', 91.90, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12120, 13001, '2025-01-20', 83.40, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12121, 13001, '2025-01-20', 87.50, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12122, 13001, '2025-01-20', 94.10, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12123, 13001, '2025-01-20', 80.40, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12124, 13001, '2025-01-20', 88.60, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12125, 13001, '2025-01-20', 75.90, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12126, 13001, '2025-01-20', 93.30, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12127, 13001, '2025-01-20', 86.00, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12128, 13001, '2025-01-20', 92.00, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12129, 13001, '2025-01-20', 81.70, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12130, 13001, '2025-01-20', 96.50, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12131, 13001, '2025-01-20', 78.50, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12132, 13001, '2025-01-20', 85.80, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12133, 13001, '2025-01-20', 90.20, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12134, 13001, '2025-01-20', 83.10, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12135, 13001, '2025-01-20', 97.40, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12136, 13001, '2025-01-20', 79.00, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12137, 13001, '2025-01-20', 87.90, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12138, 13001, '2025-01-20', 94.80, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12139, 13001, '2025-01-20', 82.20, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12140, 13001, '2025-01-20', 91.30, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12141, 13001, '2025-01-20', 77.40, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12142, 13001, '2025-01-20', 86.30, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12143, 13001, '2025-01-20', 93.80, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12144, 13001, '2025-01-20', 80.70, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12145, 13001, '2025-01-20', 95.60, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12146, 13001, '2025-01-20', 84.40, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12147, 13001, '2025-01-20', 89.40, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12148, 13001, '2025-01-20', 76.10, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12149, 13001, '2025-01-20', 90.90, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12150, 13001, '2025-01-20', 82.70, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12151, 13001, '2025-01-20', 96.30, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12152, 13001, '2025-01-20', 88.40, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12153, 13001, '2025-01-20', 79.70, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12154, 13001, '2025-01-20', 85.30, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12155, 13001, '2025-01-20', 92.70, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12156, 13001, '2025-01-20', 78.10, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12157, 13001, '2025-01-20', 91.60, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12158, 13001, '2025-01-20', 83.50, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12159, 13001, '2025-01-20', 98.10, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12160, 13001, '2025-01-20', 87.00, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12161, 13001, '2025-01-20', 80.90, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12162, 13001, '2025-01-20', 94.60, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12163, 13001, '2025-01-20', 81.40, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12164, 13001, '2025-01-20', 86.80, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12165, 13001, '2025-01-20', 95.10, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12166, 13001, '2025-01-20', 77.70, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12167, 13001, '2025-01-20', 90.60, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12168, 13001, '2025-01-20', 84.10, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12169, 13001, '2025-01-20', 92.90, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12170, 13001, '2025-01-20', 75.70, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12171, 13001, '2025-01-20', 89.20, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12172, 13001, '2025-01-20', 82.00, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12173, 13001, '2025-01-20', 96.70, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12174, 13001, '2025-01-20', 85.50, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12175, 13001, '2025-01-20', 93.90, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12176, 13001, '2025-01-20', 78.00, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12177, 13001, '2025-01-20', 88.80, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12178, 13001, '2025-01-20', 81.00, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12179, 13001, '2025-01-20', 97.30, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12180, 13001, '2025-01-20', 86.60, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12181, 13001, '2025-01-20', 80.30, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12182, 13001, '2025-01-20', 91.70, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12183, 13001, '2025-01-20', 83.30, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006),
(12184, 13001, '2025-01-20', 95.00, 'Solid performance this year.', 'Approved', 'Thank you for the feedback.', 1006);

UPDATE APPRAISAL
SET Cycle_ID = 13002
WHERE Assignment_ID BETWEEN 12035 AND 12070;

UPDATE APPRAISAL
SET Cycle_ID = 13003
WHERE Assignment_ID BETWEEN 12071 AND 12105;

UPDATE APPRAISAL
SET Cycle_ID = 13004
WHERE Assignment_ID BETWEEN 12106 AND 12140;

UPDATE APPRAISAL
SET Cycle_ID = 13005
WHERE Assignment_ID BETWEEN 12141 AND 12175;


INSERT INTO APPRAISAL 
(Assignment_ID, Cycle_ID, Appraisal_Date, Overall_Score, Manager_Comments, HR_Comments, Employee_Comments, Reviewer_ID) 
VALUES
(12180, 13006, '2025-11-15', 89.50, 'Good progress during H2.', 'Approved', 'Appreciate the feedback.', 1006),
(12181, 13006, '2025-11-15', 92.30, 'Strong performance in key areas.', 'Approved', 'Thank you.', 1006),
(12182, 13006, '2025-11-15', 84.70, 'Met expectations.', 'Approved', 'Noted.', 1006),
(12183, 13006, '2025-11-15', 96.10, 'Excellent results this cycle.', 'Approved', 'Glad to hear this.', 1006),
(12184, 13006, '2025-11-15', 78.90, 'Needs improvement in some areas.', 'Approved', 'Will work on it.', 1006);

UPDATE PERFORMANCE_CYCLE
SET End_Date = '2025-12-31',
    Submission_Deadline = '2026-01-10'
WHERE Cycle_ID IN (13002, 13004);


UPDATE JOB
SET Status = 'Active'
WHERE Job_ID IN (9001, 9002, 9003, 9004, 9005, 9006)
  AND Status = 'Open';
  
INSERT INTO APPEAL (Appraisal_ID, Reason, Approval_Status, Submission_Date) VALUES 
(15003, 'Score calculation error', 'Pending', '2025-12-01'),
(15005, 'Disagree with manager feedback', 'Pending', '2025-12-02'),
(15012, 'Achieved higher sales than recorded', 'Approved', '2025-12-03'),
(15001, 'Project completion date was incorrect', 'Rejected', '2025-12-04'),
(15018, 'Medical leave not accounted for', 'Pending', '2025-12-05'),
(15009, 'Requesting re-evaluation', 'Pending', '2025-12-06'),
(15015, 'Target values were changed mid-cycle', 'Approved', '2025-12-07'),
(15007, 'Unfair rating compared to peers', 'Rejected', '2025-12-08'),
(15019, 'Missing bonus metrics', 'Pending', '2025-12-09'),
(15002, 'System error during submission', 'Approved', '2025-12-10');







