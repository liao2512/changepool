class PartnersController < ApplicationController
  before_action :logged_in_admin, only: [:index, :edit, :update, :destroy]
  
  layout "admin"
  
  def index
    @partners = Partner.paginate(page: params[:page])
  end
  
  def show
    @partner = Partner.find(params[:id])
    @campaigns = @partner.campaigns.paginate(page: params[:page])
  end
  
  def new
    @partner = Partner.new
  end
  
  def create
    @partner = Partner.new(partner_params)
    if @partner.save
      log_in_partner @partner
      flash[:success] = "Welcome to ChangePool!"
      redirect_to partner_panel_index_path
    else
      render 'new'
    end
  end
  
  def edit
    @partner = Partner.find(params[:id])
  end
  
  def update
    @partner = Partner.find(params[:id])
    if @partner.update_attributes(partner_params)
      flash[:success] = "Partner updated"
      redirect_to @partner
    else
      render 'edit'
    end
  end
  
  def destroy
    Partner.find(params[:id]).destroy
    flash[:success] = "Partner deleted"
    redirect_to partners_url
  end
  
  private

    def partner_params
      params.require(:partner).permit(:name, :username, :email, 
                                      :password, :password_confirmation)
    end
    
end
