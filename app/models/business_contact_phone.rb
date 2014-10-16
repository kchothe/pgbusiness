class BusinessContactPhone < ActiveRecord::Base
	belongs_to :business 
	belongs_to :contact_phone
end
