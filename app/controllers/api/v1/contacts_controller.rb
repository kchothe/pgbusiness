class Api::V1::ContactsController < Api::V1::ApiController
	def index
		@contacts = Contact.all
		render json: @contacts
	end

	def create
		session[:device_id] = nil
		set_device_id
		@device = Device.find(session[:device_id])
		if params["_json"][0][:name] == "unknown"
			params["_json"].each do |callhistory|
				if ContactPhone.exists?(:PhoneNumber => callhistory[:number])
				else
					@contact = Contact.new
					@contact.ContactName = callhistory[:name]
					@contact.CreatedBy = @device.UserPhoneNumber
					@contact.ModifiedBy = @device.UserPhoneNumber
					@contact.save

					@contact_phone = ContactPhone.new
					@contact_phone.contact_id = @contact.id
					@contact_phone.PhoneNumber = callhistory[:number]
					@contact_phone.PhoneNumberType = callhistory[:type]
					@contact_phone.CreatedBy = @device.UserPhoneNumber
					@contact_phone.ModifiedBy = @device.UserPhoneNumber
					@contact_phone.save

				end
			end

		else
			params["_json"].each do |contact|
				count = 0
				if Contact.exists?(:ContactName => contact[:name][:givenName])
					contact[:phoneNumbers].each do|pnum|
						if ContactPhone.exists?(:PhoneNumber => pnum[:value].gsub('-','').gsub(' ',''))
						else
							count = count + 1
						end
					end
				else
					count = count + 1
				end
				if count > 0
					@contact = Contact.new
					@contact.ContactName = contact[:name][:givenName]
					@contact.device_id = session[:device_id]
					@contact.CreatedBy = @device.UserPhoneNumber
					@contact.ModifiedBy = @device.UserPhoneNumber
					@contact.save
				end
				if Contact.exists?(:ContactName => contact[:name][:givenName])
					contact[:phoneNumbers].each do|pnum|
						
						if ContactPhone.exists?(:PhoneNumber => pnum[:value].gsub('-','').gsub(' ',''))
						else
							@contact_phone = ContactPhone.new
							@contact_phone.PhoneNumber = pnum[:value].gsub('-','').gsub(' ','')
							@contact_phone.PhoneNumberType = pnum[:type]
							@contact_phone.contact_id = @contact.id
							@contact_phone.CreatedBy = @device.UserPhoneNumber
							@contact_phone.ModifiedBy = @device.UserPhoneNumber
							@contact_phone.save
						end
					end
				else
					contact[:phoneNumbers].each do|pnum|
						
						if ContactPhone.exists?(:PhoneNumber => pnum[:value].gsub('-','').gsub(' ',''))
						else
							@contact_phone = ContactPhone.new
							@contact_phone.PhoneNumber = pnum[:value].gsub('-','').gsub(' ','')
							@contact_phone.PhoneNumberType = pnum[:type]
							@contact_phone.contact_id = @contact.id
							@contact_phone.CreatedBy = @device.UserPhoneNumber
							@contact_phone.ModifiedBy = @device.UserPhoneNumber

							@contact_phone.save
						end
					end	
				end
				
			end
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