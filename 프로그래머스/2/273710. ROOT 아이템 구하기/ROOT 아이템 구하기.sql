-- 코드를 작성해주세요
select a.item_id, a.item_name
from item_info a
    join item_tree b
    on a.item_id = b.item_id
where b.parent_item_id is null