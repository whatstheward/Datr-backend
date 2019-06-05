class GendersController < ApplicationController

    def index 
        @genders = Gender.all
        render json: @genders, status: :ok
    end
end
