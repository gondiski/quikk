class TopupSerializer
  include JSONAPI::Serializer
  attributes :amount, :phone_number
end
