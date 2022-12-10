class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :contact_type
  belongs_to :user
end
