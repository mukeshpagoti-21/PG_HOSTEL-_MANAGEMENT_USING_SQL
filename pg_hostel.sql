


-- =====================================================
-- PG HOSTEL STUDENT MANAGEMENT SYSTEM
-- SQL Project
-- =====================================================

-- 1. CREATE DATABASE
CREATE DATABASE pg_hostel_management;

USE pg_hostel_management;

-- =====================================================
-- 3. CREATE ROOMS TABLE:
-- =====================================================

CREATE TABLE Rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_number VARCHAR(10) NOT NULL UNIQUE,
    room_type VARCHAR(20) NOT NULL,
    capacity INT NOT NULL,
    monthly_rent DECIMAL(10,2) NOT NULL,
    available_beds INT NOT NULL DEFAULT 0,

    CHECK (room_type IN ('Single', 'Double', 'Triple')),
    CHECK (capacity > 0),
    CHECK (monthly_rent > 0),
    CHECK (available_beds >= 0)
);


-- =====================================================
-- 4. CREATE STUDENTS TABLE:
-- =====================================================

CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    college VARCHAR(100) NOT NULL,
    course VARCHAR(50) NOT NULL,
    room_id INT,

    CHECK (gender IN ('Male', 'Female')),

    FOREIGN KEY (room_id)
        REFERENCES Rooms(room_id)
);


-- =====================================================
-- 5. CREATE PAYMENTS TABLE:
-- =====================================================

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR(20) NOT NULL DEFAULT 'Pending',
    payment_month DATE NOT NULL,

    CHECK (amount > 0),
    CHECK (payment_status IN ('Paid', 'Pending')),

    FOREIGN KEY (student_id)
        REFERENCES Students(student_id)
);


-- =====================================================
-- 6. CREATE VISITORS TABLE:
-- =====================================================

CREATE TABLE Visitors (
    visitor_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    visitor_name VARCHAR(100) NOT NULL,
    relationship VARCHAR(50) NOT NULL,
    visit_date DATE NOT NULL,

    FOREIGN KEY (student_id)
        REFERENCES Students(student_id)
);


-- =====================================================
-- 7. INSERT ROOMS
-- =====================================================

INSERT INTO Rooms
(room_number, room_type, capacity, monthly_rent, available_beds)
VALUES
('101', 'Single', 1, 6000, 0),
('102', 'Double', 2, 4500, 0),
('103', 'Double', 2, 4500, 0),
('104', 'Triple', 3, 3500, 0),
('105', 'Double', 2, 4500, 0);


-- =====================================================
-- 8. INSERT STUDENTS
-- =====================================================

INSERT INTO Students
(student_name, gender, phone, college, course, room_id)
VALUES
('Ramana', 'Male', '9876500001',
 'Aditya College of Engineering', 'MCA', 1),

('Ranjinth', 'Male', '9876500002',
 'Andhra University', 'B.Tech', 2),

('Anusha', 'Female', '9876500003',
 'GITAM University', 'B.Sc', 2),

('Sampath', 'Male', '9876500004',
 'Raghu Engineering College', 'B.Tech', 3),

('Vamsi', 'Male', '9876500005',
 'Aditya College of Engineering', 'MCA', 3),

('Priya', 'Female', '9876500006',
 'Andhra University', 'MCA', 4),

('Bhanu', 'Male', '9876500007',
 'GITAM University', 'BBA', 4),

('Srinadh', 'Male', '9876500008',
 'Raghu Engineering College', 'B.Tech', 4),

('Mukesh', 'Male', '9876500009',
 'Aditya College of Engineering', 'MCA', 5),

('Kiran', 'Male', '9876500010',
 'Andhra University', 'B.Tech', 5);


-- =====================================================
-- 9. INSERT PAYMENTS
-- =====================================================

INSERT INTO Payments
(student_id, payment_date, amount, payment_status, payment_month)
VALUES
(1, '2026-09-05', 6000, 'Paid', '2026-09-01'),
(1, '2026-10-05', 6000, 'Paid', '2026-10-01'),

(2, '2026-09-06', 4500, 'Paid', '2026-09-01'),
(2, '2026-10-06', 4500, 'Pending', '2026-10-01'),

(3, '2026-09-07', 4500, 'Paid', '2026-09-01'),

(4, '2026-10-05', 4500, 'Paid', '2026-10-01'),

(5, '2026-10-06', 4500, 'Pending', '2026-10-01'),

(6, '2026-10-04', 3500, 'Paid', '2026-10-01'),

(7, '2026-09-05', 3500, 'Paid', '2026-09-01'),

(8, '2026-10-05', 3500, 'Paid', '2026-10-01'),

(9, '2026-10-05', 4500, 'Paid', '2026-10-01');


-- =====================================================
-- 10. INSERT VISITORS
-- =====================================================

INSERT INTO Visitors
(student_id, visitor_name, relationship, visit_date)
VALUES
(1, 'Suresh Kumar', 'Father', '2026-10-02'),
(2, 'Ravi Kumar', 'Brother', '2026-10-03'),
(3, 'Lakshmi', 'Mother', '2026-10-04'),
(4, 'Mahesh', 'Friend', '2026-10-05'),
(6, 'Prakash', 'Father', '2026-10-06'),
(8, 'Vijay', 'Brother', '2026-10-07'),
(9, 'Ramesh', 'Father', '2026-10-08');


-- =====================================================
-- 11. BASIC QUERIES
-- =====================================================

SELECT * FROM Students;

SELECT student_name, phone, course
FROM Students;

SELECT *
FROM Students
WHERE gender = 'Male';

SELECT DISTINCT course
FROM Students;

SELECT *
FROM Students
ORDER BY student_name ASC;

SELECT *
FROM Students
LIMIT 5;


-- =====================================================
-- 12. FILTERING OPERATORS
-- =====================================================

SELECT * FROM Rooms
WHERE monthly_rent = 4500;

SELECT * FROM Students
WHERE gender != 'Female';

SELECT * FROM Rooms
WHERE monthly_rent > 4000;

SELECT * FROM Rooms
WHERE monthly_rent < 5000;

SELECT * FROM Rooms
WHERE monthly_rent >= 4500;

SELECT * FROM Rooms
WHERE monthly_rent <= 4500;

SELECT * FROM Rooms
WHERE monthly_rent BETWEEN 3500 AND 5000;

SELECT * FROM Students
WHERE course IN ('MCA', 'B.Tech');

SELECT * FROM Students
WHERE course NOT IN ('MCA', 'B.Tech');

SELECT * FROM Students
WHERE student_name LIKE 'A%';

SELECT * FROM Students
WHERE student_name LIKE '%a%';

SELECT * FROM Students
WHERE room_id IS NULL;

SELECT * FROM Students
WHERE room_id IS NOT NULL;


-- =====================================================
-- 13. AGGREGATE FUNCTIONS
-- =====================================================

SELECT COUNT(*) AS total_students
FROM Students;

SELECT SUM(amount) AS total_paid
FROM Payments
WHERE payment_status = 'Paid';

SELECT AVG(monthly_rent) AS average_rent
FROM Rooms;

SELECT MIN(monthly_rent) AS minimum_rent
FROM Rooms;

SELECT MAX(monthly_rent) AS maximum_rent
FROM Rooms;


-- =====================================================
-- 14. GROUP BY
-- =====================================================

SELECT gender, COUNT(*) AS total_students
FROM Students
GROUP BY gender;

SELECT room_id, COUNT(*) AS student_count
FROM Students
GROUP BY room_id;

SELECT student_id, SUM(amount) AS total_payment
FROM Payments
GROUP BY student_id;


-- =====================================================
-- 15. HAVING
-- =====================================================

SELECT
    student_id,
    SUM(amount) AS total_payment
FROM Payments
GROUP BY student_id
HAVING SUM(amount) > 5000;


-- =====================================================
-- 16. STRING FUNCTIONS
-- =====================================================

SELECT UPPER(student_name) AS student_name
FROM Students;

SELECT LOWER(student_name) AS student_name
FROM Students;

SELECT CONCAT(student_name, ' - ', course) AS student_details
FROM Students;

SELECT student_name, LENGTH(student_name) AS name_length
FROM Students;


-- =====================================================
-- 17. DATE FUNCTIONS
-- =====================================================

SELECT CURDATE() AS today;

SELECT
    payment_date,
    YEAR(payment_date) AS payment_year
FROM Payments;

SELECT
    payment_date,
    MONTH(payment_date) AS payment_month
FROM Payments;

SELECT
    visitor_name,
    DATEDIFF(CURDATE(), visit_date) AS days_since_visit
FROM Visitors;


-- =====================================================
-- 18. CASE
-- =====================================================

SELECT
    student_id,
    amount,
    payment_status,
    CASE
        WHEN payment_status = 'Paid'
            THEN 'Payment Completed'
        WHEN payment_status = 'Pending'
            THEN 'Payment Due'
    END AS payment_message
FROM Payments;


-- =====================================================
-- 19. INNER JOIN
-- =====================================================

SELECT
    s.student_name,
    r.room_number,
    r.monthly_rent
FROM Students s
INNER JOIN Rooms r
    ON s.room_id = r.room_id;


-- =====================================================
-- 20. LEFT JOIN
-- =====================================================

SELECT
    s.student_name,
    p.payment_date,
    p.amount,
    p.payment_status
FROM Students s
LEFT JOIN Payments p
    ON s.student_id = p.student_id;


-- =====================================================
-- 21. RIGHT JOIN
-- =====================================================

SELECT
    s.student_name,
    r.room_number,
    r.monthly_rent
FROM Students s
RIGHT JOIN Rooms r
    ON s.room_id = r.room_id;


-- =====================================================
-- 22. CROSS JOIN
-- =====================================================

SELECT
    s.student_name,
    r.room_number
FROM Students s
CROSS JOIN Rooms r;


-- =====================================================
-- 23. FULL OUTER JOIN SIMULATION
-- =====================================================

SELECT
    s.student_name,
    r.room_number
FROM Students s
LEFT JOIN Rooms r
    ON s.room_id = r.room_id

UNION

SELECT
    s.student_name,
    r.room_number
FROM Students s
RIGHT JOIN Rooms r
    ON s.room_id = r.room_id;


-- =====================================================
-- 24. SUBQUERY
-- =====================================================

SELECT
    s.student_name,
    p.amount
FROM Students s
JOIN Payments p
    ON s.student_id = p.student_id
WHERE p.amount > (
    SELECT AVG(amount)
    FROM Payments
);


-- Highest payment

SELECT
    s.student_name,
    p.amount
FROM Students s
JOIN Payments p
    ON s.student_id = p.student_id
WHERE p.amount = (
    SELECT MAX(amount)
    FROM Payments
);


-- Rooms above average rent

SELECT *
FROM Rooms
WHERE monthly_rent > (
    SELECT AVG(monthly_rent)
    FROM Rooms
);


-- Students with at least one payment

SELECT *
FROM Students
WHERE student_id IN (
    SELECT DISTINCT student_id
    FROM Payments
);

-- =====================================================
-- 25. UNION
-- =====================================================

SELECT student_name AS name
FROM Students

UNION

SELECT visitor_name AS name
FROM Visitors;


-- =====================================================
-- 26. UNION ALL
-- =====================================================

SELECT student_name AS name
FROM Students

UNION ALL

SELECT visitor_name AS name
FROM Visitors;

-- =====================================================
-- 27. CTE
-- =====================================================

WITH StudentPayments AS (
    SELECT
        student_id,
        SUM(amount) AS total_payment
    FROM Payments
    WHERE payment_status = 'Paid'
    GROUP BY student_id
)
SELECT
    s.student_name,
    sp.total_payment
FROM Students s
JOIN StudentPayments sp
    ON s.student_id = sp.student_id
WHERE sp.total_payment > 5000;
-- =====================================================
-- 28. VIEW
-- =====================================================

CREATE VIEW student_room_details AS
SELECT
    s.student_name,
    s.phone,
    r.room_number,
    r.room_type,
    r.monthly_rent
FROM Students s
JOIN Rooms r
    ON s.room_id = r.room_id;

SELECT *
FROM student_room_details;
-- =====================================================
-- 30. INDEX
-- =====================================================

CREATE INDEX idx_student_phone
ON Students(phone);


-- Test index column
SELECT *
FROM Students
WHERE phone = '9876500001';


-- =====================================================
-- 31. TRANSACTION EXAMPLE
-- =====================================================

START TRANSACTION;

UPDATE Payments
SET payment_status = 'Paid'
WHERE payment_id = 4;

SAVEPOINT payment_save;

COMMIT;

-- =====================================================
-- 32. ROLLBACK EXAMPLE
-- =====================================================

START TRANSACTION;

UPDATE Payments
SET amount = 9999
WHERE payment_id = 4;

ROLLBACK;

-- =====================================================
-- END OF PROJECT
-- =====================================================
