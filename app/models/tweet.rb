class Tweet < ApplicationRecord
  def self.sync(query)
    Tweet.destroy_all
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = 'O34WDDLpLpaCo8lqCIRUXE4K7'
      config.consumer_secret     = 'SB4L9d5SdMxykZgZ1IZMY8kpBIXSW6VmCVqUiH4vA4L3FS4Bk8'
      config.access_token        = '701829520551063553-vJv9Ei5ZXdqLmj8U2FBSj6RR0423NZs'
      config.access_token_secret = 'GS4sSFMxpJxP3DcfqGwlmFmqD8FqgB2VWx6eHHOcwOmlq'
    end
    client.search(query).each do |tweet|
      create(body: tweet.text)

    end
  end

  before_save :set_sentiment, if: :body_changed?

  scope :positive, ->{ where(sentiment: :positive) }
  scope :neutral,  ->{ where(sentiment: :neutral) }
  scope :negative, ->{ where(sentiment: :negative) }


  def set_sentiment
    self.sentiment = $analyzer.sentiment(body)
    self.score     = $analyzer.score(body)
  end
end
