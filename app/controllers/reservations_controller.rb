class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
    @users = current_user
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
    @users = current_user
  end

  # GET /reservations/1/edit
  def edit
    x = Reservation.find(params[:id])
    if current_user == x.user
      @reservation = Reservation.find(params[:id])
      @listing = Listing.find(@reservation.listing.id)
      @user = current_user
    else
      redirect_to root_path
    end
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.start_date = Date.strptime(reservation_params[:start_date],'%d/%m/%Y').strftime('%d-%m-%Y')
    @reservation.end_date = Date.strptime(reservation_params[:end_date],'%d/%m/%Y').strftime('%d-%m-%Y') 
    @listing  = Listing.find(@reservation.listing_id) 
    @reservation.total_price = @listing.price_per_day * ((@reservation.end_date - @reservation.start_date).to_i)
    @reservation.currency = @listing.currency

    respond_to do |format|
      if @reservation.save
        #ReservationMailer.booking_email(@reservation.user, @listing.user, @reservation.id).deliver_now
        # ReservationJob.perform_now(@reservation.id ,@listing.id)
        ReservationMailer.booking_email(@reservation.user, @listing.user, @reservation.id).deliver_later
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    x = Reservation.find(params[:id])
    if current_user == x.user
      respond_to do |format|
        if @reservation.update(reservation_params)
          format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
          format.json { render :show, status: :ok, location: @reservation }
        else
          format.html { render :edit }
          format.json { render json: @reservation.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    x = Reservation.find(params[:id])
    if current_user == x.user
      @reservation.destroy
      respond_to do |format|
        format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:user_id, :listing_id, :total_price, :currency, :start_date, :end_date, :message, :num_guest)
    end
end
