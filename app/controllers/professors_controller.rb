class ProfessorsController < ApplicationController
	def index
		@professors = Professor.all
	end

	def show
		if signed_in?
			@professor = Professor.find(current_professor.id)
		end
	end
	
	def new
	end

	def edit
  		@professor = Professor.find(current_professor.id)
  	end


	def create
		@professor = Professor.new(professor_params)
		if @professor.save
			flash[:success] = "Registrazione avvenuta correttamente. Effettua il login."
			redirect_to root_url
		else
			flash.now[:danger] = "Riempi correttamente tutti i campi."
			render action: "new"
		end
	end


	def update
      @professor = Professor.find(current_professor.id)
     
      if @professor.update(professor_params)
        flash[:success] = "Modifica avvenuta correttamente."
        redirect_to @professor
      else
        flash.now[:danger] = "Riempi correttamente tutti i campi."
        render 'edit'
      end
    end

	private
	  ## Strong Parameters 
	  def professor_params
	    params.require(:professor).permit(:nome, :cognome, :email, :password, :password_confirmation, :ufficio)
	  end
end
