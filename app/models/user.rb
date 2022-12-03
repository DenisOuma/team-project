class User < ApplicationRecord
    # password=, password_confirmation, authenticate
    has_secure_password 
end
