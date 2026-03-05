-- 코드를 입력하세요
SELECT a.author_id, a.author_name, b.category, sum(c.sales * b.price) as total_sales
from author a
join book b
on a.author_id = b.author_id
join (
    select sum(sales) as sales, book_id, sales_date
    from book_sales
    where date(sales_date) >= '2022-01-01' and date(sales_date) < '2022-02-01'
    group by book_id
) c
on b.book_id = c.book_id
group by b.category, a.author_id
order by a.author_id asc, b.category desc