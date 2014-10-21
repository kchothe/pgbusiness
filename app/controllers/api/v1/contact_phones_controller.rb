class Api::V1::ContactPhonesController < Api::V1::ApiController
	
	def index
		@contact_phones = ContactPhone.all
		render json: @contact_phones
	end

	def create
		
  end

end 