--SQL Schema for Course Enrollment System

--Tables

--1)Students

mysql> create table students(
    -> id int primary key auto_increment,
    -> name varchar(50) not null,
    -> email varchar(50) not null unique,
    -> year_of_study int not null check(year_of_study between 1 and 4)
    -> );
Query OK, 0 rows affected (0.08 sec)

--2)Courses

mysql> create table courses(
    -> id int primary key auto_increment,
    -> name varchar(50) not null,
    -> capacity int not null check(capacity>0),
    -> instructor_name varchar(50) not null
    -> );
Query OK, 0 rows affected (0.05 sec)

--3)Enrollments

mysql> create table enrollments(
    -> student_id int,
    -> course_id int,
    -> enrollment_date date not null,
    -> status enum('waitlisted','enrolled','cancelled') default 'enrolled',
    -> primary key(student_id,course_id),
    -> foreign key(student_id) references students(id),
    -> foreign key(course_id) references courses(id)
    -> );
Query OK, 0 rows affected (0.07 sec)

--Hardcoded Values

--Student

mysql> insert into students(name,email,year_of_study) values
    -> ('Kshitij','kk@gmail.com',4),
    -> ('Harish','harish@gmail.com',3),
    -> ('Diya','diya@gmail.com',3),
    -> ('Harini','hrn@gmail.com',1),
    -> ('Namya','namya@gmail.com',4),
    -> ('Vijay','vijay@gmail.com',1),
    -> ('Nirmal','nirm@gmail.com',2),
    -> ('Karn','karn@gmail.com',2),
    -> ('Himesh','himesh1@gmail.com',4),
    -> ('Jimesh','jimesh@gmail.com',2);
Query OK, 10 rows affected (0.02 sec)
Records: 10  Duplicates: 0  Warnings: 0

--Courses

mysql> insert into courses(name,capacity,instructor_name) values
    -> ('Data Science with AIML',3,'Prof. Rahul Dev'),
    -> ('Java Full Stack',2,'Prof. Payal Rao'),
    -> ('Python with Machine Learning',3,'Prof. Vinesh Nayar'),
    -> ('Semiconductor Engineering',4,'Dr. Anurag Jaiswal');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

--Enrollments

mysql> insert into enrollments (student_id, course_id, enrollment_date, status) values
    -> (1, 1, '2026-07-01', 'enrolled'),
    -> (2, 1, '2026-07-02', 'enrolled'),
    -> (3, 1, '2026-07-03', 'enrolled'),
    -> (4, 1, '2026-07-04', 'waitlisted'),
    -> (5, 2, '2026-07-01', 'enrolled'),
    -> (6, 2, '2026-07-02', 'enrolled'),
    -> (7, 2, '2026-07-03', 'waitlisted'),
    -> (8, 3, '2026-07-01', 'enrolled'),
    -> (9, 3, '2026-07-02', 'enrolled'),
    -> (10, 3, '2026-07-03', 'enrolled'),
    -> (1, 3, '2026-07-04', 'waitlisted'),
    -> (2, 4, '2026-07-01', 'enrolled'),
    -> (3, 4, '2026-07-02', 'enrolled'),
    -> (4, 4, '2026-07-03', 'enrolled'),
    -> (5, 4, '2026-07-04', 'enrolled');
Query OK, 15 rows affected (0.01 sec)
Records: 15  Duplicates: 0  Warnings: 0

--Write SQL queries for:

--List all courses that are at full capacity (i.e., number of enrolled students = course capacity).

mysql> select c.name from courses c
    -> join enrollments e on c.id=e.course_id and e.status='enrolled'
    -> group by c.id,c.name,c.capacity
    -> having count(e.student_id)>=c.capacity;

--List students who are enrolled in more than 2 courses.

mysql> select s.name,count(e.course_id) as course_count
    -> from students s
    -> join enrollments e on s.id=e.student_id and e.status='enrolled'
    -> group by s.id,s.name
    -> having count(e.course_id)>2;

--For each course, show the number of students enrolled and the number of empty seats remaining.

mysql> select c.name ,count(e.student_id) as enrolled_students,
    -> (c.capacity-count(e.student_id)) as empty_seats
    -> from courses c
    -> left join enrollments e on c.id=e.course_id and e.status='enrolled'
    -> group by c.id,c.name,c.capacity;

--Find students who have not enrolled in any course.

mysql> select s.name
    -> from students s
    -> left join enrollments e
    -> on s.id=e.student_id
    -> where e.student_id is null;
