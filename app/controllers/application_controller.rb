class ApplicationController < ActionController::API
    def current_user
        token = request.headers['auth-token']
        return nil unless token
        payload = JWT.decode(token, ENV['HANDSHAKE']).first
        User.find_by(id: payload['user_id'])
    end

    def authorize!
        unless current_user
            render json: { errors: ['You are not logged in.'] },
                status: :unauthorized
        end
    end

    def cors_set_access_control_headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, PATCH, OPTIONS'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end
end
