
class UsersController < ApplicationController
    before_action :authorize!, only: [:show, :search, :destroy]

    def index 
        @users = User.all
    end

    def current_user_login
        @user = User.find(params[:id].to_i)
    end

    def show
        @user = User.find(params[:id].to_i)
    end

    def create 
        
        @user = User.new(username: params['user']['username'], first_name: params['user']['first_name'], 
        last_name: params['user']['last_name'], email: params['user']['email'], 
        age: params['user']['age'], image: params['user']['image'], password: params['user']['password'], zip_code: params['user']['zip_code'])
        if params['user'][:genders]
            params[:user][:genders][:value].each do |gender| 
            
            genderInfo = Gender.find(gender) 
            @user.genders << genderInfo
            end
        end
        if params['user'][:orientations]
            params[:user][:orientations][:value].each do 
            |orientation| orientationInfo = Orientation.find(orientation) 
            @user.orientations << orientationInfo
            end
        end
        if params['user'][:pronouns]
        params['user'][:pronouns][:value].each do |pronoun| 
            pronounInfo = Pronoun.find(pronoun) 
            @user.pronouns << pronounInfo
            end
        end
        if params['user'][:interests]
        params['user'][:interests].each do |interest| 
            interestInfo = Interest.find(interest) 
            @user.interests << interestInfo
            end
        end
        if @user.save
            if params['user'][:partners]
                params['user'][:partners].each do |partner| 
                    partnerInfo = User.find(partner) 
                    Relationship.create(user: @user, partner: partnerInfo, confirmed: 0)
                    end
                end
            token = JWT.encode({ user_id: @user.id }, ENV['HANDSHAKE'], 'HS256')
            render json: { token: token }, status: :ok
        else
            render json: {errors: @user.errors.full_messages}, status: :bad_request
        end
    end

    def search
        @userResults = User.where('first_name LIKE ?', "#{params[:query].titleize}%")
    end

    def destroy
        @user = User.find(params[:id])
        Relationship.where(partner: @user).destroy_all
        Relationship.where(user: @user).destroy_all
        @user.destroy
        render json: ("Your profile has been deleted"), status: :ok
    end

    private 

    def user_params
    params.permit(:username, :first_name, :last_name, :email, :image, :age, :password, :zip_code, genders:[], orientations:[], pronouns:[])
    end
end
