class SessionsStudentsControllerController < ApplicationController
	def new
  	end

  	def create
    student = Student.authenticate(params[:session][:email], params[:session][:password])
    if student.nil?
      # Log the user in and redirect to the user's show page.
      #flash.now[:danger] = "Invalid email/password combination"
      #render :new
      flash[:danger] = "Email/password non corretti."
      redirect_to login_url
      #redirect_to :controller => 'welcome', :action => 'index'
    else
      sign_in student
      redirect_to student #vado allo show così
    end
  end

  def destroy
    #professor = current_professor
    sign_out
    flash[:success] = "Logout eseguito con successo."
    redirect_to login_url
    #redirect_to :controller => 'sessions', :action => 'new', alert:"Successo"
  end
end
