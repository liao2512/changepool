class PartnerActivationsController < ApplicationController
  
  def edit
    partner = Partner.find_by(email: params[:email])
    if partner && !partner.activated? && partner.authenticated?(:activation, params[:id])
      partner.update_attribute(:activated,    true)
      partner.update_attribute(:activated_at, Time.zone.now)
      log_in_partner partner
      flash[:success] = "Account activated!"
      redirect_to partner_panel_index_path
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
  
end
