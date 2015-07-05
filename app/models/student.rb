class Student < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 3 }
	validates :surname, presence: true, length: { minimum: 3 }
end
