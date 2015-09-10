json.array!(@contacts) do |contact|
  json.extract! contact, :id, :first_name, :last_name, :number, :address, :address2, :city, :state, :company_id
  json.url contact_url(contact, format: :json)
end
