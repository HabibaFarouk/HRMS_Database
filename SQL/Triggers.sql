USE hr_system;
DELIMITER $$
-- Validate Objective Weight
CREATE TRIGGER check_objective_weight
BEFORE INSERT ON JOB_OBJECTIVE
FOR EACH ROW
BEGIN
    DECLARE total_weight DECIMAL(5,2);
    SELECT SUM(Weight)
    INTO total_weight
    FROM JOB_OBJECTIVE
    WHERE Job_ID = NEW.Job_ID;

    IF (total_weight + NEW.Weight) > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Total objective weight cannot exceed 100%';
    END IF;
END$$

-- Prevent Deleting Objective if KPIs Exist
CREATE TRIGGER prevent_delete_objective_if_kpis
BEFORE DELETE ON JOB_OBJECTIVE
FOR EACH ROW
BEGIN
    DECLARE kpi_count INT;

    -- Count KPIs linked to this objective
    SELECT COUNT(*)
    INTO kpi_count
    FROM OBJECTIVE_KPI
    WHERE Objective_ID = OLD.Objective_ID;

    -- If KPIs exist → block delete
    IF kpi_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete objective because KPIs are linked to it';
    END IF;
END$$
DELIMITER ;

-- Prevent Deleting an Employee with Active Assignments
DELIMITER $$
CREATE TRIGGER trg_PreventDeleteEmployee
BEFORE DELETE ON EMPLOYEE
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT * FROM JOB_ASSIGNMENT WHERE Employee_ID = OLD.Employee_ID AND Status = 'Active') THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: Cannot delete Employee because they have active job assignments.';
    END IF;
END $$


-- Auto-Calculate Weighted Score

CREATE TRIGGER trg_AutoCalculateWeightedScore
BEFORE INSERT ON EMPLOYEE_KPI_SCORE
FOR EACH ROW
BEGIN
    DECLARE v_KPIWeight DECIMAL(5,2);
    DECLARE v_KPITarget DECIMAL(10,2);
    DECLARE v_CalcScore DECIMAL(5,2);
    

    SELECT Weight, Target_Value INTO v_KPIWeight, v_KPITarget 
    FROM OBJECTIVE_KPI 
    WHERE KPI_ID = NEW.KPI_ID;
    

    IF v_KPITarget > 0 THEN
        SET v_CalcScore = (NEW.Actual_Value / v_KPITarget) * 100;
    ELSE
        SET v_CalcScore = 0;
    END IF;
    

    SET NEW.Employee_Score = v_CalcScore;
    SET NEW.Weighted_Score = v_CalcScore * v_KPIWeight; -- e.g., 90% * 0.40 weight = 36 points
END $$
DELIMITER ;

-- Validate Training Certificate Issue
DELIMITER $$

CREATE TRIGGER trg_validate_certificate_et
BEFORE INSERT ON TRAINING_CERTIFICATE
FOR EACH ROW
BEGIN
    -- Check if ET_ID exists in EMPLOYEE_TRAINING
    IF (SELECT COUNT(*)
        FROM EMPLOYEE_TRAINING
        WHERE ET_ID = NEW.ET_ID) = 0 THEN
        
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid ET_ID: No related Employee Training record exists.';
    END IF;
END$$

DELIMITER ;





-- Prevent Deleting a Training Program Assigned to Employees
DELIMITER $$

CREATE TRIGGER trg_prevent_program_delete
BEFORE DELETE ON TRAINING_PROGRAM
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*)
        FROM EMPLOYEE_TRAINING
        WHERE Program_ID = OLD.Program_ID) > 0 THEN
        
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot delete: Training program is assigned to one or more employees.';
    END IF;
END$$

DELIMITER ;
