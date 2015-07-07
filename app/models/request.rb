class Request < ActiveRecord::Base

	after_initialize :init

    def init      
      self.stato ||= "In attesa"
    end
end
