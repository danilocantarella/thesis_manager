module SessionsHelper
	def sign_in(professor)
		session[:professor_id] = professor.id
		self.current_professor = professor
	end

	def current_professor=(professor)
		@current_professor = professor
	end

	def current_professor
		@current_professor ||= Professor.find(session[:professor_id]) if session[:professor_id]
	end

	def signed_in?
		!current_professor.nil?
	end

	def sign_out
		session[:professor_id] = nil
		self.current_professor = nil
	end

	def current_professor?(professor)
		professor = current_professor
	end

	def deny_access
		redirect_to signin_path, :notice => "Fai il login per visualizzare questa pagina"
	end
end
