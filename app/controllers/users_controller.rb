class UsersController < ApplicationController

def create 
    user_params = User.create!(user_params)
    render json: user_params, status: :create
end


    private

    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end
end
