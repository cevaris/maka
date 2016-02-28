json.array!(@activities) do |activity|
  json.extract! activity, :id, :creator_id, :title, :slug, :description
  json.url activity_url(activity, format: :json)
end
