INSERT INTO users (username, email) VALUES
('prashant', 'p@gmail.com'),
('rahul', 'r@gmail.com'),
('anita', 'a@gmail.com');

INSERT INTO posts (user_id, content) VALUES
(1, 'Hello World!'),
(2, 'SQL is powerful'),
(3, 'Learning databases');

INSERT INTO likes (user_id, post_id) VALUES
(2, 1),
(3, 1),
(1, 2),
(3, 2),
(1, 3);

INSERT INTO comments (user_id, post_id, comment_text) VALUES
(2, 1, 'Nice post!'),
(3, 1, 'Great!'),
(1, 2, 'Agreed!'),
(2, 3, 'Interesting');