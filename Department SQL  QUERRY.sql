CREATE TABLE Staff(
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    second_name VARCHAR(30),
    birth_day DATE,
    sex VARCHAR(1),
    salary INT,
    supervisor_id INT,
    department_id INT
);
CREATE TABLE department(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(30),
    Hod_id INT,
    Hod_start_date DATE,
    FOREIGN KEY(Hod_id) REFERENCES staff(staff_id) ON DELETE SET NULL
);
ALTER TABLE staff
ADD FOREIGN KEY(department_id)
REFERENCES department(department_id)
ON DELETE SET NULL;
ALTER TABLE staff
ADD FOREIGN KEY(supervisor_id)
REFERENCES staff(staff_id)
ON DELETE SET NULL;
CREATE TABLE pupil(
    pupil_id INT PRIMARY KEY,
    pupil_name VARCHAR(30),
    department_id INT,
    FOREIGN KEY(department_id) REFERENCES department(department_id) ON DELETE SET NULL
);
CREATE TABLE works_with(
    staff_id INT,
    pupil_id INT,
    total_output INT,
    PRIMARY KEY(staff_id, pupil_id), 
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id) ON DELETE CASCADE,
    FOREIGN KEY(pupil_id) REFERENCES pupil(pupil_id) ON DELETE CASCADE
);
CREATE TABLE department_supplier(
    department_id INT,
    supplier_name VARCHAR(30),
    supplier_type VARCHAR(30),
    PRIMARY KEY(department_id, supplier_name),
    FOREIGN KEY(department_id) REFERENCES department(department_id) ON DELETE CASCADE
);
INSERT INTO staff VALUES(100, 'David', 'Michael', '2000-11-17', 'M', 250000, NULL, NULL);
INSERT INTO department VALUES(1, 'Physics', 100, '2018-02-09');
UPDATE staff
SET department_id = 1
WHERE staff_id = 100;
INSERT INTO staff VALUES(101, 'Samuel', 'Gbadebo', '1997-05-11', 'M', 110000, 100, 1);
INSERT INTO staff VALUES(102,'Michael', 'Scott', '2013-07-23');
INSERT INTO department VALUES(2, 'Biology', 102, '2005-04-06');
UPDATE staff
SET department_id = 2
WHERE staff_id = 102;
INSERT INTO staff VALUES(103, 'Angela', 'Kate', '2004-06-26', 'F', 200000, 102, 2);
INSERT INTO staff VALUES(104, 'Emmanuel', 'Deborah', '1998-01-22', 'F', 350000, 102, 2);
INSERT INTO staff VALUES(105, 'Kelvin', 'Ben', '2000-09-26', 'M', 204000, 102, 2);

INSERT INTO staff VALUES(106, 'Oluwaseun', 'Tobiloba', '2000-04-27', 'M');
INSERT INTO department VALUES(3, 'Chemistry', 106, '1965-05-31');
UPDATE staff
SET department_id = 3
WHERE staff_id = 	106;
INSERT INTO staff VAlUES (107, 'Abiodun', 'Tolase', '1999-01-12', 'F', 2000000, 106, 3);
INSERT INTO staff VAlUES (108, 'Adams', 'Busayo', '2000-11-23', 'F', 2050000, 106, 3);

INSERT INTO department_supplier VALUES(2,'Johnson Steve', 'Paper');
INSERT INTO department_supplier VALUES(2,'Michael Ajao', 'Writting Utensils');
INSERT INTO department_supplier VALUES(3,'Ajao Blossom', 'Paper');
INSERT INTO department_supplier VALUES(2,'J&J Prints', 'Handouts');
INSERT INTO department_supplier VALUES(3,'Michael Ajao', 'Writting Utensils');
INSERT INTO department_supplier VALUES(3,'Johnson Steve', 'Paper');
INSERT INTO department_supplier VALUES(2,'Parle&co Electronics', 'Printers');

INSERT INTO pupil VALUES(400, 'Kolawole Adura', 2);
INSERT INTO pupil VALUES(401, 'Akanji Odunola', 2);
INSERT INTO pupil VALUES(402, 'Akintunde Seyi', 3);
INSERT INTO pupil VALUES(403, 'Adeyeye Bridget', 3)
INSERT INTO pupil VALUES(404, 'Akinyele Funmilayo', 2);
INSERT INTO pupil VALUES(405, 'Ojo Tosin', 3)
INSERT INTO pupil VALUES(406, 'Ojo Funmibi', 2)

INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 200000);
INSERT INTO works_with VALUES(108, 402, 145000);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 21000);
INSERT INTO works_with VALUES(105, 404, 330000);
INSERT INTO works_with VALUES(107, 405, 67000);
INSERT INTO works_with VALUES(102, 406, 155000);
INSERT INTO works_with VALUES(105, 406, 555000);

SELECT * FROM staff;
Select * From department;
Select * From pupil;
Select * From works_with;