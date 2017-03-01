class ResultMailer < ApplicationMailer
	default from: "rossw1124@gmail.com"

	def results_email(email, location)
		ideas = TripIdeaService.new(location)
		@hotels = ideas.hotel_search
 		@restaurants = ideas.restaurant_search
 		@localflavors = ideas.localflavor_search
 		@pets = ideas.pet_search
 		@shoppingcenters = ideas.shoppingcenter_search
    	mail(to: email, subject: 'Here is your Hobo Results')
  end
end



ResultMailer.results_email("San Antonio").deliver_now