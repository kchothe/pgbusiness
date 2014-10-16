json.array!(@contact_phones) do |contact_phone|
  json.extract! contact_phone, :id, :PhoneNumber, :PhoneNumberType, :CreatedBy, :CreatedDate, :ModifiedBy, :ModifiedDate
  json.url contact_phone_url(contact_phone, format: :json)
end
