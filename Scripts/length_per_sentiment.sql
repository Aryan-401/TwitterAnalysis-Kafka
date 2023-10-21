SELECT sentiment, sentiment_simplified , AVG(LENGTH(content)) as avg_tweet_length
FROM sentiments
GROUP BY sentiment, sentiment_simplified
order by sentiment_simplified 
