-- Bảng về thông tin sinh viên
CREATE TABLE students(
     student_id INT IDENTITY PRIMARY KEY,
	 first_name VARCHAR(50),
	 last_name VARCHAR(50),
	 date_of_brith DATE,
	 email VARCHAR (100),
	 phone_number VARCHAR(20)
);
INSERT INTO students (first_name, last_name, date_of_brith, email, phone_number)
VALUES ( 'Student ', '1', '2017-02-06', 'student1@example.com', '0123456789'),
       ( 'Student ', '2', '2017-03-07', 'student2@example.com', '0912345678'),
	   ( 'Student ', '3', '2017-04-08', 'student3@example.com', '0812345678'),
	   ( 'Student ', '4', '2017-05-09', 'student4@example.com', '0312345678')
SELECT * FROM students




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
INSERT INTO lecturers (first_name, last_name, date_of_birth, address, email, phone_number)
VALUES ( 'Lecturer ', '1', '1989-02-06','47 Pham Van Dong' ,'lecturer1@example.com', '0123456789'),
       ( 'Lecturer ', '2', '1985-03-07','47 Pham Van Dong' ,'lecturer2@example.com', '0912345678'),
	   ( 'Lecturer ', '3', '1990-04-08','47 Pham Van Dong' ,'lecturer3@example.com', '0812345678'),
	   ( 'Lecturer ', '4', '1994-05-09','47 Pham Van Dong' ,'lecturer4@example.com', '0312345678')
SELECT * FROM lecturers





-- Bảng về thông tin môn học
CREATE TABLE courses (
    course_id INT IDENTITY PRIMARY KEY,
    course_name VARCHAR(100),
    department VARCHAR(100),
    lecturer_id INT,
    FOREIGN KEY (lecturer_id) REFERENCES lecturers(lecturer_id)
);
INSERT INTO courses (course_name, department, lecturer_id)
VALUES ( 'Course 1 ', 'Department 1','1' ),
       ( 'Course 2', 'Department 2', '2'),
	   ( 'Course 3', 'Department 3', '3'),
	   ( 'Course 4', 'Department 4', '4')
SELECT * FROM courses



-- Bảng về thông tin lớp học
CREATE TABLE  classes (
    class_id INT IDENTITY PRIMARY KEY,
    class_name VARCHAR(100),
    course_id INT,
    lecturer_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (lecturer_id) REFERENCES lecturers(lecturer_id)
);
INSERT INTO classes (class_name, course_id, lecturer_id)
VALUES ( 'Classname 1 ', ' 1','1' ),
       ( 'Classname 2', ' 2', '2'),
	   ( 'Classname 3', ' 3', '3'),
	   ( 'Classname 4', ' 4', '4')
SELECT * FROM classes




-- Bảng về thông tin kết quả học tập
CREATE TABLE student_grades (
    id INT IDENTITY PRIMARY KEY,
    student_id INT,
    class_id INT,
    grade FLOAT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
);
INSERT INTO student_grades (student_id, class_id, grade)
VALUES ( '1 ', ' 1','7.2' ),
       ( ' 2', ' 2', '6.3'),
	   ( ' 3', ' 3', '5.4'),
	   ( ' 4', ' 4', '8.4')
SELECT * FROM student_grades




-- Bảng về thông tin điểm danh
CREATE TABLE attendance (
    id INT IDENTITY PRIMARY KEY,
    student_id INT,
    class_id INT,
    date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
);
INSERT INTO attendance (student_id, class_id, date)
VALUES ( '1 ', ' 1','2024-02-03' ),
       ( ' 2', ' 2', '2024-02-06'),
	   ( ' 3', ' 3', '2024-02-09'),
	   ( ' 4', ' 4', '2024-02-12')
SELECT * FROM attendance



-- Bảng về thông tin phòng học
CREATE TABLE  classrooms (
    room_id INT IDENTITY PRIMARY KEY,
    room_number VARCHAR(10),
    building VARCHAR(50)
);
INSERT INTO classrooms (room_number, building)
VALUES ( '1 ', ' A' ),
       ( ' 2', ' B'),
	   ( ' 3', ' C'),
	   ( ' 4', ' D')
SELECT * FROM classrooms



-- Bảng về thông tin lịch giảng dạy
CREATE TABLE teaching_schedule (
    id INT IDENTITY PRIMARY KEY,
    lecturer_id INT,
    class_id INT,
    room_id INT,
    day_of_week VARCHAR(10),
    time_start TIME,
    time_end TIME,
    FOREIGN KEY (lecturer_id) REFERENCES lecturers(lecturer_id),
    FOREIGN KEY (class_id) REFERENCES classes(class_id),
    FOREIGN KEY (room_id) REFERENCES classrooms(room_id)
);
INSERT INTO teaching_schedule (lecturer_id, class_id, room_id, day_of_week , time_start ,time_end)
VALUES ( '1 ','1 ','1 ','MONDAY' , ' 08:00:00', '10:00:00' ),
       ( ' 2',' 2', '2 ','MONDAY',' 08:00:00','10:00:00 '),
	   ( ' 3', ' 3','3','MONDAY',' 08:00:00','12:00:00'),
	   ( ' 4', ' 4','4 ','MONDAY',' 08:00:00','12:00:00')
SELECT * FROM teaching_schedule


-- Bảng về thông tin học phí
CREATE TABLE tuition_fees (
    id INT IDENTITY PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
INSERT INTO tuition_fees (student_id, amount)
VALUES ( '1 ',10.345 ),
       ( ' 2',10.375),
	   ( ' 3',10.365),
	   ( ' 4',10.34556)
SELECT * FROM tuition_fees



SELECT * FROM students
SELECT * FROM lecturers
SELECT * FROM courses
SELECT * FROM classes
SELECT * FROM student_grades
SELECT * FROM attendance
SELECT * FROM classrooms
SELECT * FROM teaching_schedule
SELECT * FROM tuition_fees

--Đề bài 1: Lấy thông tin về các sinh viên đã điểm danh trong một lớp học cụ thể vào một ngày cụ thể.
SELECT  students.first_name ,students.last_name, attendance.date
FROM students
INNER JOIN
attendance
ON students.student_id = attendance.student_id

--Đề bài 2: Lấy thông tin về các lớp học được tổ chức ở một phòng học cụ thể trong một ngày cụ thể.
SELECT classes.class_name, classrooms.room_number, classrooms.building, teaching_schedule.day_of_week, teaching_schedule.time_start, teaching_schedule.time_end
FROM classes
INNER JOIN teaching_schedule ON classes.class_id = teaching_schedule.class_id
INNER JOIN classrooms ON teaching_schedule.room_id = classrooms.room_id
WHERE room_number = '1';

--Đề bài 3: Lấy thông tin về các môn học mà một sinh viên cụ thể đã đăng ký.
SELECT  students.first_name ,students.last_name, courses.course_name
FROM students
INNER JOIN student_grades ON students.student_id = student_grades.student_id
INNER JOIN classes ON classes.class_id = student_grades.class_id
INNER JOIN courses ON courses.lecturer_id = classes.lecturer_id


--Đề bài 4: Lấy thông tin về giảng viên đã dạy lớp học nào trong thời gian từ 8:00 đến 12:00 vào thứ Hai.
SELECT  students.first_name ,students.last_name, classes.class_name
FROM students
INNER JOIN student_grades ON students.student_id = student_grades.student_id
INNER JOIN classes ON classes.class_id = student_grades.class_id
INNER JOIN courses ON courses.lecturer_id = classes.lecturer_id


--Đề bài 5: Lấy thông tin về các lớp học mà một giảng viên cụ thể đang dạy.
SELECT lecturers.first_name ,lecturers.last_name, classes.class_name
FROM lecturers
INNER JOIN classes ON lecturers.lecturer_id = classes.lecturer_id


