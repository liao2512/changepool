class PagesController < ApplicationController
  def home
  end

  def about
  end
  
  def donate
    @campaigns = Campaign.all
  end
end
