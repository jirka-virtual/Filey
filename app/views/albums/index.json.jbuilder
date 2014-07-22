json.array!(@albums) do |album|
  json.extract! album, :id, :title, :date_from, :date_to
  json.url album_url(album, format: :json)
end
