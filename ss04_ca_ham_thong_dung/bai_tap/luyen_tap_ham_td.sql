-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.--
select * from `subject`
having Credit >= all(select Credit from `subject`);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất. --
select SubName, mark.mark 
from mark
join `subject` on `subject`.SubId = mark.SubId
having mark.mark >= all(select mark.mark from mark
join `subject` on `subject`.SubId = mark.SubId);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần --
select studentName, address, phone, avg(mark.mark) as avgmark
from student 
join mark on student.StudentId = mark.StudentId
group by studentName, Address, Phone
order by avgmark;
