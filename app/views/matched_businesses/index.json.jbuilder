json.array!(@matched_businesses) do |matched_business|
  json.extract! matched_business, :id, :contact_phone_id, :business_id, :IsRecommended, :CreatedBy, :CreatedDate, :ModifiedBy, :ModifiedDate
  json.url matched_business_url(matched_business, format: :json)
end
