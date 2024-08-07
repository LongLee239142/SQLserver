-- Tạo cơ sở dữ liệu
CREATE DATABASE university_db;
USE university_db;

-- Bảng về thông tin sinh viên
CREATE TABLE students (
    student_id INT IDENTITY PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    address VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(20)
);

-- Bảng về thông tin giảng viên
CREATE TABLE lecturers (
    lecturer_id INT IDENTITY PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    address VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(20)
);

-- Bảng về thông tin môn học
CREATE TABLE courses (
    course_id INT IDENTITY PRIMARY KEY,
    course_name VARCHAR(100),
    department VARCHAR(100),
    lecturer_id INT FOREIGN KEY REFERENCES lecturers
);

-- Bảng về thông tin lớp học
CREATE TABLE classes (
    class_id INT IDENTITY PRIMARY KEY,
    class_name VARCHAR(100),
    course_id INT FOREIGN KEY REFERENCES courses,
    lecturer_id INT FOREIGN KEY REFERENCES lecturers
);

-- Bảng về thông tin kết quả học tập
CREATE TABLE student_grades (
    id INT IDENTITY PRIMARY KEY,
    student_id INT FOREIGN KEY REFERENCES students,
    class_id INT FOREIGN KEY REFERENCES classes,
    grade FLOAT
);

-- Bảng về thông tin điểm danh
CREATE TABLE attendance (
    id INT IDENTITY PRIMARY KEY,
    student_id INT FOREIGN KEY REFERENCES students,
    class_id INT FOREIGN KEY REFERENCES classes,
    date DATE 
);

-- Bảng về thông tin phòng học
CREATE TABLE classrooms (
    room_id INT IDENTITY PRIMARY KEY,
    room_number VARCHAR(10),
    building VARCHAR(50)
);

-- Bảng về thông tin lịch giảng dạy
CREATE TABLE teaching_schedule (
    id INT IDENTITY PRIMARY KEY,
    lecturer_id INT FOREIGN KEY REFERENCES lecturers,
    class_id INT FOREIGN KEY REFERENCES classes,
    room_id INT FOREIGN KEY REFERENCES classrooms,
    day_of_week VARCHAR(10),
    time_start TIME,
    time_end TIME 
);

-- Bảng về thông tin học phí
CREATE TABLE tuition_fees (
    id INT IDENTITY PRIMARY KEY,
    student_id INT FOREIGN KEY REFERENCES students,
    amount DECIMAL(10,2),
);


-- Thêm dữ liệu vào bảng students
INSERT INTO students (first_name, last_name, date_of_birth, address, email, phone_number)
VALUES 
    ('John', 'Doe', '2000-05-15', '123 Main Street', 'john.doe@example.com', '123-456-7890'),
    ('Jane', 'Smith', '2001-08-20', '456 Oak Avenue', 'jane.smith@example.com', '987-654-3210'),
    ('Michael', 'Johnson', '1999-10-10', '789 Elm Road', 'michael.johnson@example.com', '555-123-4567'),
    ('Emily', 'Brown', '2002-03-25', '321 Pine Boulevard', 'emily.brown@example.com', '777-888-9999');

-- Thêm dữ liệu vào bảng lecturers
INSERT INTO lecturers (first_name, last_name, date_of_birth, address, email, phone_number)
VALUES 
    ('Dr. Smith', '', '1975-01-10', '10 University Avenue', 'dr.smith@example.com', '111-222-3333'),
    ('Dr. Johnson', '', '1980-07-20', '20 College Street', 'dr.johnson@example.com', '444-555-6666');

-- Thêm dữ liệu vào bảng courses
INSERT INTO courses (course_name, department, lecturer_id)
VALUES 
    ('Math 101', 'Mathematics', 1),
    ('Physics 201', 'Physics', 2);

-- Thêm dữ liệu vào bảng classes
INSERT INTO classes (class_name, course_id, lecturer_id)
VALUES 
    ('Math 101-A', 1, 1),
    ('Physics 201-B', 2, 2);

-- Thêm dữ liệu vào bảng student_grades
INSERT INTO student_grades (student_id, class_id, grade)
VALUES 
    (1, 1, 95.5),
    (2, 1, 88.0),
    (3, 2, 91.7);

-- Thêm dữ liệu vào bảng attendance
INSERT INTO attendance (student_id, class_id, date)
VALUES 
    (1, 1, '2024-02-19'),
    (2, 1, '2024-02-19'),
    (3, 2, '2024-02-20');

-- Thêm dữ liệu vào bảng classrooms
INSERT INTO classrooms (room_number, building)
VALUES 
    ('101', 'Main'),
    ('201', 'Science'),
    ('301', 'Engineering');

-- Thêm dữ liệu vào bảng teaching_schedule
INSERT INTO teaching_schedule (lecturer_id, class_id, room_id, day_of_week, time_start, time_end)
VALUES 
    (1, 1, 1, 'Monday', '08:00:00', '10:00:00'),
    (1, 1, 1, 'Wednesday', '08:00:00', '10:00:00'),
    (2, 2, 2, 'Tuesday', '10:00:00', '12:00:00');

-- Thêm dữ liệu vào bảng tuition_fees
INSERT INTO tuition_fees (student_id, amount)
VALUES 
    (1, 1500.00),
    (2, 1600.00),
    (3, 1700.00)


-- BAI 1
SELECT first_name, last_name, date
FROM attendance
INNER JOIN students ON attendance.student_id = students.student_id
WHERE date = '2024-02-19';

--BAI 2
SELECT class_name, room_number, building, day_of_week, time_start, time_end
FROM teaching_schedule
INNER JOIN classrooms ON teaching_schedule.room_id = classrooms.room_id
INNER JOIN classes ON teaching_schedule.class_id = classes.class_id
WHERE room_number = 101 AND day_of_week = 'Monday';

--BAI 3
SELECT first_name, last_name, course_name
FROM attendance
INNER JOIN students ON attendance.student_id = students.student_id
INNER JOIN classes ON attendance.class_id = classes.class_id
INNER JOIN courses ON classes.class_id = courses.course_id
WHERE first_name = 'John' AND last_name = 'Doe';

--BAI 4
SELECT first_name, last_name, class_name
FROM teaching_schedule
INNER JOIN lecturers ON teaching_schedule.lecturer_id = lecturers.lecturer_id
INNER JOIN classes ON teaching_schedule.lecturer_id = classes.lecturer_id
WHERE day_of_week = 'Monday' AND time_start = '08:00:00' AND time_end = '10:00:00';

--BAI 5
SELECT DISTINCT first_name, last_name, class_name
FROM teaching_schedule
INNER JOIN lecturers ON teaching_schedule.lecturer_id = lecturers.lecturer_id
INNER JOIN classes ON teaching_schedule.lecturer_id = classes.lecturer_id