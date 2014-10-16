json.array!(@businesses) do |business|
  json.extract! business, :id, :BusinessName, :BusinessType, :BusinessPhone, :CityListingId, :CreatedBy, :CreatedDate
  json.url business_url(business, format: :json)
end
