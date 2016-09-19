class PartnerCampaignsController < ApplicationController
  before_action :logged_in_partner
  before_action :set_partner_campaign, only: [:show, :edit, :update, :destroy]
  before_action :new_path, only: [:new, :create]
  before_action :edit_path, only: [:edit, :update]

  def index
    @campaigns = current_partner.campaigns.all
  end

  def show
  end

  def new
    @campaign = Campaign.new
  end

  def edit
    @path = partner_campaign_path(@campaign)
  end

  def create
    @campaign = current_partner.campaigns.build(campaign_params)
    @campaign.status = "To be approved"
    if @campaign.save
      redirect_to partner_campaigns_path, notice: 'Partner campaign was successfully created.'
    else
      render "partner_campaigns/new" 
    end
  end

  def update
    if @campaign.update(campaign_params)
      redirect_to partner_campaigns_path, notice: 'Partner campaign was successfully updated.'
    else
      render "partner_campaigns/edit"
    end
  end

  def destroy
    @campaign.destroy
    redirect_to partner_campaigns_url, notice: 'Partner campaign was successfully destroyed.'
  end

  private
    def set_partner_campaign
      @campaign = Campaign.find(params[:id])
      partner = @campaign.partner
      redirect_to(root_url) unless current_partner?(partner)
    end
    
    def new_path
      @path = partner_campaigns_path
    end
    
    def edit_path
      @path = partner_campaign_path(@campaign)
    end
    
    # Confirms a logged-in partner.
    def correct_partner
      @partner = Partner.find(params[:id])
      redirect_to(root_url) unless current_partner?(@partner)
    end

    def campaign_params
      params.require(:campaign).permit(:name, :campaign_type, :description, :target_funding, :target_deadline)
    end
end