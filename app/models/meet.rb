class Meet < ApplicationRecord 
	  belongs_to :user
	  has_many :comes
end
