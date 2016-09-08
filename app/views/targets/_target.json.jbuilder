json.extract! target, :id, :name, :description, :points, :mines, :count, :last_action, :created_at, :updated_at
json.url target_url(target, format: :json)