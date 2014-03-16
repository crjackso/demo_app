json.array!(@participants) do |participant|
  json.extract! participant, :first_name, :last_name, :email
  json.url participant_url(participant, format: :json)
end