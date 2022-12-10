class Contact < ApplicationRecord
    validates :email, presence: true
    validates :name, presence: true
    validates :contact_type, presence: true
    validates :phone, presence: true
    belongs_to :user
end
