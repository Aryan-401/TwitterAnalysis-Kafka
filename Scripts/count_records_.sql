SELECT
    user_id,
    COUNT(CASE WHEN sentiment_simplified = 'positive' THEN 1 END) AS positive_count,
    COUNT(CASE WHEN sentiment_simplified = 'neutral' THEN 1 END) AS neutral_count,
    COUNT(CASE WHEN sentiment_simplified = 'negative' THEN 1 END) AS negative_count,
    count(*) as total
FROM
    Sentiments
GROUP BY
    user_id;