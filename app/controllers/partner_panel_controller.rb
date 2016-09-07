class PartnerPanelController < ApplicationController
  before_action :logged_in_partner, only: [:dashboard, :edit, :update]
  #before_action :correct_partner,   only: [:edit, :update]
  before_action :set_partner
  
  def dashboard
  end
  
  def edit
  end
  
  private

    def set_partner
      @partner = current_partner
    end
    
    def partner_params
      params.require(:partner).permit(:name, :username, :email, 
                                      :password, :password_confirmation)
    end
    
    # Confirms a logged-in partner.
    def correct_partner
      @partner = Partner.find(params[:id])
      redirect_to(root_url) unless current_partner?(@partner)
    end
    
end
