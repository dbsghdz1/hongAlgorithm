-- 코드를 입력하세요
SELECT a.food_type, a.rest_id, a.rest_name, a.favorites
from rest_info a
join (
    select food_type, max(favorites) as max_fav
    from rest_info
    group By food_type
) b
on a.food_type = b.food_type
and a.favorites = b.max_fav
order by a.food_type desc
