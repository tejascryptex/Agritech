json.extract! listing, :id, :title, :description, :price, :location, :crop_id, :user_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
