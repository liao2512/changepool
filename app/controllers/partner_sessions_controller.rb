class PartnerSessionsController < ApplicationController
  
  def new
  end

  def create
    partner = Partner.find_by(username: params[:session][:username].downcase)
    if partner && partner.authenticate(params[:session][:password])
      log_in partner
      redirect_to partner
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    partner_log_out
    redirect_to root_url
  end
  
end
