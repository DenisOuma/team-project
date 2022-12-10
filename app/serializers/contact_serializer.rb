class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :contact_type, :phone
  has_one :user
end
