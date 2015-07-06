class SessionsController < ApplicationController
  def new
  end

  def create
    professor = Professor.authenticate(params[:session][:email], params[:session][:password])
    if professor.nil?
      # Log the user in and redirect to the user's show page.
      #flash.now[:danger] = "Invalid email/password combination"
      #render :new
      flash[:danger] = "Combinazione email/password non corretta."
      redirect_to root_url
      #redirect_to login_url
      #redirect_to :controller => 'welcome', :action => 'index'
    else
      sign_in professor
      redirect_to professor #vado allo show così
    end
  end

  def destroy
    #professor = current_professor
    sign_out
    flash[:success] = "Logout eseguito con successo."
    redirect_to root_url
    #redirect_to :controller => 'sessions', :action => 'new', alert:"Successo"
  end
end
