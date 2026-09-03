use lms_database;
show tables;

select * from modules;
select * from courses;
select * from  assignments;
select * from categories;
select * from quiz_attempts;
select * from quizzes;
select * from certificates;
describe certificates;
select * from enrollments;
select user_id,full_name from users where full_name ='Divya S';
select * from users; 
select * from roles;
SELECT u.user_id, u.full_name, u.email, u.status
FROM users u
JOIN roles r ON u.role_id = r.role_id
WHERE r.role_name = 'Student';

SELECT u.user_id, u.full_name, u.email, u.status
FROM users u
JOIN roles r ON u.role_id = r.role_id
WHERE r.role_name = 'Trainer';

SELECT *
FROM courses
WHERE status = 'PUBLISHED';

select count(*) from courses;

SELECT status,count(*) as total
FROM courses
GROUP BY status;

SELECT 
    c.title,
    cat.category_name
FROM courses c
JOIN categories cat
    ON c.category_id = cat.category_id;


SHOW CREATE TABLE enrollments;
describe enrollments;

select count(*) from users;

select * from enrollments where status = 'active';

select * from users;
select * from roles;
select * from users where role_id =3;

select * from courses where course_id =1;
USE lms_database;

UPDATE users
SET password_hash = 'Admin@123'
WHERE user_id = 1;

UPDATE users
SET password_hash = 'Trainer@123'
WHERE user_id IN (1, 2, 3, 4, 5, 6);




SELECT * 
FROM enrollments
WHERE status = 'ACTIVE';

select * from enrollments;
select * from assignments;
select * from courses;

select s.student_name,c.course_title,e.status from  enrollments e join student on e.student_id= s.student_id 
join course  c ON e.course_id  = c.course_id;


UPDATE users
SET password_hash = CASE user_id

    WHEN 1 THEN 'Admin@123'
    WHEN 2 THEN 'Arun@123'
    WHEN 3 THEN 'Priya@123'
    WHEN 4 THEN 'Rahul@123'
    WHEN 5 THEN 'Divya@123'
    WHEN 6 THEN 'Karthik@123'
    WHEN 7 THEN 'Sathish@123'
    WHEN 8 THEN 'Vijay@123'
    WHEN 9 THEN 'Anjali@123'
    WHEN 10 THEN 'Ravi@123'
    WHEN 11 THEN 'Meena@123'
    WHEN 12 THEN 'Ajay@123'
    WHEN 13 THEN 'Sneha@123'
    WHEN 14 THEN 'Manoj@123'
    WHEN 15 THEN 'Deepa@123'
    WHEN 16 THEN 'Hari@123'
    WHEN 17 THEN 'Lakshmi@123'
    WHEN 18 THEN 'Naveen@123'
    WHEN 19 THEN 'Pooja@123'
    WHEN 20 THEN 'Vignesh@123'
    WHEN 21 THEN 'Aishwarya@123'

END
WHERE user_id BETWEEN 1 AND 21;