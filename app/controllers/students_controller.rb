class StudentsController < ApplicationController
	def index
		@students = Student.all
	end

	def show
    id = params[:id]
    if (id.nil?)
      if(signed_in_student?)
        @student = Student.find(current_student.id)
      end
    else
      @student = Student.find(params[:id])
    end
    
  end

	def new
		@student = Student.new
  	end

  	def edit
      if signed_in_student?
  		  @student = Student.find(current_student.id)
      end
  	end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "Registrazione avvenuta correttamente. Effettua il login."
      redirect_to root_url
    else
      flash.now[:danger] = "Riempi correttamente tutti i campi."
      render action: "new"
    end
  end

    def update
      @student = Student.find(current_student.id)
     
      if @student.update(student_params)
        flash[:success] = "Modifica avvenuta correttamente."
        redirect_to @student
      else
        flash.now[:danger] = "Riempi correttamente tutti i campi."
        render 'edit'
      end
    end

    def destroy
      @student = Student.find(params[:id])
      @student.destroy
     
      redirect_to students_path
    end

    def registrazione
    end

  	private
	  def student_params
	    params.require(:student).permit(:nome, :cognome, :email, :matricola, :password, :password_confirmation)
	  end
end
