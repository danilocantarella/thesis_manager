class ProfessorsController < ApplicationController
	def index
		@professors = Professor.all
	end

	def new
	end

	
	def show
		@professor = Professor.find(params[:id])
	end

	def create
		@professor = Professor.new(professor_params)
		if @professor.save
			flash[:success] = "Registrazione avvenuta correttamente. Effettua il login."
			redirect_to login_url
		else
			flash.now[:danger] = "Riempi correttamente tutti i campi."
			render action: "new"
		end
	end


	def registrazione
	end

	private
	  ## Strong Parameters 
	  def professor_params
	    params.require(:professor).permit(:nome, :cognome, :email, :password, :password_confirmation, :ufficio)
	  end
end
