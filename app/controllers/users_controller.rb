class UsersController < ApplicationController
    def index
        users =User.all
        render json: users
    end
    
    def create 
        @user = User.create(user_params)

        if @user.valid?
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}, status: :ok
        else
            render json: {error: "invalid username or password"}, status: :unprocessable_entity
        end

    end

    def login
        @user = User.find_by(email: user_params[:email])

        if @user && @user.authenticate(user_params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}, status: :ok
        else
            render json: {error: "Invalid username or password"}, status: :unprocessable_entity
        end
    end

    private
    

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
