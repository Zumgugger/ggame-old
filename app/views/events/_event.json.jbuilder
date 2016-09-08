json.extract! event, :id, :time, :actor_id, :option_id, :noticed, :points_set, :target_group_id, :target_id, :description, :created_at, :updated_at
json.url event_url(event, format: :json)