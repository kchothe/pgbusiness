class Api::V1::ContactPhonesController < Api::V1::ApiController
	# skip_before_filter :authenticate_user!
	def index
		# binding.pry
		@contact_phones = ContactPhone.all
		render json: @contact_phones
	end

	def create
		
    end

end 