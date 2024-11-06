Meta/Facebook Messenger stores the number of messages between users in a table named 'fb_messages'. In this table 'user1' is the sender, 'user2' is the receiver, and 'msg_count' is the number of messages exchanged between them.
Find the top 10 most active users on Meta/Facebook Messenger by counting their total number of messages sent and received. Your solution should output usernames and the count of the total messages they sent or received
Approach
-----------
I combined the Sent and Received Messages.I pull the data from fb_messages twice.First, I select user1 (the sender) and the message count (msg_count).Then, using UNION ALL,I add rows for user2 (the receiver) and their message count.This way, each user will have entries for both sent and received messages.

Aggregating Message Counts:
In the subquery (a), group by username and calculate the total messages by summing up msg_count. This gives each user’s total message activity.

Sorting and Limiting to Top 10:
After aggregating, I sort the total message count in descending order. Then select only the top 10 users.

Final Output:
This query outputs the username and their total_msg_count, ordered by activity
  
solution
--------
with sq as (SELECT username, 
    sum(msg_count) as total_msg_count order by sum(msg_count) desc 
FROM 
    (SELECT 
        user1 as username,
        msg_count
    FROM fb_messages
    
    UNION ALL 
    
    SELECT 
        user2 as username,
        msg_count
    FROM fb_messages) a
GROUP BY username)
select username,  total_msg_count from  sq
where rank <= 10
ORDER BY total_msg_count DESC;
