class TransactionSerializer
  include JSONAPI::Serializer
  attributes :withdrawal, :deposit, :user_id, :amount, :currency
end
