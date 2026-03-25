/* Ranking posts based on likes */

SELECT 
    p.post_id,
    p.content,
    p.like_count,
    RANK() OVER (ORDER BY p.like_count DESC) AS rank
FROM posts p;


/* User engagement report */

SELECT 
    u.username,
    COUNT(DISTINCT p.post_id) AS total_posts,
    COUNT(DISTINCT l.like_id) AS total_likes,
    COUNT(DISTINCT c.comment_id) AS total_comments
FROM users u
LEFT JOIN posts p ON u.user_id = p.user_id
LEFT JOIN likes l ON p.post_id = l.post_id
LEFT JOIN comments c ON p.post_id = c.post_id
GROUP BY u.username;