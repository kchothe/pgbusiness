json.array!(@contacts) do |contact|
  json.extract! contact, :id, :ContactName, :CreatedBy, :CreatedDate, :ModifiedBy, :ModifiedDate
  json.url contact_url(contact, format: :json)
end
