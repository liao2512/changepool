class DonorSessionsController < ApplicationController
  
  def new
  end
  
  def create
    donor = Donor.find_by(email: params[:donor_session][:email].downcase)
    if donor && donor.authenticate(params[:donor_session][:password])
      log_in_donor donor
      redirect_to donor
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out_donor
    redirect_to root_url
  end
end
