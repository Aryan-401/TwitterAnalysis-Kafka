select concat(sentiment_simplified, ' - ',count(case when content like '%@%' then 1 end)) as mentions
  from sentiments s 
  group by sentiment_simplified 