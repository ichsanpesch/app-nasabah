$HostBackend = "localhost"
$PortBackend = "8000"
$HostFrontend = "localhost"
$PortFrontend = "3000"

class ApplicationController < ActionController::Base

    skip_before_action :verify_authenticity_token

    # before_action :authorized
    helper_method :current_user
    helper_method :logged_in?

    def current_user        
        # User.find_by(id: session[:user_id]) 
        session[":email"] 
    end

    def logged_in?
        !current_user.nil?  
    end

    def authorized
        redirect_to '/welcome' unless logged_in?
    end

end
