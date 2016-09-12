class DonorPanelController < ApplicationController
  before_action :logged_in_donor, except: [:new, :create]
  before_action :set_donor
  before_action :new_path, only: [:new, :create]
  before_action :edit_path, only: [:edit, :update]
  
  def index
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
      redirect_to donor_panel_index_path
    else
      render 'new'
    end
  end
  
  def update
    if @donor.update_attributes(donor_params)
      flash[:success] = "Profile updated"
      redirect_to donor_panel_index_path
    else
      render 'edit'
    end
  end
  
  private

    def set_donor
      @donor = current_donor
    end
    
    def new_path
      @path = donor_panel_index_path
    end
    
    def edit_path
      @path = donor_panel_path(current_donor)
    end
    
    def donor_params
      params.require(:donor).permit(:name, :email, :birthday, :country, :bio, 
                                    :password, :password_confirmation, 
                                    :monthly_fund, :anual_fund, :anonymous)
    end
end
