class YelpApiController < ApplicationController

    def search
        @results = yelp_client.search(params[:query])
        render json: @results
    end

    def business_details
        @result = yelp_client.business(params[:query])
        render json: @result
    end

    def yelp_client
        YelpApiAdapter.new
    end
end
