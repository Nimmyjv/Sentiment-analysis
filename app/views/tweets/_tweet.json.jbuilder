json.extract! tweet, :id, :body, :sentiment, :score, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
