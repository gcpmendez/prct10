# Libros: Elementos de referencia de un libro completo:
# Autor, A. A. (Ano de publicación). Título del libro: Mayúscula inicial también para el
# subtítulo (edición) (volumen). Lugar de publicación: editor o casa publicadora.

# Artículo: Para un artículo o capítulo dentro de un libro editado:
# Autor, A. A. & Autor, B. B. (A˜no de publicaci´on). T´ıtulo del art´ıculo o cap´ıtulo. En A.
# Editor & B. Editor (Eds.), Título de la obra (n´umeros de p´aginas del cap´ıtulo) (edici´on)
# (volumen). Lugar de publicaci´on: editor o casa publicadora.

# Artículo de periódico:
# Autor, A. A. (Fecha mostrada en la publicación). Título del artículo. Nombre del periódico,
# pp. números de páginas.

# Documentos electrónicos:
# Autor/responsable (fecha de publicaci´on). T´ıtulo (edici´on), [tipo de medio]. Lugar de publicaci´on:
# editor. Disponible en: especifique la v´ıa [fecha de acceso].

require "prct10/reference"
require "prct10/linkedList"
require "prct10/book"
require "prct10/magazinearticle"
require "prct10/journalarticle"
require "prct10/electronicdocument"

class APA

	def initialize()
		@lista = LinkedList.new
	end
	def insert(reference)
		raise ArgumentError, "La referencia no es de tipo referencia" unless reference.kind_of?(Reference)
		
		# Renombramos los autores para ordenar bien
		str = ""
		reference.authors.each do |a|
			# raise ArgumentError, "Uno de los autores no es un string" unless a.is_a?(String)
			# raise ArgumentError, "Se especifica unicamente el nombre o el apellido" unless a.split(' ').length > 1
			separado = a.split(/\W+/)
			str+=separado[1]
			str+=", "
			unless separado[2].nil?
				str+=separado[2][0]
				str+="."
			end
			str+=separado[0][0]
			str+="."
			str+=" & " unless a == reference.authors.last
		end
		reference.authors = str
		@lista.insert_by_end(reference)
		
	end
	
	def each
		@lista.each{ |i| yield i}
	end
		
	def to_s
		arrayTemp = Array.new
		arrayTemp = @lista.sort
		string = ""
		arrayTemp.each do |i|
			if (i.instance_of? Book)
				
				# Autores APA
				string += i.authors
			
				# Año de publicacion APA
				element = i.date.split(/\//)
				string += " (#{element[2]}). "
				
				# Título APA
				string += " #{i.title} "
				
				# Edición APA
				string += " (#{i.edition}) "
				
				# Volumen APA
				string += " (#{i.volume}). "
				
				# Editorial APA
				string += " #{i.editorial} \n\n"
			elsif (i.class.to_s == "JournalArticle")
				# Autores APA
				string += i.authors
			
				# fecha de publicacion APA
				string += " (#{i.date}). "
				
				# Título articuloAPA
				string += " #{i.title}. "
				
				# Nombre periodico APA
				string += " #{i.journal}, "
				
				# Número de paginas APA
				string += " #{i.finalpage}.\n\n "
				
			
			end
		end
		return string
	end
end
