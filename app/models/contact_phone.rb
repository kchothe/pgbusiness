class ContactPhone < ActiveRecord::Base
	belongs_to :contact

	has_many :business_contact_phones
	has_many :businesses, :through => :business_contact_phones
end
