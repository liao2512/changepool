module PartnerSessionsHelper
  
  # Logs in a partner.
  def log_in(partner)
    session[:partner_id] = partner.id
  end
  
  # Returns the current logged-in partner (if any).
  def current_partner
    @current_partner ||= Partner.find_by(id: session[:partner_id])
  end
  
  # Returns true if the partner is logged in, false otherwise.
  def partner_logged_in?
    !current_partner.nil?
  end
  
  # Logs out the current partner.
  def partner_log_out
    session.delete(:partner_id)
    @current_partner = nil
  end
end
