class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    skip_before_action :authorized, only: [:create]
    # GET /users    ==> Get all users from the db
    def index
        users =User.all
        render json: users
    end

    # GET /users/:id   ==> Display userd  by Id
    def show
        user = user_by_id
        render json: user, status: :ok
    rescue ActiveRecord::RecordNotFound
        render_not_found_response
    end

    # for the user that is logged in?
    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
      end

      
    # POST /users    ==> Add userd to db or Create User
    def create 
         user = User.create!(user_params)
        # # session[:user_id] = user.id  
        # render json: user, status: :created


        # added new code 
        if user.valid?
            @token = encode_token(user_id: @user.id)
            render json: { user: UserSerializer.new(user), jwt: @token }, status: :created
          else
            render json: { error: 'failed to create user' }, status: :unprocessable_entity
          end
    end

    private
    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

    # Find User By Id Method
    def user_by_id
        user = User.find(params[:id])
    end

    # Add User Parameters
    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end
    
    def render_not_found_response
        render json: { error: "User Does not Exist" }, status: :not_found
    end
end
