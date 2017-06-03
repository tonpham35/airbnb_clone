class SearchesController < ApplicationController
	def new
		@search = Search.new
		@states = Listing.distinct.pluck(:state)
		@countries = Listing.distinct.pluck(:country)
		@property_types = Listing.distinct.pluck(:property_type)
	end	

	def create
		@search = Search.create(search_params)
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
	end

private
	def search_params
		params.require(:search).permit(:keyword, :state, :country, :no_bed, :no_room, :no_guest, :min_price, :max_price, :smoker, :pets, :instant_book, :property_type)
	end
end