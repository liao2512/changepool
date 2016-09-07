class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include PartnerSessionsHelper
  include DonorSessionsHelper
  include AdminSessionsHelper
  
  private

    # Confirms a logged-in partner.
    def logged_in_partner
      unless partner_logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to partners_login_url
      end
    end
    
    # Confirms a logged-in donor.
    def logged_in_donor
      unless donor_logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to donors_login_url
      end
    end
    
    # Confirms a logged-in donor.
    def logged_in_admin
      unless admin_logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to admins_login_url
      end
    end
    
end
