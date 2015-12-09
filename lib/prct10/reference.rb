class Reference
	include Comparable
 	attr_accessor :title, :date, :authors

 	
	def initialize(authors, title, date)
	    self.authors = []
	    authors.each do |palabras|
	       	@authors.push(palabras)
	    end
	        @title = title
	        @date = date
	end
	
	def get_title
		@title
	end
	
	def <=>(other)
      return nil unless other.is_a? Reference
      @title <=> other.title
	end


end