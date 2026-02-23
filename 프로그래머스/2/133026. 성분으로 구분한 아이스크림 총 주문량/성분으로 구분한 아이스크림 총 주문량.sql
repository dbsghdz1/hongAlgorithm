-- 코드를 입력하세요
SELECT b.ingredient_type, sum(a.total_order)
from first_half a
    join icecream_info b
    on b.flavor = a.flavor
group by b.ingredient_type