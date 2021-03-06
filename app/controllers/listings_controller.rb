class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:edit, :update, :create, :destroy]

  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.order(:id).page params[:page]
    @users = current_user
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @listing = Listing.find(params[:id])
    @reservation = Reservation.new
    @user = current_user

  end

  # GET /listings/new
  def new
    @listing = Listing.new
    @users = current_user
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = current_user.listings.new(listing_params)
    @listing.update(photos: listing_params[:photos])
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    if current_user.id == @listing.user.id
      respond_to do |format|
        if @listing.update(listing_params)
          format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
          format.json { render :show, status: :ok, location: @listing }
        else
          format.html { render :edit }
          format.json { render json: @listing.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    if current_user.id == @listing.user.id
      @listing.destroy
      respond_to do |format|
        format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:user, :address1, :address2, :postalcode, :state, :country, :no_bed, :no_room, :max_guest, :price_per_day, :currency, :content, :smoker, :pets, :instant_book, :property_type, :name, {photos: []})
    end
end
