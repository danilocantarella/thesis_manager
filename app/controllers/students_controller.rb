class StudentsController < ApplicationController
	def index
		@students = Student.all
	end

	def show
    	@student = Student.find(params[:id])
  	end

	def new
		@student = Student.new
  	end

  	def edit
  		@student = Student.find(params[:id])
  	end

  def create
    @studebt = Student.new(student_params)
    if @student.save
      flash[:success] = "Registrazione avvenuta correttamente. Effettua il login."
      redirect_to login_url
    else
      flash.now[:danger] = "Riempi correttamente tutti i campi."
      render action: "new"
    end
  end

    def update
      @student = Student.find(params[:id])
     
      if @student.update(student_params)
        redirect_to @student
      else
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
	    params.require(:student).permit(:name, :surname)
	  end
end
