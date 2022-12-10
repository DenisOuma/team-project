class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, 'secret')
    end

    def decode_token
        # Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMTIzNCJ9.pn_j871SlKckwP22j9pitvNakulBs0GMs09GXo9lNmw
        auth_header = request.headers['Authorization']
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'secret', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end

        end
    end
    def authorized_user
        decode_token = decode_token()
        if decode_token
            user_id = decode_token[0]['user_id']
            @user =User.find_by(id: user_id)
        end
    end

    def authorize
        render json: {message: 'You have to log in.'}, status: :unauthorized unless
        authorized_user
    end
end
