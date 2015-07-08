class RequestsController < ApplicationController

	def show
		@requests = Request.where(student_id: current_student.id).to_a
	end

	def new
		@student = Student.find(current_student.id)
		@argument = Argument.find(params[:id])
		@request_control = Request.where("argument_id = ? and student_id = ?", @argument.id, @student.id).first
		if !@request_control.nil?
			flash[:danger] = "Richiesta duplicata."
			redirect_to root_url
		else
			
			@request = Request.new(student_id: @student.id, argument_id: @argument.id)
			if @request.save
				old_interessati = @argument.interessati
				old_interessati += 1
				if @argument.update(interessati: old_interessati)
					flash[:success] = "Richiesta avvenuta correttamente."
					redirect_to root_url
				end
			else
				flash[:danger] = "Errore con la richiesta."
				redirect_to root_url
			end
		end
	end

	def create
	end

	def destroy
    @request = Request.find(params[:id])
    @request.destroy
    flash.now[:success] = "Cancellazione avvenuta correttamente."
    redirect_to visualizza_richieste_url
  end

end
