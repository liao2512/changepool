module PartnerSessionsHelper
  
  # Logs in a partner.
  def log_in_partner(partner)
    session[:partner_id] = partner.id
  end
  
  #Remembers a partner in a persistent session.
  def remember_partner(partner)
    partner.remember_partner
    cookies.permanent.signed[:partner_id] = partner.id
    cookies.permanent[:remember_token] = partner.remember_token
  end
  
  # Returns true if the given partner is the current partner.
  def current_partner?(partner)
    partner == current_partner
  end

  
  # Returns the current logged-in partner (if any).
  def current_partner
    if session[:partner_id]
      @current_partner ||= Partner.find_by(id: session[:partner_id])
    elsif (partner_id = cookies.signed[:partner_id])
      partner = Partner.find_by(id: cookies.signed[:partner_id])
      if partner && partner.authenticated?(cookies[:remember_token])
        log_in_partner partner
        @current_partner = partner
      end
    end
  end
  
  # Returns true if the partner is logged in, false otherwise.
  def partner_logged_in?
    !current_partner.nil?
  end
  
  # Forgets a persistent session.
  def forget_partner(partner)
    partner.forget_partner
    cookies.delete(:partner_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current partner.
  def log_out_partner
    forget_partner(current_partner)
    session.delete(:partner_id)
    @current_partner = nil
  end
  
  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
