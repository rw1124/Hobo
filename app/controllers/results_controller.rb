class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]


  def show
  end

  def create
 	puts params[:option]
  	render :show
 

  end

  def index
  end

  def expose
  	puts params[:option]
  	render :show
  	
  end
end