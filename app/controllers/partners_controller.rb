class PartnersController < ApplicationController
  
  def show
    @partner = Partner.find(params[:id])
  end
  
  def new
    @partner = Partner.new
  end
  
  def create
    @partner = Partner.new(partner_params)
    if @partner.save
      flash[:success] = "Welcome to ChangePool!"
      redirect_to @partner
    else
      render 'new'
    end
  end
  
  private

    def partner_params
      params.require(:partner).permit(:name, :username, :email, 
                                      :password, :password_confirmation)
    end
end
