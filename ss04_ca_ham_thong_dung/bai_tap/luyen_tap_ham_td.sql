select * from `subject`
having Credit >= all(select Credit from `subject`);
select SubName, mark.mark 
from mark
join `subject` on `subject`.SubId = mark.SubId
having mark.mark >= all(select mark.mark from mark
join `subject` on `subject`.SubId = mark.SubId);
select studentName, address, phone, avg(mark.mark) as avgmark
from student 
join mark on student.StudentId = mark.StudentId
group by studentName, Address, Phone
order by avgmark;
