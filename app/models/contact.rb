class Contact < ApplicationRecord
    # validates :email, presence: true, uniqueness: true
    # validates :phone, presence: true, uniqueness: true
    belongs_to :user
end
