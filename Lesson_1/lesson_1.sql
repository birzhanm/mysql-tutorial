-- Create a database
CREATE DATABASE Lesson_1;

-- Create a table
CREATE TABLE profile(
	id INT NOT NULL AUTO_INCREMENT,
	firstName VARCHAR(255),
	lastNAME VARCHAR(255),
	country VARCHAR(255),
	age INT(11),
	PRIMARY KEY(id)
);

-- Populate the table with some data
INSERT INTO profile
(firstName, lastName, country, age)
VALUES
('John', 'Smith', 'England',29),
('Patrick', 'Brown', 'Belgium',12),
('Erica', 'Johnson', 'Sweden',78);

-- How to modify the existing table?
-- Modify entries
UPDATE profile
SET firstName = "Paul"
WHERE id = 1;

-- Delete rows
DELETE from profile
WHERE id = 1;

-- Add columns
ALTER TABLE profile
ADD testCol VARCHAR(255);

-- Change column's data type
ALTER TABLE profile
MODIFY COLUMN testCol INT(11);

-- Delete columns
ALTER TABLE profile
DROP COLUMN testCol;

-- How to select from the table?
-- Select everything
SELECT * FROM profile;

-- Select firstName COLUMN
SELECT firstName FROM profile;

-- Select the first row
SELECT * FROM profile WHERE id=1;

-- Order data by firstName value in ascending order
SELECT * FROM profile ORDER BY firstName ASC;
-- ASC refers to ascending order, which is redundant in this example. DESC refers to a descending order

-- We can perform selection based on some condition, say age.
SELECT * FROM profile WHERE age > 30;
-- What if we are looking for people aged between 30 and 40?
SELECT * FROM profile WHERE age BETWEEN 30 AND 40;

-- How to select people with first names starting with 'a'?
SELECT * FROM profile WHERE firstName LIKE 'a%'

-- How to select row with specific country values?
SELECT * FROM profile WHERE country IN ('Belgium', 'Sweden')
