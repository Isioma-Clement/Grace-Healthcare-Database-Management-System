CREATE DATABASE grace_healthcare;

USE grace_healthcare;

-- create service areas table
 CREATE TABLE service_areas (
    postcode_district VARCHAR(4) PRIMARY KEY,
    catchment_area VARCHAR(8)
);

-- populate service area table
INSERT INTO service_areas
VALUES ("NG1", "City"),
("NG2", "City"),
("NG3", "City"),
("NG4", "County"),
("NG5", "City"),
("NG6", "City"),
("NG7", "City"),("NG8", "City"),
("NG9", "City"), ("NG10", "County"),
("NG11", "City"),("NG12", "County"),
("NG13", "County"),("NG14", "County"),
("NG15", "County"),("NG16", "County");

SELECT * FROM service_areas;

-- create service users table
 CREATE TABLE service_users (
    user_id VARCHAR(6) NOT NULL PRIMARY KEY,
    first_name VARCHAR(10) NOT NULL,
    surname VARCHAR(10) NOT NULL,
    gender CHAR,
    email_address VARCHAR(30),
    telephone INT,
    post_outcode VARCHAR(4) NOT NULL,
    post_incode VARCHAR(4) NOT NULL
);

-- change user_id column to INT
ALTER TABLE service_users 
MODIFY COLUMN user_id INT;

-- Set constraint to make email addresses unique 
ALTER TABLE service_users 
ADD CONSTRAINT UNIQUE (email_address); 

-- add FK Constraint on post_outcode
ALTER TABLE service_users
ADD CONSTRAINT FOREIGN KEY (post_outcode) 
REFERENCES service_areas(postcode_district);
 
-- insert data into service_user table
INSERT INTO service_users (user_id, first_name, surname, Gender, email_address, telephone, post_outcode, post_incode)
VALUES 
(001, "Kelly", "Flower","F", "kf@gmail.com", 00111, "NG7", "4AS"),
(002, "Bigg", "Mark", "M", "bm@gmail.com", 00222, "NG8", "3EK"),
(003, "Peen", "Orth", "M","po@gmail.com", 00333, "NG8", "4AD"),
(004, "Tess", "Corn","F", "tc@gmail.com", 00444, "NG10", "8AJ"),
(005, "Walt", "Caz", "M","wc@gmail.com", 00555, "NG9", "3QS"),
(006, "Naan", "Doors","F", "nd@gmail.com", 00666, "NG2", "7AZ"),
(007, "Haas", "Dan", "M", "hd@gmail.com", 00777, "NG1", "8WU"),
(008, "Jenny", "Steele","F", "jst@gmail.com", 00888, "NG10", "4HU"),
(009, "Laura", "Saint", "F", "lst@gmail.com", 00999, "NG16", "6UT"),
(010, "Purp", "Corn", "F","pc@gmail.com", 00100, "NG10", "2JE"),
(011, "Adam", "Yves", "M","ay@gmail.com", 00120, "NG8", "6AS"),
(012, "Max", "Spence", "M","ms@gmail.com", 00130, "NG16", "5TU"),
(013, "Zahra", "Spence", "F","zhs@gmail.com", 00130, "NG16", "5TU"),
(014, "Tabby", "Lou", "F", "tl@gmail.com", 00140, "NG1","3ET");

SELECT * FROM service_users;

-- create staff table
CREATE TABLE staff (
employee_id VARCHAR(8) NOT NULL PRIMARY KEY,
first_name VARCHAR (10) NOT NULL,
surname VARCHAR(10) NOT NULL,
email VARCHAR (20),
role VARCHAR(10),  
department VARCHAR(10),
grade VARCHAR(10)
);

-- add contract_type and service_area column to staff table
ALTER TABLE staff ADD COLUMN (contract_type CHAR(2),service_area VARCHAR(8));

-- populate staff table
INSERT INTO staff (employee_id, first_name, surname, email, role, contract_type, service_area)
VALUES 
("FP001", "Jenny", "Strummer", "js1@gmail.com", "Manager", "FT", "City"),
("HP002", "Vanessa", "Vicker", "vv@gmail.com", "Carer", "FT", "City"),
("HP003", "Toby", "Morrison", "tm3@gmail.com", "Carer", "FT", "City" ),
("FP004", "Clara", "Lautner", "cl4@gmail.com", "Admin", "PT", "City"),
("HP005", "Jonathan", "Cheema", "jch@gmail.com", "Carer", "PT", "County"),
("HP006", "Laura", "Vans", "lv6@gmail.com", "Carer", "PT", "County"),
("HP007", "Julie", "Stern", "js7@gmail.com", "Carer", "FT", "County"),
("FP008", "Smalling", "Tomilson", "st8@gmail.com", "Manager","FT", "County"),
("FP009", "Anthony", "Kaine", "ak9@gmail.com", "Admin", "FT", "County"),
("FP010", "Kate", "Ferrel", "kf1@gmail.com", "Admin", "PT", "City"),
("HP011", "Sara", "Kessington", "sk11@gmail.com", "Carer", "PT", "City"),
("HP012", "Lisa", "Klement", "lk$@gmail", "Carer", "PT", "City"),
("HP013", "Gemma", "Pip", "gpp@gmail.com", "Carer", "FT", "City"),
("HP014", "John", "St.John", "jsj@gmail.com", "Carer", "FT", "County");

-- DROP department and grade columns from staff table
ALTER TABLE staff DROP COLUMN department, DROP COLUMN grade;

SELECT * FROM staff;

-- Create service_rate table
CREATE TABLE service_rate (care_level INT PRIMARY KEY, rate DEC(4,2));

-- Populate service_rate table
INSERT INTO service_rate (care_level, rate)
VALUES
(1, 15.00),
(2, 16.50),
(3, 18.75);

SELECT * FROM service_rate;


-- create subscription table
CREATE TABLE subscription
(user_id INT NOT NULL, care_level INT, morning DECIMAL(3,2), dinner DECIMAL (3,2), tea DECIMAL (3,2), bed DECIMAL(3,2));

-- Set foreign key constraint for user_id
 ALTER TABLE subscription 
 ADD CONSTRAINT FOREIGN KEY (user_id) 
 REFERENCES service_users(user_id);

-- Add FK constraint to subscription table on care_level
ALTER TABLE subscription 
ADD CONSTRAINT FOREIGN KEY (care_level)
REFERENCES service_rate(care_level);

-- Populate subscription table
 INSERT INTO subscription ( user_id, care_level, morning, dinner, tea, bed) 
 VALUES
 (001, 2, 1.00, 0.50, 0.50, 0.50),
 (002, 3, 1.75, 0.50, 0.50, 0.50),
 (003, 1, 0.75, 0, 0, 0),
 (004, 2, 0.50, 0.50, 0.50, 0),
 (005, 1, 0.25, 0.25, 0.25, 0),
 (006, 2, 0.75, 0, 0.50, 0),
 (007, 3, 1.00, 1.00, 1.00, 1.00),
 (008, 1, 0.25, 0, 0.25, 0),
 (009, 1, 0.50, 0.50, 0.50, 0.50),
 (010, 2, 0.25, 0, 0.75, 0),
 (011, 2, 0.25, 0.50, 0.50, 0.15),
 (012, 1, 0.50, 0.25, 0.25, 0.25),
 (013, 2, 1.00, 0, 0.50, 0),
 (014, 2, 0.50, 0.25, 0.25, 0.50);
 
 SELECT * FROM subscription;
 
-- create tables for booked calls
CREATE TABLE rota
(log_id VARCHAR(5) PRIMARY KEY, client_id INT, date DATE, assigned_carer_id VARCHAR(8));

-- SET FK constraints
-- 1. client id to reference service userid
ALTER TABLE rota 
ADD CONSTRAINT FOREIGN KEY (client_id) 
REFERENCES service_users(user_id);

-- 2. assigned carerid to reference employee_id
ALTER TABLE rota 
ADD CONSTRAINT FOREIGN KEY (assigned_carer_id) 
REFERENCES staff(employee_id);

-- populate rota table
INSERT INTO rota (log_id, client_id, date, assigned_carer_id)
VALUES
("L7001", 001, CURDATE(), "HP002"),
("L7002", 007, CURDATE(), "HP003"),
("L7003", 012, CURDATE(), "HP005");

SELECT * FROM rota;


-- Core Requirement
-- Subquery and joins to extract:
-- the names, gender, level of care, call_times and duration of 
-- service users who live in the city 
-- ordered by their user_id
-- which check_option to avoid inconsistent updates

SELECT 
    su.user_id,
    su.first_name,
    su.surname,
    su.gender,
    sb.care_level,
    sb.morning,
    sb.dinner,
    sb.tea,
    sb.bed
FROM
    service_users AS su
        LEFT JOIN
    subscription AS sb ON su.user_id = sb.user_id
WHERE
    su.post_outcode IN (SELECT 
            sa.postcode_district
        FROM
            service_areas AS sa
        WHERE
            sa.catchment_area = 'CITY')
ORDER BY user_id;


-- View to check rota and find out who a carer was assigned 
-- should show full name of the carer and the servic_user
-- view consists of 3 table joins

CREATE OR REPLACE VIEW rota_overview AS
    SELECT 
        rota.date,
        rota.log_id,
        rota.client_id,
        CONCAT(su.first_name, ' ', su.surname) AS client_name,
        rota.assigned_carer_id,
        CONCAT(st.first_name, ' ', st.surname) AS carer
    FROM
        rota
            INNER JOIN
        staff AS st ON rota.assigned_carer_id = st.employee_id
            INNER JOIN
        service_users AS su ON rota.client_id = su.user_id WITH CHECK OPTION;
        
	SELECT * FROM rota_overview;
    
    
-- function to calculate cost to be incurred per service daily

DELIMITER //
CREATE FUNCTION care_cost (client_id INT) RETURNS FLOAT
DETERMINISTIC 
BEGIN 
DECLARE total_cost FLOAT;
DECLARE total_hrs FLOAT;
DECLARE client_care_level INT;
DECLARE care_rate DEC(4,2) ;

SELECT 
    (SELECT 
            care_level
        FROM
            subscription
        WHERE
            user_id = client_id)
INTO client_care_level;

SELECT 
    (SELECT 
            rate
        FROM
            service_rate
        WHERE
            care_level = client_care_level)
INTO care_rate;

SELECT 
    (SELECT 
            (morning + dinner + tea + bed)
        FROM
            subscription
        WHERE
            user_id = client_id)
INTO total_hrs;

SET total_cost = total_hrs * care_rate;
RETURN (ROUND(total_cost,2));

END//

DELIMITER ;

-- Run function care_cost
select care_cost(2);



-- Advanced Requirement
-- STORED PROCEDURE

-- sproc to populate rota
	-- check that client is not in the rota
    -- if client not in rota, get client location
    -- Check if there are free carers in  client location i.e. they haven't been assigned to a client
    -- if all carers have been assigned (count of carers in location not assigned == 0), select random carer OR earliest assigned
    -- If all carers haven't been assigned, assign the first free carer to client
    -- update table with client id and assigned carer

DELIMITER // 

CREATE PROCEDURE update_rota(service_user_id int)

BEGIN

DECLARE client_status INT; 
DECLARE client_location VARCHAR(255);
DECLARE available_carer, next_available_carer VARCHAR(255);
DECLARE next_log_id_number INT;
DECLARE next_log_id VARCHAR(5);

-- Get the next log id number
SET next_log_id_number = (SELECT RIGHT(log_id,4) + 1 FROM rota
ORDER BY log_id DESC
LIMIT 1);

-- Get next log id
SET next_log_id = concat("L", CAST(next_log_id_number AS CHAR));

-- Check if client is in rota. If zero, then client hasn't been assigned. 
SET client_status = (SELECT count(*) FROM rota WHERE client_id = service_user_id);

-- Get user location
SET client_location = (SELECT a.catchment_area FROM service_areas AS a 
INNER JOIN service_users AS u ON a.postcode_district = u.post_outcode
WHERE u.user_id = service_user_id);

-- Find free carers in client location and select first carer
SET available_carer = (SELECT employee_id FROM staff WHERE role = "Carer" AND service_area = client_location AND employee_id NOT IN (
	SELECT assigned_carer_id FROM rota) LIMIT 1);
    
-- Select an already assigned carer by earliest assigned date if all carers have been assigned
SET next_available_carer = (SELECT assigned_carer_id FROM rota ORDER BY date ASC LIMIT 1); 

-- Update rota 
IF client_status = 0 THEN
	IF LENGTH(available_carer) > 0 THEN
		INSERT INTO rota (log_id, client_id, date, assigned_carer_id)VALUES(next_log_id, service_user_id, curdate(), available_carer);
	ELSE 
    -- assign carer with the minimum assignment
		INSERT INTO rota (log_id, client_id, date, assigned_carer_id)VALUES(next_log_id, service_user_id, curdate(), next_available_carer);
	END IF;
END IF;

END //

DELIMITER ;	

-- Call procedure update_rota
CALL update_rota(3);

Select * FROM rota;

-- GROUPBY AND HAVING query
-- Get the count of carers 
-- Grouped by service_area
SELECT 
    service_area, role, COUNT(*) AS 'Total Staff'
FROM
    staff
GROUP BY service_area, role
HAVING role = 'Carer';


SELECT * FROM service_users;
# implement trigger to update rota 
# with client_id when a new client is added to the service_users table

DELIMITER //

CREATE TRIGGER client_id_insert
	AFTER INSERT ON service_users
    FOR EACH ROW
BEGIN 
	INSERT INTO rota(client_id)
    VALUES(NEW.user_id);
END //

DELIMITER ;

# Insert new record into service_users table
INSERT INTO service_users (user_id, first_name, surname, gender, email_address, telephone, post_outcode, post_incode)
VALUES (15, "Peppa", "Pig", "F", "pp@gmail.com", 150, "NG1", "2DE");