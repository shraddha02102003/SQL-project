
create database db;
use db;
-- Employees Table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    position VARCHAR(50),
    join_date DATE
);

desc Employees;

-- Attendance Records Table
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    emp_id INT,
    date DATE,
    status VARCHAR(10), -- Present, Absent, Late
    check_in TIME,
    check_out TIME,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);
desc Attendance;

-- Leave Requests Table
CREATE TABLE LeaveRequests (
    leave_id INT PRIMARY KEY,
    emp_id INT,
    start_date DATE,
    end_date DATE,
    leave_type VARCHAR(20), -- Sick, Casual, etc.
    status VARCHAR(10), -- Approved, Pending, Rejected
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);
desc LeaveRequests;



INSERT INTO Employees VALUES
(101, 'Amit Sharma', 'IT', 'Developer', '2025-02-15'),
(204, 'Priya Kumar', 'HR', 'HR Manager', '2025-01-01'),
(303, 'Ram Sharma', 'Comp', 'Data Engineer', '2025-05-02');

INSERT INTO Attendance VALUES
(1, 101, '2025-08-01', 'Present', '09:05', '18:00'),
(2, 204, '2025-08-01', 'Late', '09:20', '18:10'),
(3, 303, '2025-08-01', 'Absent' ,NULL, NULL);

INSERT INTO LeaveRequests VALUES
(1, 101, '2025-08-05', '2025-08-06', 'Sick', 'Approved'),
(2, 204, '2025-08-07', '2025-08-07', 'Casual', 'Pending');

-- List all present employees on a given date
SELECT e.name, a.date, a.status
FROM Employees e
JOIN Attendance a ON e.emp_id = a.emp_id
WHERE a.date = '2025-08-01' AND a.status = 'Present';

-- Get leave requests for a specific employee
SELECT e.name, l.start_date, l.end_date, l.leave_type, l.status
FROM Employees e
JOIN LeaveRequests l ON e.emp_id = l.emp_id
WHERE e.name = 'Amit Sharma';
