-- 1. Loyal User Reward (Oldest users):
# single line comment also csn be done using hash . 
SELECT * FROM users 
ORDER BY created_at ASC
 LIMIT 5;
 
 -- 2.Inactive User Engagement (Users who posted 0 photos):
SELECT * FROM users 
WHERE id NOT IN (
			SELECT DISTINCT user_id FROM photos
);
-- 3.Contest Winner (Most likes on a single photo):

SELECT photos.id AS photo_id, users.username, COUNT(*) AS total_likes
FROM likes
JOIN photos ON photos.id = likes.photo_id
JOIN users ON users.id = photos.user_id
GROUP BY likes.photo_id
ORDER BY total_likes DESC
LIMIT 1;

-- 4.Top 5 Hashtags:

SELECT tags.tag_name, COUNT(*) AS count
FROM photo_tags
JOIN tags ON tags.id = photo_tags.tag_id
GROUP BY tags.tag_name
ORDER BY count DESC
LIMIT 5;

-- 5.Best Day for Ad Campaign (Day when most users registered):

SELECT DAYNAME(created_at) AS day, COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 1;
-- 6. Average Posts Per User:
SELECT ROUND(COUNT(*) / (SELECT COUNT(*) FROM users), 2) AS avg_posts_per_user
FROM photos;
-- 7.Bot Detection (Users who liked every photo):

SELECT user_id
FROM likes
GROUP BY user_id
HAVING COUNT(*) = (SELECT COUNT(*) FROM photos);



