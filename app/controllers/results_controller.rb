class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]


  def show
  	redirect_to action: :index
  end

  def create
 	# puts params[:trip_length]
  # 	render :show
  	# 1, 2 , 3 , 4 
 	@trip = TripIdeaService.new(destination: params[:search], length_of_stay: params[:trip_length])
 	@hotels = @trip.hotel_search
 	@restaurants = @trip.restaurant_search
 	@localflavors = @trip.localflavor_search
 	@pets = @trip.pet_search
 	@shoppingcenters = @trip.shoppingcenter_search

    # puts "*********************response: #{response}"
    # if response == "failed"  # lookup failed
    #   @results = Results.new
    #   @results.errors.add(:destination, :trip_length, :not_specified, message: "is invalid")
    # else # lookup was successful
    #   @results = Results.new(response)
    # end
    render :show

  end

  def index

  end

 
end