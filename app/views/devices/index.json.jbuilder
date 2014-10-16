json.array!(@devices) do |device|
  json.extract! device, :id, :UserPhoneNumber, :OEMId, :OS, :Lat, :Lng, :CreatedBy, :CreatedDate, :ModifiedBy, :ModifiedDate
  json.url device_url(device, format: :json)
end
