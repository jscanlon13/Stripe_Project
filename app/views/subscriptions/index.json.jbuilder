json.array!(@payments) do |payment|
  json.extract! payment, :id, :stripe_token, :amount, :user_id
  json.url payment_url(payment, format: :json)
end
