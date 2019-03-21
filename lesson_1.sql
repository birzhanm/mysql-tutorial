CREATE DATABASE profile;

CREATE TABLE profile(
	id INT NOT NULL AUTO_INCREMENT,
	firstName VARCHAR(255),
	lastNAME VARCHAR(255),
	PRIMARY KEY(id)
);
INSERT INTO profile (firstName, lastNAME) VALUES ('John', 'Smith');

UPDATE profile
SET firstName = "Paul"
WHERE id = 1;

DELETE from profile
WHERE id = 1;

ALTER TABLE profile
ADD testCol VARCHAR(255);

ALTER TABLE profile
MODIFY COLUMN testCol INT(11);

ALTER TABLE profile
DROP COLUMN testCol;
