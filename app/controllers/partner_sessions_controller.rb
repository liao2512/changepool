class PartnerSessionsController < ApplicationController
  
  def new
  end

  def create
    partner = Partner.find_by(username: params[:session][:username].downcase)
    if partner && partner.authenticate(params[:session][:password])
      asd
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
  
end
