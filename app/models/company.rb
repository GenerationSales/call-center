class Company < ActiveRecord::Base
	paginates_per 50
	has_many :campaigns

	def self.import(file, options)
		ActiveRecord::Base.transaction do
			 @import = SmarterCSV.process(file,options) do |chunk|
			 	Company.create(chunk)
			 end
		end
	end
end
