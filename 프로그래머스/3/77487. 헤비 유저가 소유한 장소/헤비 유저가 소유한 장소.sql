-- 코드를 입력하세요
SELECT id, name, host_id
from places
where host_id in (
    select host_id
    from places
    group by host_id
    having count(*) >= 2
)
order by id