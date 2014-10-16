class Api::V1::DevicesController < Api::V1::ApiController
	
	def index
		@devices = Device.all
		render json: @devices
	end

	def create
    # binding.pry
    @oemid = Device.find_by(OEMId: params[:OEMID])
    @userphonenumber = Device.find_by(UserPhoneNumber: params[:UserPhoneNumber])
        
    if (!@oemid.nil? && !@userphonenumber.nil? )
      @oemid.update_attributes(updated_at: Time.now)
    else
      device = Device.new
      device.UserPhoneNumber = params[:UserPhoneNumber]
      device.OEMId = params[:OEMID]
      device.OS = params[:OS]
      device.Lat = params[:latitude]
      device.Lng = params[:longitude]
      device.CreatedBy = params[:UserPhoneNumber]
      device.ModifiedBy = params[:UserPhoneNumber]
      if device.save
        respond_with(device, :location => api_v1_device_path(device))
      end
    end
  end

end 