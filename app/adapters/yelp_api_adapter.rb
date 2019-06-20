require "json"
require "http"
require 'pry'

API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
API_KEY = ENV["YELP_API"]
DEFAULT_LOCATION = "Atlanta, GA"
SEARCH_LIMIT = 50


class YelpApiAdapter
  
    def search(categories, location="Atlanta")
      url = "#{API_HOST}#{SEARCH_PATH}"
      params = {
        term: categories,
        location: location,
        limit: SEARCH_LIMIT
      }
      response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
      response.parse["businesses"]
    end
  
    def self.business_reviews(business_id)
      url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}/reviews"
      response = HTTP.auth("Bearer #{API_KEY}").get(url)
      response.parse["reviews"]
    end
    
    def business(business_id)
      url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}"
      response = HTTP.auth("Bearer #{API_KEY}").get(url)
      response.parse
    end
    
  end