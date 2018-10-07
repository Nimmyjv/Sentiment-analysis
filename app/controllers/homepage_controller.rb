require 'net/http'

class HomepageController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index

  end

  def get_tweets
    query = params[:query]
    place = params[:place]
    query_string = "http://maps.google.com/maps/api/geocode/json?address=#{place.gsub(" ", "+")}"
    uri = URI(query_string)
    response = Net::HTTP.get(uri)
    location = ""
    if response
      lat =  JSON.parse(response)["results"].first["geometry"]["location"]["lat"]
      lng =  JSON.parse(response)["results"].first["geometry"]["location"]["lng"]
      location = "#{lat},#{lng},10km"
    end
    Tweet.load(query, location)
    redirect_to tweets_path
  end

  def error
    render plain: "Internet error, please go back"
  end
end
