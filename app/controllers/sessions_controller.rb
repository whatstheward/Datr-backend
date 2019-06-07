class SessionsController < ApplicationController

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
        ## send back a token using JWT
        token = JWT.encode({ user_id: @user.id }, ENV['HANDSHAKE'], 'HS256')
        render json: { token: token, user: @user.username }, status: :ok
        else
        ## send back some angry json response
        render json: { errors: ["Incorrect email or password"] },
                status: :unauthorized
        end
    end
    
end
