class Category < ActiveRecord::Base
	extend FriendlyId
	has_many :pages
	friendly_id :name, use: :slugged

	def should_generate_new_friendly_id?
    	slug.empty?
  	end
end
