module SessionsStudentsHelper
	def sign_in_student(student)
		session[:student_id] = student.id
		self.current_student = student
	end

	def current_student=(student)
		@current_student = student
	end

	def current_student
		@current_student ||= Student.find(session[:student_id]) if session[:student_id]
	end

	def signed_in_student?
		!current_student.nil?
	end

	def sign_out_student
		session[:student_id] = nil
		self.current_student = nil
	end

	def current_student?(student)
		student = current_student
	end
end
