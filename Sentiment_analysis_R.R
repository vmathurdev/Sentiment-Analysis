
#  Install Requried Packages
install.packages("SnowballC")
install.packages("tm")
install.packages("twitteR")
install.packages("syuzhet")

# Load Requried Packages
library("SnowballC")
library("tm")
library("twitteR")
library("syuzhet")

consumer_key <-
consumer_secret <- 
access_token <- 
access_secret <- 

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
tweets <- userTimeline("Avilok137", n=10)

n.tweet <- length(tweets)

tweets.df <- twListToDF(tweets) 

head(tweets.df)
head(tweets.df$text)

tweets.df2 <- gsub("http.*","",tweets.df$text)

tweets.df2 <- gsub("https.*","",tweets.df2)

tweets.df2 <- gsub("#.*","",tweets.df2)

tweets.df2 <- gsub("@.*","",tweets.df2)

head(tweets.df$text)

word.df <- as.vector(tweets.df2)

emotion.df <- get_nrc_sentiment(word.df)

emotion.df2 <- cbind(tweets.df2, emotion.df) 

head(emotion.df2)

sent.value <- get_sentiment(word.df)

most.positive <- word.df[sent.value == max(sent.value)]

most.negative <- word.df[sent.value <= min(sent.value)] 
most.negative 
sent.value
positive.tweets <- word.df[sent.value > 0]
head(positive.tweets)
negative.tweets <- word.df[sent.value < 0]
head(negative.tweets)
neutral.tweets <- word.df[sent.value == 0]
head(neutral.tweets)
# Alternate way to classify as Positive, Negative or Neutral tweets

category_senti <- ifelse(sent.value < 0, "Negative", ifelse(sent.value > 0, "Positive", "Neutral"))
category_senti2 <- cbind(tweets,category_senti,senti) > head(category_senti2)
tweets category_senti senti

table(category_senti)
category_senti
Negative Neutral Positive

