class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :user_id
end
