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

	def self.dedupe
    # find all models and group them on keys which should be common
    grouped = all.group_by{|model| [model.name] }
    grouped.values.each do |duplicates|
      # the first one we want to keep right?
      first_one = duplicates.pop # or pop for last one
      # if there are any more left, they are duplicates
      # so delete all of them
      duplicates.each{|double| double.destroy} # duplicates can now be destroyed
    end
  end
end
