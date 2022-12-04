class UserSerializer < ActiveModel::Serializer
  # Implimenting serialization
  attributes :id, :username, :email
end
