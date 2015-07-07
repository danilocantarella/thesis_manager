class RequestsController < ApplicationController

	def new
		@student = Student.find(current_student.id)
		@argument = Argument.find(params[:id])
		@request = Request.new(id_student: @student.id, id_argument: @argument.id)
		if @request.save
			old_interessati = @argument.interessati
			old_interessati += 1
			if @argument.update(interessati: old_interessati)
				flash[:success] = "Richiesta avvenuta correttamente."
				redirect_to root_url
			end
		else
			flash[:danger] = "Riempi correttamente tutti i campi."
			redirect_to root_url
		end
	end

	def create
	end

end
