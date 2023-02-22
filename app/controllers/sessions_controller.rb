class SessionsController < ApplicationController

  # skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create   

    # @user = User.find_by(username: params[:username])   
    # @user = User.new({:username => params[:p_username], :password => params[:p_password]})
    
    # if @user && @user.authenticate(params[:password])
    #   sessions[:user_id] = @user.id      
    #   redirect_to '/welcome'   
    # else      
    #   redirect_to '/login'   
    # end

    session[:s_username] = params[:p_username]
    redirect_to '/welcome' 
    
    
  end

  def login
  end

  def page_requires_login
  end

end
