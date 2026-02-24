-- 코드를 작성해주세요
select sum(c.score) as score, b.emp_no, b.emp_name, b.position, b.email
from hr_department a
    join hr_employees b on a.dept_id = b.dept_id
    join hr_grade c on b.emp_no = c.emp_no
group by c.emp_no
# having c.year = '2022'
order by score desc
limit 1