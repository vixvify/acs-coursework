use university;

select title 
from course
where credits = 3 
and course_id in
(select course_id 
from course 
where dept_name = 'Comp. Sci.');

select distinct ID 
from takes
where (course_id, sec_id, semester, year) in
(select course_id, sec_id, semester, year 
from teaches
where ID in (select ID 
from instructor 
where name = 'Einstein'));

select salary 
from instructor 
where salary >= all 
(select salary from instructor);

select ID, name, salary 
from instructor
where salary >= all 
(select salary from instructor);

select s.course_id, s.sec_id, s.semester, s.year,
       (
           select count(*)
           from takes t
           where t.course_id = s.course_id
             and t.sec_id = s.sec_id
             and t.semester = s.semester
             and t.year = s.year
       ) as enrollment
from section s
where s.semester = 'Autumn'
  and s.year = 2017;

select max(enrollment)
from (
    select s.course_id, s.sec_id,
    (
        select count(*)
        from takes t
        where t.course_id = s.course_id
          and t.sec_id = s.sec_id
          and t.semester = s.semester
          and t.year = s.year
    ) as enrollment
    from section s
    where s.semester = 'Autumn'
      and s.year = 2017
) as t;

select s.course_id, s.sec_id, s.semester, s.year
from section s
where s.semester = 'Autumn'
  and s.year = 2017
  and (
      select count(*)
      from takes t
      where t.course_id = s.course_id
        and t.sec_id = s.sec_id
        and t.semester = s.semester
        and t.year = s.year
  ) >= all (
      select (
          select count(*)
          from takes t
          where t.course_id = s2.course_id
            and t.sec_id = s2.sec_id
            and t.semester = s2.semester
            and t.year = s2.year
      )
      from section s2
      where s2.semester = 'Autumn'
        and s2.year = 2017
  );

insert into course (course_id, title, dept_name, credits)
values ('CS-001', 'Weekly Seminar', 'Comp. Sci.', 0);

insert into section (course_id, sec_id, semester, year)
values ('CS-001', 1, 'Autumn', 2017);

insert into takes (ID, course_id, sec_id, semester, year)
select ID, 'CS-001', 1, 'Autumn', 2017
from student
where dept_name = 'Comp. Sci.';

delete from takes
where course_id = 'CS-001'
  and sec_id = 1
  and semester = 'Autumn'
  and year = 2017
  and ID in (
      select ID
      from student
      where name = 'Chavez'
  );

delete from course
where course_id =  'CS-001';

-- ลบไม่ได้ เพราะยังมี section ของวิชา CS-001 อยู่ในระบบ ต้องลบ section ของวิชานี้ออกก่อน ถึงจะลบตัววิชา CS-001 ได้

delete from takes
where course_id in
(
	select course_id 
	from course
    where lower(title) like '%database%' 
)