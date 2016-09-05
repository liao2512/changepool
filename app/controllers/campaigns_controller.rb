class CampaignsController < ApplicationController
  before_action :logged_in_partner, only: [:create, :destroy]
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]
  
  def index
    @campaigns = Campaign.all
  end
  
  def show
  end
  
  def new
    @campaign = Campaign.new
  end
  
  def create
    @campaign = current_partner.campaigns.build(campaign_params)

    if @campaign.save
      redirect_to @campaign, notice: 'Campaign was successfully created.'
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @campaign.update(campaign_params)
      redirect_to @campaign, notice: 'Campaign was successfully updated.'
    else
      format.html render :edit
    end
  end

  def destroy
    @campaign.destroy
    redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.'
  end
  
  private
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    def campaign_params
      params.require(:campaign).permit(:name, :campaign_type, :description, :target_funding, :target_deadline)
    end

end
