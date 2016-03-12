json.array!(@stores_reviews) do |stores_review|
  json.extract! stores_review, :id, :liked, :critic, :user_id, :store_id
  json.url stores_review_url(stores_review, format: :json)
end
