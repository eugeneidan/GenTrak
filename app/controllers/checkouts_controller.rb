class CheckoutsController < ApplicationController
  before_action :set_checkout, only: [:show, :edit, :update, :destroy]
  #before_action :find_checkin, only: [:create]

  # GET /checkouts
  # GET /checkouts.json
  def index
    @checkouts = Checkout.all
    #@checkins = Array.new
    #for checkout in @checkouts
    #    #code
    #    @checkins << find_checkin(checkout.serial_no)
    #end
    
  end

  # GET /checkouts/1
  # GET /checkouts/1.json
  def show
   @checkout = Checkout.find(params[:id])
   @checkin = find_checkin(@checkout.serial_no)
  end

  # GET /checkouts/new
  def new
    @checkout = Checkout.new
  end

  # GET /checkouts/1/edit
  def edit
  end

  # POST /checkouts
  # POST /checkouts.json
  def create
    @checkout = Checkout.new(checkout_params)
    @checkout.checkin = find_checkin(checkout_params[:serial_no])
    
    respond_to do |format|
      if @checkout.save
        format.html { redirect_to @checkout, notice: 'Checkout was successfully created.' }
        format.json { render :show, status: :created, location: @checkout }
      else
        format.html { render :new }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkouts/1
  # PATCH/PUT /checkouts/1.json
  def update
    respond_to do |format|
      if @checkout.update(checkout_params)
        format.html { redirect_to @checkout, notice: 'Checkout was successfully updated.' }
        format.json { render :show, status: :ok, location: @checkout }
      else
        format.html { render :edit }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkouts/1
  # DELETE /checkouts/1.json
  def destroy
    @checkout.destroy
    respond_to do |format|
      format.html { redirect_to checkouts_url, notice: 'Checkout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkout
      @checkout = Checkout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkout_params
      params.require(:checkout).permit(:dateOut, :state, :destination, :purpose, :serial_no, :dispatchedBy, :receivedBy, :waybillNo)
    end
    
    def find_checkin(*serial_no)
      # Get the related check in based on the serial no
      #if checkout_params[:serial_no]
      #  #code
      #  serial_no = params[:serial_no]
      #end      
        checkin = Checkin.find_by_serialNo(serial_no)
        return checkin      
    end
end
