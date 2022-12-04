class UsersController < ApplicationController
    # GET /users    ==> Get all users from the db
    def index
        users =User.all
        render json: users
    end

    # GET /users/:id   ==> Display userd  by Id
    def show
        user = user_by_id
        render json: user
    end

    # POST /users    ==> Add userd to db or Create User
    def create 
        user = User.create!(user_params)
        render json: user, status: :created
    end

    private

    # Find User By Id Method
    def user_by_id
        user = User.find(params[:id])
    end

    # Add User Parameters
    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end
end
