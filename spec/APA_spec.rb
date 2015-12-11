require "spec_helper"

describe APA do
	before :each do
		@apa = APA.new
    	@book = Book.new("Don Quijote","Anaya", 4,"10/05/1980",["1234567890","123789456"], ["Cervantes Liante","Erik Dalmeida"], 2)
    	@book2 = Book.new("Miguel de Unamuno","Catedra", 2,"11/08/1990",["1234567890","123789456"], ["Mario Auan Valdes"],3)
    	@book3 = Book.new("La vida es sueño","Catedra", 3,"10/01/1983",["1234567890","123789456"], ["Ciriaco Moron Arroyo"],1)
	end
	
	it "Comprobar que existe APA" do
		expect(APA).to be_kind_of(Object)
		expect(@apa).to be_kind_of(APA)
	end
	
#   Los nombres de los autores están invertidos (apellidos, nombre); proporcione el apellido y
#       las iniciales de todos los autores de un trabajo en particular.
	it "Nombres autores invertidos (apellidos, nombre) según APA" do
		@apa.insert(@book)
		@apa.insert(@book2)
		@apa.insert(@book3)
		str = @apa.to_s.split(/\(/)
		expect(str[0]).to eq("Auan, V.M. ")
		
	end
	
# Las entradas de la lista de referencias debe estar en orden alfabético de acuerdo a los
# 	apellidos del primer autor de cada trabajo.
	it "La lista de referencias ordenada según APA" do
		@apa.insert(@book)
		@apa.insert(@book2)
		@apa.insert(@book3)
    	 expect(@apa.to_s).to be == "Auan, V.M. (1990).  Miguel de Unamuno  (2)  (3).  Catedra \n\nLiante, C. & Dalmeida, E. (1980).  Don Quijote  (4)  (2).  Anaya \n\nMoron, A.C. (1983).  La vida es sueño  (3)  (1).  Catedra \n\n"
	end

# Si tiene más de un artículo del (los) mismo autor(es) (referencias de un autor solo o referencias
# de múltiples autores con exactamente los mismos autores en exactamente el mismo
# orden de aparición) ordene de acuerdo al ano de publicación, comenzando con el más antiguo.
	it "Más de un artículo del (los) mismo autor(es) APA" do
	 	@journalArticle = JournalArticle.new(["Vincent asd"],"exclusiva enero","10/05/1980","hola!", 4,1, 0, 10)
	 	@journalArticle1 = JournalArticle.new(["Vincent asd"],"exclusiva enero","10/05/1987","hola!", 4,1, 0, 10)
	 	@journalArticle2 = JournalArticle.new(["Vincent asd"],"exclusiva enero","10/05/1983","hola!", 4,1, 0, 10)
	 	@apa.insert(@journalArticle)
	 	@apa.insert(@journalArticle1)
	 	@apa.insert(@journalArticle2)
 	

      	expect(@apa.to_s).to be == "asd, V. (10/05/1980).  exclusiva enero.  hola!,  10.\n\n asd, V. (10/05/1983).  exclusiva enero.  hola!,  10.\n\n asd, V. (10/05/1987).  exclusiva enero.  hola!,  10.\n\n "	
	end

# Cuando un autor aparezca tanto como un autor solo y, en otra cita, como el primer autor
# de un grupo, liste primero las entradas de un autor.
# Si est´a usando m´as de una referencia del mismo autor (o el mismo grupo de autores listados
# en el mismo orden) publicados en el mismo a˜no, organ´ıcelos en la lista de referencias
# alfab´eticamente de acuerdo al t´ıtulo del art´ıculo o del cap´ıtulo. Entonces asigne letras al
# a˜no como sufijos. Cuando se refiera a estas publicaciones en su escrito utilice las letras de
# sufijos con el a˜no para que el lector sepa a cu´al referencia se est´a refiriendo.
# Utilice & en lugar de ’y’ [o de ’and’ en las versiones en ingl´es] cuando liste varios autores
# de un solo trabajo.
# Todas las l´ıneas despu´es de la primera l´ınea de cada entrada en su lista de referencias deben
# tener una sangr´ıa de media pulgada desde el margen izquierdo. Es una sangr´ıa francesa.
# Ponga en may´usculas la primera letra de las palabras principales de los t´ıtulos de revistas



end