class Argument < ActiveRecord::Base
	belongs_to :professor

	after_initialize :init

    def init
      self.interessati  ||= 0          
      self.stato ||= "Libera"
    end
end
