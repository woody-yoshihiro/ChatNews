json.extract! user_clip, :id, :user_id, :clip_id, :created_at, :updated_at
json.url user_clip_url(user_clip, format: :json)
