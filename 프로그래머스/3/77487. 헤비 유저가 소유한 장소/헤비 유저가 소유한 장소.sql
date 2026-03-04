# select b.id, b.name, b.host_id
# from places a
# join places b
# on a.id = b.id
# where b.id = a.id 
# group by a.host_id
# having count(*) >= 2

select b.id, b.name, b.host_id
from (
    select host_id
    from places
    group by host_id
    having count(*) >= 2
) a
join places b
on a.host_id = b.host_id

