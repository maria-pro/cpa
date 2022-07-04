# search, sort, and filter tweets with a specific hashtag (or any keyword).


# Configure variables: number of tweets to download and hashtag search query
num_tweets_to_download <- 200
hashtag_to_search <- "#rstudioconf"
# Make sure to install any packages listed below that you don't already have on your system:
library("rtweet")
library("reactable")
library("glue")
library("stringr")
library("httpuv")
library("tivyverse")

# Code to actually search for tweets

tweet_df <- search_tweets(hashtag_to_search, n = num_tweets_to_download, include_rts = FALSE)
# select a few desired columns and add a clickable link to tweet text for table data
tweet_table_data <- tweet_df %>%
  select(user_id, status_id, created_at, screen_name, text, favorite_count, retweet_count, urls_expanded_url) %>%
  mutate(
    Tweet = glue::glue("{text} <a href='https://twitter.com/{screen_name}/status/{status_id}'>>> </a>")
  )%>%
  select(DateTime = created_at, User = screen_name, Tweet, Likes = favorite_count, RTs = retweet_count, URLs = urls_expanded_url)


#make URLs in the tweet URL column clickable
