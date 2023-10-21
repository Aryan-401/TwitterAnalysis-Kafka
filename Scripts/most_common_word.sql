SELECT  sentiment_simplified, word, COUNT(*) as word_count
FROM (
    SELECT sentiment_simplified, word
    FROM (
        SELECT sentiment_simplified, regexp_split_to_table(content, '\s') as word
        FROM sentiments
        WHERE sentiment_simplified IN ('positive', 'negative')
    ) AS words
    WHERE lower(word) NOT IN (
        'i', 'me', 'my', 'myself', 'we', 'our', 'ours', 'ourselves', 'you', 'your', 'yours', 'yourself', 'yourselves',
        'he', 'him', 'his', 'himself', 'she', 'her', 'hers', 'herself', 'it', 'its', 'itself', 'they', 'them', 'their',
        'theirs', 'themselves', 'what', 'which', 'who', 'whom', 'this', 'that', 'these', 'those', 'am', 'is', 'are',
        'was', 'were', 'be', 'been', 'being', 'have', 'has', 'had', 'having', 'do', 'does', 'did', 'doing', 'a', 'an',
        'the', 'and', 'but', 'if', 'or', 'because', 'as', 'until', 'while', 'of', 'at', 'by', 'for', 'with', 'about',
        'against', 'between', 'into', 'through', 'during', 'before', 'after', 'above', 'below', 'to', 'from', 'up',
        'down', 'in', 'out', 'on', 'off', 'over', 'under', 'again', 'further', 'then', 'once', 'here', 'there', 'when',
        'where', 'why', 'how', 'all', 'any', 'both', 'each', 'few', 'more', 'most', 'other', 'some', 'such', 'no', 'nor',
        'not', 'only', 'own', 'same', 'so', 'than', 'too', 'very', 's', 't', 'can', 'will', 'just', 'don', 'don''t',
        'should', 'should’ve', 'now', 'd', 'll', 'm', 'o', 're', 've', 'y', 'ain', 'aren', 'aren''t', 'couldn', 'couldn''t',
        'didn', 'didn''t', 'doesn', 'doesn''t', 'hadn', 'hadn''t', 'hasn', 'hasn''t', 'haven', 'haven''t', 'isn', 'isn''t', 'ma',
        'mightn', 'mightn''t', 'mustn', 'mustn''t', 'needn', 'needn''t', 'shan', 'shan''t', 'shouldn', 'shouldn''t', 'wasn',
        'wasn''t', 'weren', 'weren''t', 'won', 'won''t', 'wouldn', 'wouldn''t', 'i''m', 'you''re', 'you''ve', 'you''ll', 'you''d',
        'he''s', 'she''s', 'it''s', 'we''re', 'they''re', 'i''ve', 'you''ve', 'we''ve', 'they''ve', 'i''ll', 'you''ll', 'he''ll', 'she''ll',
        'it''ll', 'we''ll', 'they''ll', 'i''d', 'you''d', 'he''d', 'she''d', 'it''d', 'we''d', 'they''d'
    ) and length(word) > 0
) AS filtered_words
GROUP BY sentiment_simplified, word
ORDER BY word_count DESC
LIMIT 10;
