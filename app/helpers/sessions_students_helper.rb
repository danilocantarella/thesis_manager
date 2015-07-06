module SessionsStudentsHelper
	def sign_in(student)
		session[:student_id] = student.id
		self.current_student = student
	end

	def current_student=(student)
		@current_student = student
	end

	def current_student
		@current_student ||= student.find(session[:student_id]) if session[:student_id]
	end

	def signed_in?
		!current_student.nil?
	end

	def sign_out
		session[:student_id] = nil
		self.current_student = nil
	end

	def current_student?(student)
		student = current_student
	end

	def deny_access
		redirect_to signin_path, :notice => "Fai il login per visualizzare questa pagina"
	end
end
