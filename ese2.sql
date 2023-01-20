--GROUP BY
--1. Contare quanti iscritti ci sono stati ogni anno
SELECT year(enrolment_date), COUNT(*)
FROM students 
GROUP BY year(enrolment_date);

--2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT office_address, COUNT(*)
FROM teachers
GROUP BY office_address;

--3. Calcolare la media dei voti di ogni appello d'esame
SELECT exam_id, avg(vote)
FROM exam_student
GROUP BY exam_id

--4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT department_id, COUNT(*) AS corsi_di_laurea
FROM degrees
GROUP BY department_id;


--JOIN
-- -- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT students.*
FROM students
  JOIN degrees
    ON students.degree_id = degrees.id
WHERE degrees.name LIKE 'Corso di Laurea in Economia';

-- -- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT * 
FROM degrees
  JOIN departments
    ON degrees.department_id = departments.id
WHERE degrees.level LIKE 'magistrale'
AND departments.name LIKE 'Dipartimento di Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT teachers.name,teachers.surname,courses.*
FROM teachers
  JOIN course_teacher
    ON course_teacher.teacher_id = teachers.id  
  JOIN courses
    ON course_teacher.course_id = courses.id
WHERE teachers.id = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT * 
FROM students
  JOIN degrees
    ON students.degree_id = degrees.id
  JOIN departments
    ON degrees.department_id = departments.id
ORDER BY students.surname,students.name;


