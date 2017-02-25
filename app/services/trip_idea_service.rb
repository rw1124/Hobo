class TripIdeaService
	attr_reader :destination, :length_of_stay

	def initialize(destination: , length_of_stay:)
		@destination = destination
		@length_of_stay = length_of_stay
	end

	def hotel_search
		results = Yelp.client.search(destination, {term: 'hotel', limit: business_count[:hotels]})
		business = results.businesses
	end

	def restaurant_search
		results = Yelp.client.search(destination,{term: 'food', limit: business_count[:restaurants]})
		business = results.businesses
	end
		
	def localflavor_search
		results = Yelp.client.search(destination, {term: 'localflavor', limit: business_count[:localflavors]})
		business = results.businesses
	end

	def pet_search
		results = Yelp.client.search(destination, {term: 'pets', limit: business_count[:pets]})
		business = results.businesses
	end

	def shoppingcenter_search
		results = Yelp.client.search(destination, {term: 'shoppingcenter', limit: business_count[:shoppingcenters]})
		business = results.businesses
	end
	# restaurants = Yelp.client.search(destination, {term: 'food', limit: 2})
	# activities = Yelp.client.search(destination, {term: 'active', limit: 1})
	# pets = Yelp.client.search(destination, {term: 'pets', limit: 1})
	# shops = Yelp.client.search(destination, {term: 'shopping', limit: 1})
  
  def business_count
  	business_count = { hotels: 1, restaurants: 1, localflavors: 1, pets: 1, shoppingcenters: 1 }

  	if length_of_stay == "24 hours"
  		business_count[:hotels] = 1
  		business_count[:restaurants] = 2
  		business_count[:localflavors] = 1
  		business_count[:pets] = 1
  		business_count[:shoppingcenters] = 1
  	end

  	if length_of_stay == "48 hours"
  		business_count[:hotels] = 2
  		business_count[:restaurants] = 4
  		business_count[:localflavors] = 2
  		business_count[:pets] = 2
  		business_count[:shoppingcenters] = 2
  	end

  	if length_of_stay == "72 hours"
  		business_count[:hotels] = 3
  		business_count[:restaurants] = 6
  		business_count[:localflavors] = 3
  		business_count[:pets] = 3
  		business_count[:shoppingcenters] = 3
  	end

  	if length_of_stay == "1 Week Plus"
  		business_count[:hotels] = 4
  		business_count[:restaurants] = 8
  		business_count[:localflavors] = 4
  		business_count[:pets] = 3
  		business_count[:shoppingcenters] = 5
  	end
  	# All the conditional logic to change the business counts based on the length of the stay

  	business_count
  end
end
