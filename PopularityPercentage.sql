#100_days_of_coding
hashtag#day22

Find the popularity percentage for each user on Meta/Facebook. The popularity percentage is defined as the total number of friends the user has divided by the total number of users on the platform, then converted into a percentage by multiplying by 100.Output each user along with their popularity percentage. Order records in ascending order by user id.The 'user1' and 'user2' column are pairs of friends.

 
Breakdown
-------------

First, I gathers all unique users from the network (both user1 and user2 columns).
Then, I considers both sides of friendships (if A is friends with B, B is friends with A).
Finally, I counts each user's friendships and calculates their share of the total network, converting it into a percentage.

solution
--------
SELECT user1, COUNT(*) / (SELECT COUNT(DISTINCT user1) FROM (SELECT user1 FROM facebook_friends UNION SELECT user2 FROM facebook_friends) AS users_union) * 100 AS popularity_percent
FROM (SELECT user1, user2 FROM facebook_friends UNION SELECT user2 AS user1, user1 AS user2 FROM facebook_friends) AS users_union
GROUP BY 1
ORDER BY 1;
