CREATE DATABASE Lesson_2;

CREATE TABLE people(
  id INT NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(255),
  lastName VARCHAR(255),
  address VARCHAR(255),
  PRIMARY KEY(id)
);

CREATE TABLE postmen(
  id INT NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(255),
  lastName VARCHAR(255),
  PRIMARY KEY(id)
);

CREATE TABLE letters(
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(255),
  sender INT,
  receiver INT,
  postman INT,
  sent_date DATE,
  received_date DATE,
  PRIMARY KEY(id),
  CONSTRAINT fk_sender FOREIGN KEY(sender) REFERENCES people(id),
  CONSTRAINT fk_receiver FOREIGN KEY(receiver) REFERENCES people(id),
  CONSTRAINT fk_postman FOREIGN KEY(postman) REFERENCES postmen(id)
);

INSERT INTO people
(firstName, lastName, address)
VALUES
('John', 'White', 'Stone street, Beverly Hills'),
('Anna', 'Parkinson', 'Nuts avenue, Santa Barbara'),
('Kendric', 'Lewis', 'Peace lane, Connecticut');

INSERT INTO postmen
(firstName, lastName)
VALUES
('Emma', 'Mitchell'),
('Brian', 'Johnson'),
('Eric', 'Smith');

INSERT INTO letters
(title, sender, receiver, postman, sent_date, received_date)
VALUES
('Greetings', 1, 2, 1, "2019-01-13", "2019-01-20"),
('With Love', 2, 1, 2, "2019-01-25", "2019-02-05"),
('Dear Friend', 2, 3, 1, "2019-01-02", "2019-01010"),
('Congrats', 3, 1, 3, "2019-02-20", "2018-03-15");

-- Now we can play around these tables
-- Let's start with Inner Join
-- Here we wish to find out postmen who delivered at least one letter
SELECT postmen.firstName, postmen.lastName
FROM postmen
INNER JOIN letters
ON postmen.id = letters.postman
ORDER BY postmen.lastName;

-- Let's try to perform Left Join
-- Here we wish to find all the places where letters got delivered and the delivery date
SELECT people.address, letters.received_date
FROM people
LEFT JOIN letters
ON letters.receiver = people.id;

-- Let's try to perform Right Join
-- Here we wish to find the titles of letters and corresponding senders' ids.
SELECT letters.title, people.id
FROM letters
RIGHT JOIN people
ON letters.sender = people.id;
