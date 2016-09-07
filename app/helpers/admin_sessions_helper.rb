module AdminSessionsHelper
  
  # Logs in an admin.
  def log_in_admin(admin)
    session[:admin_id] = admin.id
  end
  
  # Returns true if the given admin is the current admin.
  def current_admin?(admin)
    admin == current_admin
  end
  
  # Returns the current logged-in admin (if any).
  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end
  
  # Returns true if the admin is logged in, false otherwise.
  def admin_logged_in?
    !current_admin.nil?
  end
  
  # Logs out the current donor.
  def log_out_admin
    session.delete(:admin_id)
    @current_admin = nil
  end

end
