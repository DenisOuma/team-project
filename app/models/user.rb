class User < ApplicationRecord
    has_many :contacts
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true

end
