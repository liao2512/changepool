class PartnerSessionsController < ApplicationController
  
  def new
  end

  def create
    partner = Partner.find_by(username: params[:session][:username].downcase)
    if partner && partner.authenticate(params[:session][:password])
      log_in_partner partner
      params[:session][:remember_me] == '1' ? remember_partner(partner) : forget_partner(partner)
      redirect_back_or partner
    else
      flash.now[:danger] = 'Invalid Partner username/password combination'
      render 'new'
    end
  end

  def destroy
    log_out_partner if partner_logged_in?
    redirect_to root_url
  end
  
end
