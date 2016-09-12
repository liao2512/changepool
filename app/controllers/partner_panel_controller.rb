class PartnerPanelController < ApplicationController
  before_action :logged_in_partner
  before_action :set_partner
  before_action :new_path, only: [:new, :create]
  before_action :edit_path, only: [:edit, :update]
  
  def index
  end
  
  def edit
  end
  
  def update
    if @partner.update_attributes(partner_params)
      flash[:success] = "Profile updated"
      redirect_to partner_panel_index_path
    else
      render 'edit'
    end
  end
  
  private

    def set_partner
      @partner = current_partner
    end
    
    def new_path
      @path = partner_panel_path
    end
    
    def edit_path
      @path = partner_panel_path(current_partner)
    end
    
    def partner_params
      params.require(:partner).permit(:name, :username, :email, 
                                      :password, :password_confirmation)
    end
end
