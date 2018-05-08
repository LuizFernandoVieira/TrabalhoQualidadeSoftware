json.extract! user, :id, :name, :nickname, :phone_number, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
