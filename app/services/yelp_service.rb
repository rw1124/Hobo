class YelpService
	attr_reader :destination, 

	def initialize(destination)
		if destination.empty?
			@destination = "EMPTY"
		else
			@destination = destination
		end
		@client = Yelp::Client.new(Yelp.configuration)
	end

	def search_old
		# if search results have not been called for, call for them. otherwise, return the existing value.
	end
		
  
end
