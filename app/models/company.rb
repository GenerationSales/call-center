class Company < ActiveRecord::Base
	paginates_per 50
	has_many :campaigns

	filterrific(
	    default_filter_params: { sorted_by: 'created_at_desc' },
	    available_filters: [
	      :sorted_by,
	      :with_name,
	      :with_country_id,
	      :with_created_at_gte
	    ]
	  )
	scope :with_name, lambda { |name|
    	where(name: [*name])
  	}
	scope :sorted_by, lambda { |sort_key|
	    # Sorts students by sort_key
	  }
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

  	def self.options_for_sorted_by
	    [
	      ['Name (a-z)', 'name_asc'],
	      ['Entry date (newest first)', 'created_at_desc'],
	      ['Entry date (oldest first)', 'created_at_asc'],
	      ['County (a-z)', 'county_name_asc']
	    ]
	  end
	  def self.options_for_select
		  order('LOWER(name)').map { |e| [e.name, e.id] }
		end
end
