
class UsersController < ApplicationController

    def index 
        @users = User.all
        # delete serializers
        render json: @users, root:"users", each_serializer: UserSerializer
    end

    def create 
        @user = User.new()
        # params[:genders].each{|gender| gendegenrInfo = Gender.find(gender.id) @user.genders << genderInfo}
        # params[:orientations].each{|orientation| orientationInfo = Orientation.find(orientation.id) @user.orientations << orientationInfo}
        # params[:pronouns].each{|pronoun| pronounInfo = Pronoun.find(orientation.id) @user.pronounss << pronounInfo}
        byebug
        if @user.save
            render json: @user, status: :ok, serializer: UserSerializer
        end
    end

    private 

    def user_params
       permitted = params.permit(:username, :first_name, :last_name, :email, :age, :zip_code, genders:[], orientations:[], pronouns:[])
    end
end
