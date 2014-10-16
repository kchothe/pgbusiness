class Contact < ActiveRecord::Base
	belongs_to :device

	has_many :contact_phones
end
