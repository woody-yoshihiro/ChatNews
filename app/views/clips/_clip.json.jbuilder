json.extract! clip, :id, :url, :title, :description, :image, :created_at, :updated_at
json.url clip_url(clip, format: :json)
