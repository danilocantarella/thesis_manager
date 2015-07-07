class ArgumentsController < ApplicationController
	def index
		@professor = Professor.find(current_professor.id)
		@arguments = @professor.arguments.all
	end

	def show
		@professor = Professor.find(params[:professor_id])
		@arguments = @professor.arguments.all
	end

	def new
		@professor = Professor.find(current_professor.id)
	end

	def create
		@professor = Professor.find(params[:professor_id])
		@argument = @professor.arguments.create(argument_params)
		if @argument.save
			flash[:success] = "Inserimento della tesi avvenuto correttamente."
			redirect_to root_url
		else
			flash.now[:danger] = "Riempi correttamente tutti i campi."
			render action: "new"
		end
	end

	def edit
	end

	def destroy
	end

	private
	  ## Strong Parameters 
	  def argument_params
	    params.require(:argument).permit(:titolo, :descrizione, :interessati, :tipologia, :stato)
	  end
end
