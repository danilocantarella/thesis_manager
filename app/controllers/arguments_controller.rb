class ArgumentsController < ApplicationController
	def index
		@arguments = Argument.all
	end

	def show
		@argument = Argument.find(params[:id])
	end

	def new
	end

	def create
		@argument = Argument.new(argument_params)
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
