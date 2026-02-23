-- 코드를 입력하세요
SELECT a.category as category, sum(b.sales) as total_sales
from book a
    join book_sales b
    on a.book_id = b.book_id
where b.sales_date >= '2022-01-01' and b.sales_date < '2022-02-01'
group by a.category
order by a.category
# where b.sales_date >= '2022-01-01' and b.sales_date < '2022-02-01'

