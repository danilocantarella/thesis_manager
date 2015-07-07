class SessionsStudentsController < ApplicationController
	def new
  end

  def create
    student = Student.authenticate(params[:sessions_student][:email], params[:sessions_student][:password])
    if student.nil?
      # Log the user in and redirect to the user's show page.
      #flash.now[:danger] = "Invalid email/password combination"
      #render :new
      flash[:danger] = "Email/password non corretti."
      redirect_to root_url
      #redirect_to :controller => 'welcome', :action => 'index'
    else
      sign_in_student student
      #redirect_to student #vado allo show così
      redirect_to root_url
    end
  end

  def destroy
    #professor = current_professor
    sign_out_student
    flash[:success] = "Logout eseguito con successo."
    redirect_to root_url
    #redirect_to :controller => 'sessions', :action => 'new', alert:"Successo"
  end
end
