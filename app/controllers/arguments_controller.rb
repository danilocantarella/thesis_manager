class ArgumentsController < ApplicationController
	def index

	end

	def show
		@argument = Argument.find(params[:id])
	end

	def new
		@professor = Professor.find(current_professor.id)
	end

	def edit
  		@argument = Argument.find(params[:id])
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

	def update
      @argument = Argument.find(params[:id])
     
      if @argument.update(argument_params)
        flash[:success] = "Modifica avvenuta correttamente."
        redirect_to @argument
      else
        flash.now[:danger] = "Riempi correttamente tutti i campi."
        render 'edit'
      end
    end

	def destroy
    @argument = Argument.find(params[:id])
    @argument.destroy
    flash[:success] = "Cancellazione avvenuta correttamente."
    redirect_to mie_tesi_url
  end

	private
	  ## Strong Parameters 
	  def argument_params
	    params.require(:argument).permit(:titolo, :descrizione, :interessati, :tipologia, :stato)
	  end
end
