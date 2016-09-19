class PartnerSessionsController < ApplicationController
  
  def new
  end

  def create
    partner = Partner.find_by(username: params[:session][:username].downcase)
    if partner && partner.authenticate(params[:session][:password])
      #if partner.activated?
        log_in_partner partner
        params[:session][:remember_me] == '1' ? remember_partner(partner) : forget_partner(partner)
        redirect_back_or partner_panel_index_path
      #else
      #  message  = "Account not activated. "
      #  message += "Check your email for the activation link."
      #  flash[:warning] = message
      #  redirect_to root_url
      #end
    else
      flash.now[:danger] = 'Invalid Partner username/password combination'
      render 'new'
    end
  end

  def destroy
    log_out_partner if partner_logged_in?
    session.delete(:forwarding_url)
    redirect_to root_url
  end
  
end
