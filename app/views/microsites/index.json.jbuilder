json.array!(@microsites) do |microsite|
  json.extract! microsite, :id, :name
  json.url microsite_url(microsite, format: :json)
end
