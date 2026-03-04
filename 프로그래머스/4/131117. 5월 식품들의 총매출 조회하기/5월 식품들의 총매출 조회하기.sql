-- 코드를 입력하세요
SELECT a.product_id, a.product_name, sum(b.amount * a.price) as total_sale
from food_product a
join (
   select produce_date, product_id, amount
    from food_order
    where year(produce_date) = 2022 and month(produce_date) = 5
) b
on a.product_id = b.product_id
group by a.product_name
order by total_sale desc, product_id