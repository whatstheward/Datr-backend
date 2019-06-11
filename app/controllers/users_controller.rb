
class UsersController < ApplicationController

    def index 
        @users = User.all
    end

    def show
        @user = User.find(params[:id].to_i)
    end

    def create 
        byebug
        @user = User.new(username: params['username'], first_name: params['first_name'], 
        last_name: params['last_name'], email: params['email'], 
        age: params['age'], image: params['image'], password: params['password'], zip_code: params['zip_code'])
        if params[:genders]
        params[:genders].each do 
            |gender| genderInfo = Gender.find(gender) 
            @user.genders << genderInfo
            end
        end
        if params[:orientations]
        params[:orientations].each do 
            |orientation| orientationInfo = Orientation.find(orientation) 
            @user.orientations << orientationInfo
            end
        end
        if params[:pronouns]
        params[:pronouns].each do 
            |pronoun| pronounInfo = Pronoun.find(pronoun) 
            @user.pronouns << pronounInfo
            end
        end
        if params[:interests]
        params[:interests].each do 
            |interest| interestInfo = Interest.find(interest) 
            @user.interests << interestInfo
            end
        end
        if @user.save
            if params[:partners]
                params[:partners].each do 
                    |partner| partnerInfo = User.find(partner) 
                    @user.partners << partnerInfo
                    end
                    token = JWT.encode({ user_id: @user.id }, ENV['HANDSHAKE'], 'HS256')
                    render json: { token: token }, status: :ok
                end
        end
    end

    private 

    def user_params
    params.permit(:username, :first_name, :last_name, :email, :image, :age, :password, :zip_code, genders:[], orientations:[], pronouns:[])
    end
end