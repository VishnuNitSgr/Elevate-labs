CREATE VIEW top_posts AS
SELECT 
    p.post_id,
    u.username,
    p.content,
    p.like_count
FROM posts p
JOIN users u ON p.user_id = u.user_id
ORDER BY p.like_count DESC;

CREATE VIEW engagement_score AS
SELECT 
    p.post_id,
    COUNT(DISTINCT l.like_id) + COUNT(DISTINCT c.comment_id) AS engagement
FROM posts p
LEFT JOIN likes l ON p.post_id = l.post_id
LEFT JOIN comments c ON p.post_id = c.post_id
GROUP BY p.post_id;