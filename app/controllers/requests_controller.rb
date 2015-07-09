class RequestsController < ApplicationController

	def show
		if signed_in?
			@arguments = Argument.where(professor_id: current_professor.id).to_a
		elsif signed_in_student?
			@requests = Request.where(student_id: current_student.id).to_a
		end
	end

	def index
		if signed_in?
			@arguments = Argument.where(professor_id: current_professor.id).to_a
		end
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

	def edit
		@mode = params[:mode]
		@request = Request.find(params[:id])

		if @mode == '1'
			if @request.update(stato: "Accettata")
				@argument = Argument.find(@request.argument_id)
				if @argument.update(stato: "Assegnata")
					flash[:success] = "Richiesta accettata correttamente."
					redirect_to visualizza_richieste_url
				else

					flash[:danger] = "Errore con la richiesta."
					redirect_to visualizza_richieste_url
				end
			end
		elsif @mode == '2'
			if @request.update(stato: "Cancellata")
				flash[:success] = "Richiesta cancellata correttamente."
				redirect_to visualizza_richieste_url
			else
				flash[:danger] = "Errore con la richiesta."
				redirect_to visualizza_richieste_url
			end

		elsif @mode == '3'
				@argument = Argument.find(@request.argument_id)
				if @argument.update(stato: "Completata")
					flash[:success] = "Tesi completata correttamente."
					redirect_to visualizza_tesisti_url
				else

					flash[:danger] = "Errore con la richiesta."
					redirect_to visualizza_tesisti_url
				end

		elsif @mode == '4'
				if @request.update(stato: "Cancellata")
				@argument = Argument.find(@request.argument_id)
				if @argument.update(stato: "Libera")
					flash[:success] = "Tesista cancellato correttamente."
					redirect_to visualizza_richieste_url
				else

					flash[:danger] = "Errore con la richiesta."
					redirect_to visualizza_richieste_url
				end
			end


		end
			
	end

	def destroy
    	@request = Request.find(params[:id])
    	if @request.update(stato: "Cancellata")
				flash[:success] = "Richiesta cancellata correttamente."
				redirect_to visualizza_richieste_url
    	else
				flash[:danger] = "Errore con la richiesta."
				redirect_to visualizza_richieste_url
			end
  end

end
