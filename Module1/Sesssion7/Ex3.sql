--part1--
explain analyze select *from post
where is_public=true and lower(content)='đây là nội dung của bài viết thứ 290000';

create index idx_content on post(lower(content));

--part2--
EXPLAIN ANALYZE SELECT * FROM post
WHERE tags @> ARRAY['travel'];
drop index idx_tags;
create index idx_tags on post using gin(tags);

--part3--
CREATE INDEX idx_post_recent_public
    ON post(created_at DESC)
    WHERE is_public = TRUE;

EXPLAIN ANALYZE
SELECT * FROM post
WHERE is_public = TRUE
  AND created_at >= NOW() - INTERVAL '7 days';

--part4--
create index idx_composite on post(user_id,created_at desc);

drop index idx_composite;

EXPLAIN ANALYZE
SELECT * FROM post
WHERE user_id < 1000
  AND created_at >= NOW() - INTERVAL '7 days';


