class DonorsController < ApplicationController
  before_action :set_donor, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_admin, only: [:index, :edit, :update, :destroy]
  
  layout "admin"

  def index
    @donors = Donor.all
  end

  def show
  end

  def new
    @donor = Donor.new
  end

  def edit
  end

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
