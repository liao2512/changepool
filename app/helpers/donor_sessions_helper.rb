module DonorSessionsHelper
  
  # Logs in a donor.
  def log_in_donor(donor)
    session[:donor_id] = donor.id
  end
  
  # Returns true if the given donor is the current donor.
  def current_donor?(donor)
    donor == current_donor
  end
  
  # Returns the current logged-in donor (if any).
  def current_donor
    @current_donor ||= Donor.find_by(id: session[:donor_id])
  end
  
  # Returns true if the user is logged in, false otherwise.
  def donor_logged_in?
    !current_donor.nil?
  end
  
  # Logs out the current donor.
  def log_out_donor
    session.delete(:donor_id)
    @current_donor = nil
  end
end
