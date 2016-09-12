class AdminSessionsController < ApplicationController
  
  def new
  end
  
  def create
    admin = Admin.find_by(name: params[:admin_session][:name].downcase)
    if admin && admin.authenticate(params[:admin_session][:password])
      log_in_admin admin
      redirect_back_or admins_dashboard_path
    else
      flash.now[:danger] = 'Invalid username/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out_admin
    redirect_to root_url
  end
end
