-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 social.db
-- 2. Load this script: .read tasks.sql
-- 3. Exit SQLite: .exit
select * from posts where deleted=1;
select * from users where username like 'a%';
select users.username, posts.content from users join posts on users.id = posts.user_id where posts.content like '%small%';
select users.username, posts.content, posts.created_on from users join posts on users.id = posts.user_id where posts.deleted = 0 order by posts.created_on ASC;
select users.username, COUNT(posts.id) from users join posts on users.id = posts.user_id group by users.id, users.username;
select users.username, COUNT(posts.id) from users join posts on users.id = posts.user_id group by users.id, users.username having COUNT(posts.id) > 9;
select users.username, COUNT(follows.followed_user_id) from users join follows on users.id = follows.following_user_id group by users.id, users.username;
select users.username, COUNT(follows.following_user_id) from users join follows on users.id = follows.followed_user_id group by users.id, users.username order by COUNT(follows.following_user_id) DESC limit 5;
select users.username,users2.username from follows join users on users.id = follows.following_user_id join users as users2 on users2.id = follows.followed_user_id;

