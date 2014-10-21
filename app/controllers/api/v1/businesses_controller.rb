class Api::V1::BusinessesController < Api::V1::ApiController
	def index
		@businesses = Business.all
		render json: @businesses
	end

	def create
    session[:device_id] = nil
    set_device_id
    @device = Device.find(session[:device_id])
   
    params[:locations].each do|loc|
      if Business.exists?(:CityListingId => loc[:id])
        @business = Business.find_by(CityListingId: loc[:id])
      else
        @business = Business.new
        @business.BusinessName = loc[:name]
        @business.BusinessType = loc[:markets][0]
        @business.BusinessPhone = loc[:contact_info][:display_phone]
        @business.CityListingId = loc[:id]
        @business.CreatedBy = @device.UserPhoneNumber
        @business.save
      end
      @phonenumber = ContactPhone.find_by(PhoneNumber: @business.BusinessPhone)
      @business_contact = BusinessContactPhone.new
      @business_contact.business_id = @business.id
      @business_contact.contact_phone_id = @phonenumber.id
      @business_contact.IsRecommended = true
      @business_contact.CreatedBy = @device.UserPhoneNumber
      @business_contact.ModifiedBy = @device.UserPhoneNumber
      @business_contact.save
    end
  end

  def set_device_id
    if Device.count > 0
      @device_created = Device.order("created_at").last.created_at
      @device_updated = Device.order("updated_at").last.updated_at
           
      if @device_updated > @device_created
        session[:device_id] = Device.order("updated_at").last.id
      else
        session[:device_id] = Device.order("created_at").last.id
      end
      
    end
  end

end 