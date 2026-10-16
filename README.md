# PG Hostel Student Management System

## 📌 Project Overview

The **PG Hostel Student Management System** is a SQL-based database project designed to manage student details, hostel room information, monthly rent payments, and visitor records in a PG hostel.

This project demonstrates essential and advanced SQL concepts, including database creation, table relationships, filtering, aggregate functions, joins, subqueries, Common Table Expressions (CTEs), views, indexes, and transactions.

## 🎯 Objectives

- Store and manage student information.
- Maintain hostel room details and rental information.
- Track student rent payments and payment statuses.
- Record visitor details and visit dates.
- Retrieve useful information using SQL queries.
- Demonstrate relational database concepts and SQL operations.

## 🛠️ Technologies Used

- **Database:** MySQL
- **Language:** SQL
- **File:** `pg_hostel.sql`

## 🗄️ Database Structure

The project uses the database `pg_hostel_management` and contains four main tables.

### 1. Rooms

Stores information about hostel rooms.

- `room_id` – Unique room ID
- `room_number` – Room number
- `room_type` – Single, Double, or Triple
- `capacity` – Maximum room capacity
- `monthly_rent` – Monthly rent amount
- `available_beds` – Number of available beds

### 2. Students

Stores student details and room assignments.

- `student_id` – Unique student ID
- `student_name` – Student name
- `gender` – Student gender
- `phone` – Contact number
- `college` – College or university name
- `course` – Course of study
- `room_id` – Assigned room ID

### 3. Payments

Stores student payment records.

- `payment_id` – Unique payment ID
- `student_id` – Associated student ID
- `payment_date` – Date of payment
- `amount` – Payment amount
- `payment_status` – Paid or Pending
- `payment_month` – Month for which payment is recorded

### 4. Visitors

Stores visitor information.

- `visitor_id` – Unique visitor ID
- `student_id` – Student being visited
- `visitor_name` – Visitor name
- `relationship` – Relationship with the student
- `visit_date` – Date of visit

## 🔗 Table Relationships

- **Rooms → Students:** A room can be associated with multiple students, depending on its capacity.
- **Students → Payments:** A student can have multiple payment records.
- **Students → Visitors:** A student can have multiple visitor records.

Foreign keys are used to maintain relationships between the tables.

## ✨ Features

- Database and table creation
- Sample data insertion
- Student and room management queries
- Payment tracking
- Visitor record management
- Data filtering and sorting
- Aggregate calculations
- Grouping with `GROUP BY` and `HAVING`
- String and date functions
- Conditional logic using `CASE`
- `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and `CROSS JOIN`
- Full outer join simulation using `UNION`
- Subqueries and nested queries
- `UNION` and `UNION ALL`
- Common Table Expressions (CTEs)
- Views for student and room details
- Index creation
- Transaction management using `COMMIT` and `ROLLBACK`

## 📂 Project Structure

```text
PG-Hostel-Student-Management-System/
│
├── pg_hostel.sql
└── README.md
```

## 🚀 How to Run the Project

### Step 1: Install MySQL

Install MySQL Server and use a SQL client such as MySQL Workbench.

### Step 2: Open the SQL File

Open `pg_hostel.sql` in MySQL Workbench or another MySQL-compatible SQL editor.

### Step 3: Execute the Script

Run the SQL script to create the database, create tables, insert sample records, and execute the example queries.

Alternatively, execute the script from the MySQL command line:

```bash
mysql -u root -p < pg_hostel.sql
```

Enter your MySQL password when prompted.

### Step 4: Explore the Database

Use the following queries to inspect the data:

```sql
USE pg_hostel_management;

SELECT * FROM Students;

SELECT * FROM Rooms;

SELECT * FROM Payments;

SELECT * FROM Visitors;
```

**Note:** This project uses MySQL-specific syntax, including `AUTO_INCREMENT`, `USE`, `CURDATE()`, and `LIMIT`. It should be executed in MySQL rather than PostgreSQL without modifications.

## 📊 Example SQL Queries

### 1. Display All Students

```sql
SELECT * FROM Students;
```

### 2. Find Students and Their Room Details

```sql
SELECT
    s.student_name,
    r.room_number,
    r.monthly_rent
FROM Students s
INNER JOIN Rooms r
    ON s.room_id = r.room_id;
```

### 3. Calculate Total Paid Amount

```sql
SELECT SUM(amount) AS total_paid
FROM Payments
WHERE payment_status = 'Paid';
```

### 4. Find Pending Payments

```sql
SELECT
    s.student_name,
    p.amount,
    p.payment_month,
    p.payment_status
FROM Students s
INNER JOIN Payments p
    ON s.student_id = p.student_id
WHERE p.payment_status = 'Pending';
```

### 5. Count Students by Gender

```sql
SELECT
    gender,
    COUNT(*) AS total_students
FROM Students
GROUP BY gender;
```

## 📚 SQL Concepts Demonstrated

This project provides practical experience with:

- DDL (Data Definition Language)
- DML (Data Manipulation Language)
- DQL (Data Query Language)
- Constraints and foreign keys
- Filtering operators
- Aggregate functions
- Joins and subqueries
- CTEs and views
- Indexes
- Transactions and rollback operations

## 🔮 Future Enhancements

- Add automatic room availability updates.
- Create a student check-in and check-out system.
- Generate monthly rent reports.
- Add late-payment tracking and reminders.
- Implement room allocation based on available beds.
- Build a web-based interface for hostel administrators.
- Add user authentication and role-based access control.

## 👨‍💻 Author

-PAGOTI . JYOTHIR MUKESH

## 📄 License

This project is available for educational and learning purposes. You may adapt it for academic projects and personal practice.
