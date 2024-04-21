class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :password_digest, :api_key
end
