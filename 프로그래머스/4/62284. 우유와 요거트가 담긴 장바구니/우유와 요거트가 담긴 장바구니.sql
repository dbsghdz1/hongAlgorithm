-- 코드를 입력하세요
SELECT cart_id
from cart_products
group by cart_id
having count(
    distinct case
    when name = 'yogurt' then 'yogurt'
    when name = 'milk' then 'milk'
    else null
    end
) = 2