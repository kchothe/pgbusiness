class Business < ActiveRecord::Base
	has_many :business_contact_phones
	has_many :contact_phones, :through => :business_contact_phones
end
