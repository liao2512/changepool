ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
include ApplicationHelper

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Returns true if a test partner is logged in.
  def is_partner_logged_in?
    !session[:partner_id].nil?
  end

  # Log in as a particular partner.
  def log_in_partner_as(partner)
    session[:partner_id] = partner.id
  end
end

class ActionDispatch::IntegrationTest

  # Log in as a particular partner.
  def log_in_partner_as(partner, password: 'lalalala', remember_me: '1')
    post partners_login_path, params: { session: { username: partner.username,
                                          password: password,
                                          remember_me: remember_me } }
  end
end
