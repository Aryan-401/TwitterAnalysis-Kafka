# Twitter "Real Time" Analysis

Since the Twitter API is paid now, I decided to try to make a "real time" stream of tweets by using a dataset and occasionally sending data from it using Apache Kafka to be altered and finally be stored in a database. 

I had origianlly found the dataset on Kaggle and after transforming it, I uploaded it to my Postgres database. I then used the `psycopg2` library to connect to the database and query it.

I used DBeaver to query the database and find insights

