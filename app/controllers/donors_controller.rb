class DonorsController < ApplicationController
  before_action :set_donor, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_donor, only: [:index, :edit, :update, :destroy]
  before_action :correct_donor,   only: [:edit, :update]

  # GET /donors
  # GET /donors.json
  def index
    @donors = Donor.all
  end

  # GET /donors/1
  # GET /donors/1.json
  def show
  end

  # GET /donors/new
  def new
    @donor = Donor.new
  end

  # GET /donors/1/edit
  def edit
  end

  # POST /donors
  # POST /donors.json
  def create
    @donor = Donor.new(donor_params)
    if @donor.save
      log_in_donor @donor
      flash[:success] = "Welcome to ChangePool!"
      redirect_to @donor
    else
      render 'new'
    end
  end

  # PATCH/PUT /donors/1
  # PATCH/PUT /donors/1.json
  def update
    respond_to do |format|
      if @donor.update(donor_params)
        format.html { redirect_to @donor, notice: 'Donor was successfully updated.' }
        format.json { render :show, status: :ok, location: @donor }
      else
        format.html { render :edit }
        format.json { render json: @donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donors/1
  # DELETE /donors/1.json
  def destroy
    @donor.destroy
    respond_to do |format|
      format.html { redirect_to donors_url, notice: 'Donor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donor
      @donor = Donor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donor_params
      params.require(:donor).permit(:name, :email, :birthday, :country, :bio, 
                                    :password, :password_confirmation, 
                                    :monthly_fund, :anual_fund, :anonymous)
    end
end
