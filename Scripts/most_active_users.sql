SELECT user_id, COUNT(*)  as tweet_count
FROM sentiments s 
GROUP BY user_id
ORDER BY tweet_count DESC
LIMIT 10;
