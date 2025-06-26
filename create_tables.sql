CREATE DATABASE ig_clone;
USE ig_clone;


-- Users Table
CREATE TABLE users (
    id INT AUTO_INCREMENT  PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Photos Table
CREATE TABLE photos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(355) NOT NULL,
    user_id INT NOT NULL,
    created_dat TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

-- Comments Table
CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);

-- Likes Table
CREATE TABLE likes (
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

-- Follows Table
CREATE TABLE follows (
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

-- Tags Table
CREATE TABLE tags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Photo_Tags Junction Table
CREATE TABLE photo_tags (
    photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);
INSERT INTO follows (follower_id, followee_id, created_at) VALUES
(1, 2, '2023-05-01 09:00:00'),
(2, 3, '2023-05-01 10:00:00'),
(3, 1, '2023-05-01 11:00:00'),
(4, 5, '2023-05-02 12:00:00'),
(5, 6, '2023-05-02 13:00:00'),
(6, 7, '2023-05-03 14:00:00'),
(7, 8, '2023-05-03 15:00:00'),
(8, 9, '2023-05-04 16:00:00'),
(9, 10, '2023-05-05 17:00:00'),
(10, 1, '2023-05-06 18:00:00');
INSERT INTO comments (comment_text, user_id, photo_id, created_at) VALUES
('Nice photo!', 2, 1, '2023-05-01 10:05:00'),
('Love this!', 3, 2, '2023-05-01 11:10:00'),
('Amazing shot!', 4, 3, '2023-05-02 12:15:00'),
('So cool!', 5, 4, '2023-05-03 13:20:00'),
('Great angle.', 6, 5, '2023-05-04 14:25:00'),
('What a view!', 7, 6, '2023-05-05 15:30:00'),
('Perfect timing.', 8, 7, '2023-05-06 16:35:00'),
('Incredible!', 9, 8, '2023-05-07 17:40:00'),
('Nice shot!', 10, 9, '2023-05-08 18:45:00'),
('Stunning!', 1, 10, '2023-05-09 19:50:00');

INSERT INTO tags (tag_name, created_at) VALUES
('nature', '2023-05-01 09:00:00'),
('travel', '2023-05-02 10:00:00'),
('sunset', '2023-05-03 11:00:00'),
('food', '2023-05-04 12:00:00'),
('adventure', '2023-05-05 13:00:00'),
('love', '2023-05-06 14:00:00'),
('beach', '2023-05-07 15:00:00'),
('citylife', '2023-05-08 16:00:00'),
('selfie', '2023-05-09 17:00:00'),
('art', '2023-05-10 18:00:00');



