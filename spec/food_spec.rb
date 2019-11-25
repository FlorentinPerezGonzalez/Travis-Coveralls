require 'spec_helper'
RSpec.describe Food do
  it "has a version number" do
    expect(Food::VERSION).not_to be nil
  end

  context "Existencias de métodos" do
    before :each do
      @basic_food = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
    end

    it "Existe un método para obtener el nombre del alimento" do
      expect(@basic_food).to respond_to(:name)
    end
    it "Existe un método para obtener las emisiones de gases de efecto invernadero" do
      expect(@basic_food).to respond_to(:gases)
    end
    it "Existe un método para obtener el terreno utilizado" do
      expect(@basic_food).to respond_to(:land_use)
    end
    it "Existe un método para obtener el alimento formateado" do
      expect(@basic_food).to respond_to(:to_s)
    end
    it "Existe un método para obtener el valor energético de un alimento" do
      expect(@basic_food).to respond_to(:energetic_value)
    end
    it "Existe un método para obtener las proteínas de un alimento" do
      expect(@basic_food).to respond_to(:protein)
    end
    it "Existe un método para obtener los lípidos de un alimento" do
      expect(@basic_food).to respond_to(:lipids)
    end
    it "Existe un método para obtener los carbohidratos de un alimento" do
      expect(@basic_food).to respond_to(:carbohydrates)
    end
  end

  context "Funcionamiento de métodos getters asociados a las características íntegras de los alimentos" do
    before :each do
      @basic_food = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
    end

    it "El nombre del alimento es el correcto" do
      expect(@basic_food.name).to eq("Huevos")
    end
    it "La cantidad de proteínas del alimento es la correcta" do
      expect(@basic_food.protein).to eq(13.0)
    end
    it "La cantidad de carbohidratos del alimento es la correcta" do
      expect(@basic_food.carbohydrates).to eq(1.1)
    end
    it "La cantidad de lípidos del alimento es la correcta" do
      expect(@basic_food.lipids).to eq(11.0)
    end
  end #context

  context "Funcionamiento de métodos getters asociados a las implicaciones medioambientales de los alimentos" do
    before :each do
      @basic_food = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
    end

    it "La cantidad de gases de efecto invernadero asociados a la producción de un kilo del alimento es la correcta" do
      expect(@basic_food.gases).to eq(4.2)
    end
    it "La cantidad de terreno en m2 utilizados para la producción de un kilo del alimento es la correcta" do
      expect(@basic_food.land_use).to eq(5.7)
    end
  end #context


  it "La salida formateada de un alimento es la correcta" do
    huevos = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
    expect(huevos.to_s).to eq("{Huevos, 13.0, 1.1, 11.0, 4.2, 5.7}")
  end

  context "Pruebas sobre valores calóricos" do
    before :each do
      @huevos = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
      @carne_de_vaca = Food::Food.new({:name => 'Carne de vaca', :protein => 21.1, :carbohydrates => 0.0, :lipids => 3.1, :gas => 50.0, :land_use => 164.0})
      @cerveza = Food::Food.new({:name => 'Cerveza', :protein => 0.5, :carbohydrates => 3.6, :lipids => 0.0, :gas => 0.24, :land_use => 0.22})
      @cafe = Food::Food.new({:name => 'Cafe', :protein => 0.1, :carbohydrates => 0.0, :lipids => 0.0, :gas => 0.4, :land_use => 0.3})
    end

    it "El valor calórico de un alimento es el correcto" do
      expect(@huevos.energetic_value).to eq(155.4)
      expect(@carne_de_vaca.energetic_value).to eq(112.3)
      expect(@cerveza.energetic_value).to eq(16.4)
      expect(@cafe.energetic_value).to eq(0.4)
    end
  end

  context "Pruebas sobre el cálculo medioambiental de un hombre y una mujer adultas (20-39 años)" do
    before :each do
      @huevos = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
      @nuez = Food::Food.new({:name => 'Nuez', :protein => 20.0, :carbohydrates => 21.1, :lipids => 54.0, :gas => 0.3, :land_use => 7.9})
      @pollo = Food::Food.new({:name => 'Pollo', :protein => 20.6, :carbohydrates => 0.0, :lipids => 5.6, :gas => 5.7, :land_use => 7.1})
      @cerdo = Food::Food.new({:name => 'Cerdo', :protein => 21.5, :carbohydrates => 0.0, :lipids => 6.3, :gas => 7.6, :land_use => 11.0})
      @cerveza = Food::Food.new({:name => 'Cerveza', :protein => 0.5, :carbohydrates => 3.6, :lipids => 0.0, :gas => 0.24, :land_use => 0.22})
      @lentejas = Food::Food.new({:name => 'Lentejas', :protein => 23.5, :carbohydrates => 52.0, :lipids => 1.4, :gas => 0.4, :land_use => 3.4})
      @cafe = Food::Food.new({:name => 'Cafe', :protein => 0.1, :carbohydrates => 0.0, :lipids => 0.0, :gas => 0.4, :land_use => 0.3})
      @tofu = Food::Food.new({:name => 'Tofu', :protein => 8.0, :carbohydrates => 1.9, :lipids => 4.8, :gas => 2.0, :land_use => 2.2})
    end

    it "Existe un método para calcular proporciones basadas en las proteínas" do
      expect(@huevos).to respond_to(:portion_impact)
    end
    it "Existe un método para calcular proporciones basadas en las proteínas que recibe un argumento" do
      expect(@huevos).to respond_to(:portion_impact).with(1).arguments
    end
    it "El método que calcula proporciones basadas en las proteínas funciona correctamente" do
      expect(@huevos.portion_impact(26)).to eq([8.4, 11.4])
    end
    it "Se calcula correctamente el impacto ambiental de un hombre adulto" do
      solution = [0.0, 0.0]
      hombre = [{:food => @huevos, :protein_grams => 15}, {:food => @cerdo, :protein_grams => 23}, {:food => @pollo, :protein_grams => 15}, {:food => @cerveza, :protein_grams => 1}]
      hombre.each do |x|
        solution = solution.zip(x[:food].portion_impact(x[:protein_grams])).map { |a, b| a + b}
      end
      expect(solution).to eq([17.606,23.954])
    end
    it "Se calcula correctamente el impacto ambiental de una mujer adulta" do
      solution = [0.0, 0.0]
      mujer = [{:food => @lentejas, :protein_grams => 20}, {:food => @tofu, :protein_grams => 13}, {:food => @nuez, :protein_grams => 7}, {:food => @cafe, :protein_grams => 1}]
      mujer.each do |x|
        solution = solution.zip(x[:food].portion_impact(x[:protein_grams])).map { |a, b| a + b}
      end
      expect(solution).to eq([7.695,12.234])
    end
  end
  context "Food es comparable" do
    before :each do
      @huevos = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
      @nuez = Food::Food.new({:name => 'Nuez', :protein => 20.0, :carbohydrates => 21.1, :lipids => 54.0, :gas => 0.3, :land_use => 7.9})
      @pollo = Food::Food.new({:name => 'Pollo', :protein => 20.6, :carbohydrates => 0.0, :lipids => 5.6, :gas => 5.7, :land_use => 7.1})
    end
    it "Food tiene el módulo Comparable" do
      expect(Food::Food.ancestors.select {|x| x.class == Module}).to eq([Comparable, Kernel])
    end
    it "Se compara un alimento adecuadamente con otro" do
      expect(@huevos < @nuez).to eq(true)
      expect(@nuez > @pollo).to eq(true)
      expect(@huevos >= @pollo).to eq(true)
      expect(@huevos == @huevos).to eq(true)
      expect(@huevos == @pollo).to eq(false)
      expect(@pollo <= @nuez).to eq(true)
    end
  end
end #describe

RSpec.describe Food::List do
  context "Instancias de la clase lista y acceso a sus atributos. Existencia de nodos" do
    it "Instanciación con new" do
      lista = Food::List.new
      expect(lista).not_to be(nil)
    end
    it "Existen nodos" do
      nodo = Food::List::Node.new(nil,nil,nil)
      expect(nodo).not_to be(nil)
    end
    it "Los nodos poseen una referencia al nodo siguiente en la lista" do
      expect(Food::List::Node.new(nil,nil,nil)).to respond_to(:next)
    end
    it "Los nodos poseen una referencia al nodo anterior en la lista" do
      expect(Food::List::Node.new(nil,nil,nil)).to respond_to(:prev)
    end
    it "Los nodos poseen un valor" do
      expect(Food::List::Node.new(nil,nil,nil)).to respond_to(:value)
    end
    it "La clase lista posee una referencia a head" do
      expect(Food::List.new).to respond_to(:head)
    end
    it "La clase lista posee una referencia a head" do
      expect(Food::List.new).to respond_to(:tail)
    end
  end

  context "Métodos propios de los nodos" do
    it "La salida foramateada de los nodos es la correcta" do
      nodo = Food::List::Node.new(1,nil,nil)
      expect(nodo.to_s).to eq("(1)")
    end
  end

  context "Existencia de métodos en las listas" do
    before :each do
      @list = Food::List.new
    end
    it "Existe un método para añadir un nodo por la cola" do
      expect(@list).to respond_to(:push)
    end
    it "Existe un método para añadir un nodo por la cabeza" do
      expect(@list).to respond_to(:unshift)
    end
    it "Existe un método que devuleve la lista como un array" do
      expect(@list).to respond_to(:to_a)
    end
    it "Existe un método que permite insertar múltiples valores desde head" do
      expect(@list).to respond_to(:pushVarious)
    end
    it "Existe un método que permite insertar múltiples valores desde tail" do
      expect(@list).to respond_to(:unshiftVarious)
    end
    it "Existe un método para extraer de la lista desde tail" do
      expect(@list).to respond_to(:pop)
    end
    it "Existe un método para extraer de la lista desde head" do
      expect(@list).to respond_to(:shift)
    end
    it "Existe un método para borrar toda la lista" do
      expect(@list).to respond_to(:clear)
    end
    it "Existe un método que permite borrar un nodo específico partiendo de tail" do
      expect(@list).to respond_to(:erase_from_tail)
    end
    it "Existe un método que permite borrar un nodo específico partiendo de head" do
      expect(@list).to respond_to(:erase_from_head)
    end
    it "Existe un método que permite buscar un nodo específico partiendo de head" do
      expect(@list).to respond_to(:find_from_head)
    end
    it "Existe un método que permite buscar un nodo específico partiendo de tail" do
      expect(@list).to respond_to(:find_from_tail)
    end
  end
  context "Operaciones de insercción en las listas" do
    before :each do
      @list = Food::List.new
    end
    it "La salida formateada de una lista es la correcta" do
      expect(@list.to_a).to eq([])
    end
    it "Se inserta con push adecuadamente" do
      @list.push(3)
      expect(@list.to_a).to eq([3])
    end
    it "Se inserta con unshift adecuadamente" do
      @list.unshift(3)
      expect(@list.to_a).to eq([3])
    end
    it "Se inserta con pushVarious adecuadamente" do
      @list.pushVarious([2,3])
      expect(@list.to_a).to eq([2,3])
    end
    it "Se inserta con unshiftVarious adecuadamente" do
      @list.unshiftVarious([2,3])
      expect(@list.to_a).to eq([3,2])
    end
  end
  context "Operaciones de eliminación en las listas" do
    before :each do
      @list = Food::List.new
      @list.pushVarious([1,2,3,4])
    end
    it "Se elimina con pop adecuadamente" do
      @list.pop
      expect(@list.to_a).to eq([1,2,3])
    end
    it "Se elimina con shift adecuadamente" do
      @list.shift
      expect(@list.to_a).to eq([2,3,4])
    end
    it "Se elimina con erase_from_head adecuadamente" do
      @list.erase_from_head(2)
      expect(@list.to_a).to eq([1,3,4])
    end
    it "Se elimina con erase_from_tail adecuadamente" do
      @list.erase_from_tail(3)
      expect(@list.to_a).to eq([1,2,4])
    end
    it "Se elimina con clear adecuadamente" do
      @list.clear
      expect(@list.to_a).to eq([])
    end
  end
  context "Operaciones de búsqueda en las listas" do
    before :each do
      @list = Food::List.new 
      @list.pushVarious([2,0,4,3])
    end
    it "Se encuentran elementos adecuadamente con find_from_head" do
      expect(@list.find_from_head(3)).to eq(3)
    end
    it "Se encuentran elementos adecuadamente con find_from_tail" do
      expect(@list.find_from_tail(3)).to eq(-1)
    end
    it "No se encuentra un elemento inexistente con find_from_head" do
      expect(@list.find_from_head(8)).to eq(nil)
    end
    it "No se encuentra un elemento inexistente con find_from_tail" do
      expect(@list.find_from_tail(8)).to eq(nil)
    end
  end
  context "Operaciones adicionales con listas" do
    before :each do
      @list = Food::List.new
      @list.pushVarious([2,0,4,3])
    end
    it "Existe un método each" do
      expect(@list).to respond_to(:each)
    end
    it "Métodos propios de Enumerable funcionan correctamente" do
      expect(@list.min).to eq(0)
      expect(@list.max).to eq(4)
      expect(@list.count).to eq(4)
      expect(@list.map{|x| x*2}).to eq([4,0,8,6])
      expect(@list.find{|x| x == 4}).to eq(4)
    end
    it "Existe un método []" do
      expect(@list).to respond_to(:[])
    end
    it "El método [] funciona correctamente" do
      expect(@list[:head]).to eq(2)
      expect(@list[:tail]).to eq(3)
      expect(@list["head"]).to eq(2)
      expect(@list["tail"]).to eq(3)
      expect(@list[:word]).to eq(nil)
      expect(@list["word"]).to eq(nil)
      expect(@list[99]).to eq(nil)
      expect(@list[2]).to eq(4)
      expect(@list[-2]).to eq(4)
    end
  end
  context "Cálculos sobre distintas dietas" do
    before :each do
      @huevos = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
      @cordero = Food::Food.new({:name => 'Cordero', :protein => 18.0, :carbohydrates => 0.0, :lipids => 17.0, :gas => 20.0, :land_use => 185.0})
      @lentejas = Food::Food.new({:name => 'Lentejas', :protein => 23.5, :carbohydrates => 52.0, :lipids => 1.4, :gas => 0.4, :land_use => 3.4})
      @cerveza = Food::Food.new({:name => 'Cerveza', :protein => 0.5, :carbohydrates => 3.6, :lipids => 0.0, :gas => 0.24, :land_use => 0.22})
      @chocolate = Food::Food.new({:name => 'Chocolate', :protein => 5.3, :carbohydrates => 47.0, :lipids => 30.0, :gas => 2.3, :land_use => 3.4})
      @vaca = Food::Food.new({:name => 'Vaca', :protein => 21.1, :carbohydrates => 0.0, :lipids => 3.1, :gas => 50.0, :land_use => 164.0})
      @nuez = Food::Food.new({:name => 'Nuez', :protein => 20.0, :carbohydrates => 21.1, :lipids => 54.0, :gas => 0.3, :land_use => 7.9})
      @queso = Food::Food.new({:name => 'Queso', :protein => 25.0, :carbohydrates => 1.3, :lipids => 33.0, :gas => 11.0, :land_use => 41.0})
      @leche = Food::Food.new({:name => 'Leche', :protein => 3.3, :carbohydrates => 4.8, :lipids => 3.2, :gas => 3.2, :land_use => 8.9})
      @tofu = Food::Food.new({:name => 'Tofu', :protein => 8.0, :carbohydrates => 1.9, :lipids => 4.8, :gas => 2.0, :land_use => 2.2})
      @cafe = Food::Food.new({:name => 'Cafe', :protein => 0.1, :carbohydrates => 0.0, :lipids => 0.0, :gas => 0.4, :land_use => 0.3})
      @pollo = Food::Food.new({:name => 'Pollo', :protein => 20.6, :carbohydrates => 0.0, :lipids => 5.6, :gas => 5.7, :land_use => 7.1})
      @dieta_espanola = Food::List.new
      @dieta_espanola.pushVarious([@cordero, @lentejas, @chocolate, @queso, @cerveza, @nuez])
      @dieta_vasca = Food::List.new
      @dieta_vasca.pushVarious([@lentejas, @chocolate, @chocolate, @leche])
      @dieta_vegetariana = Food::List.new
      @dieta_vegetariana.pushVarious([@nuez, @nuez, @leche, @leche, @huevos, @chocolate, @lentejas, @tofu])
      @dieta_vegetaliana = Food::List.new
      @dieta_vegetaliana.pushVarious([@tofu, @tofu, @tofu, @tofu, @lentejas, @nuez, @chocolate, @cafe])
      @locura_carne = Food::List.new
      @locura_carne.pushVarious([@vaca, @cordero, @pollo, @lentejas, @queso, @leche])
    end
    it "Cálculo de las emisiones diarias de gases de efecto invernadero para cada dieta" do
      solution = 0.0
      @dieta_espanola.each{|x| solution = solution + x.gases}
      expect(solution.round(2)).to eq(34.24)
      solution = 0.0
      @dieta_vasca.each{|x| solution = solution + x.gases}
      expect(solution.round(2)).to eq(8.2)
      solution = 0.0
      @dieta_vegetaliana.each{|x| solution = solution + x.gases}
      expect(solution.round(2)).to eq(11.4)
      solution = 0.0
      @dieta_vegetariana.each{|x| solution = solution + x.gases}
      expect(solution.round(2)).to eq(15.9)
      solution = 0.0
      @locura_carne.each{|x| solution = solution + x.gases}
      expect(solution.round(2)).to eq(90.3)
    end
    it "Emisiones anuales de gases de efecto invernadero para cada dieta" do
      solution = 0.0
      @dieta_espanola.each{|x| solution = solution + x.gases*365}
      expect(solution.round(2)).to eq(12497.6)
      solution = 0.0
      @dieta_vasca.each{|x| solution = solution + x.gases*365}
      expect(solution.round(2)).to eq(2993.0)
      solution = 0.0
      @dieta_vegetaliana.each{|x| solution = solution + x.gases*365}
      expect(solution.round(2)).to eq(4161.0)
      solution = 0.0
      @dieta_vegetariana.each{|x| solution = solution + x.gases*365}
      expect(solution.round(2)).to eq(5803.5)
      solution = 0.0
      @locura_carne.each{|x| solution = solution + x.gases*365}
      expect(solution.round(2)).to eq(32959.5)
    end
    it "Estimaciones de uso de terreno para cada dieta" do
      solution = 0.0
      @dieta_espanola.each{|x| solution = solution + x.land_use}
      expect(solution.round(2)).to eq(240.92)
      solution = 0.0
      @dieta_vasca.each{|x| solution = solution + x.land_use}
      expect(solution.round(2)).to eq(19.1)
      solution = 0.0
      @dieta_vegetaliana.each{|x| solution = solution + x.land_use}
      expect(solution.round(2)).to eq(23.8)
      solution = 0.0
      @dieta_vegetariana.each{|x| solution = solution + x.land_use}
      expect(solution.round(2)).to eq(48.3)
      solution = 0.0
      @locura_carne.each{|x| solution = solution + x.land_use}
      expect(solution.round(2)).to eq(409.4)
    end
  end
  context "Comparaciones adecuadas en una lista de alimentos" do
    before :each do
      @huevos = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
      @cordero = Food::Food.new({:name => 'Cordero', :protein => 18.0, :carbohydrates => 0.0, :lipids => 17.0, :gas => 20.0, :land_use => 185.0})
      @lentejas = Food::Food.new({:name => 'Lentejas', :protein => 23.5, :carbohydrates => 52.0, :lipids => 1.4, :gas => 0.4, :land_use => 3.4})
      @chocolate = Food::Food.new({:name => 'Chocolate', :protein => 5.3, :carbohydrates => 47.0, :lipids => 30.0, :gas => 2.3, :land_use => 3.4})
      @lista = Food::List.new
      @lista.pushVarious([@huevos, @cordero, @lentejas])
    end
    it "El método collect funciona correctamente" do
      expect((1..4).collect { @huevos }).to eq([@huevos, @huevos, @huevos, @huevos])
    end
    it "El método max funciona correctamente" do
      expect(@lista.max).to eq(@lentejas)
    end
    it "El método min funciona correctamente" do
      expect(@lista.min).to eq(@huevos)
    end
    it "El método sort funciona correctamente" do
      expect(@lista.sort).to eq([@huevos, @cordero, @lentejas])
    end
    it "El método select funciona correctamente" do
      expect(@lista.select { |x| x > @cordero}).to eq([@lentejas])
    end
  end
end

RSpec.describe Food::Plate do
  describe "Pruebas iniciales sobre Plate" do
    it "Plate tiene un constructor con 3 argumentos" do
      expect(Food::Plate).to respond_to(:new).with(3).arguments
    end
    before :each do
      @huevos = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
      @cordero = Food::Food.new({:name => 'Cordero', :protein => 18.0, :carbohydrates => 0.0, :lipids => 17.0, :gas => 20.0, :land_use => 185.0})
      @lentejas = Food::Food.new({:name => 'Lentejas', :protein => 23.5, :carbohydrates => 52.0, :lipids => 1.4, :gas => 0.4, :land_use => 3.4})
      @lista = Food::List.new
      @lista.pushVarious([@huevos, @cordero, @lentejas])
      @lista_grams = Food::List.new
      @lista_grams.pushVarious([10, 20, 30])
    end
    it "Plate tiene definido un conjunto de alimentos" do
      expect(Food::Plate.new("Lentejas Deluxe", @lista, @lista_grams)).to respond_to(:ingredients)
    end
    it "Plate tienen definido un conjunto de cantidades de alimentos" do
      expect(Food::Plate.new("Lentejas Deluxe", @lista, @lista_grams)).to respond_to(:ingredients_grams)
    end
    it "Se obtiene correctamente el nombre de un plato" do
      expect(Food::Plate.new("Lentejas Deluxe", @lista, @lista_grams).name).to eq("Lentejas Deluxe")
    end
    it "Se obtienen correctamente los ingredientes de un plato" do
      expect(Food::Plate.new("Lentejas Deluxe", @lista, @lista_grams).ingredients.to_a).to eq([@huevos, @cordero, @lentejas])
    end
    it "Se obtienen correctamente los gramos de ingredientes de un plato" do
      expect(Food::Plate.new("Lentejas Deluxe", @lista, @lista_grams).ingredients_grams.to_a).to eq([10, 20, 30])
    end
  end
  context "Prueba de método de Plate" do
    before :each do
      @huevos = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
      @cordero = Food::Food.new({:name => 'Cordero', :protein => 18.0, :carbohydrates => 0.0, :lipids => 17.0, :gas => 20.0, :land_use => 185.0})
      @lentejas = Food::Food.new({:name => 'Lentejas', :protein => 23.5, :carbohydrates => 52.0, :lipids => 1.4, :gas => 0.4, :land_use => 3.4})
      @lista = Food::List.new
      @lista.pushVarious([@huevos, @cordero, @lentejas])
      @lista_grams = Food::List.new
      @lista_grams.pushVarious([10, 20, 30])
      @plate = Food::Plate.new("Lentejas Deluxe", @lista, @lista_grams)
    end
    it "Existe un método que calcula el % de proteínas" do
      expect(@plate).to respond_to(:protein_percentage)
    end
    it "Existe un método que calcula el % de carbohidratos" do
      expect(@plate).to respond_to(:carbohydrates_percentage)
    end
    it "Existe un método que calcula el % de lípidos" do
      expect(@plate).to respond_to(:lipids_percentage)
    end
    it "Se obtiene el procentaje de proteínas correcto" do
      expect(@plate.protein_percentage).to eq(36.6)
    end
    it "Se obtiene el procentaje de lípidos correcto" do
      expect(@plate.lipids_percentage).to eq(15.0)
    end
    it "Se obtiene el procentaje de carbohidratos correcto" do
      expect(@plate.carbohydrates_percentage).to eq(48.3)
    end
    it "Se obtiene el alimento formateado" do
      expect(@plate.to_s).to eq("(Lentejas Deluxe: 10 gramos de Huevos, 20 gramos de Cordero, 30 gramos de Lentejas)")
    end
    it "Existe un método para calcular V.C.T del plato" do
      expect(@plate).to respond_to(:calculate_TCV)
    end
    it "El T.C.V de un plato es el correcto" do
      expect(@plate.calculate_TCV).to eq(15.492)
    end
  end
end

RSpec.describe Food::Impact_Plate do
  before :each do
    @huevos = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
    @cordero = Food::Food.new({:name => 'Cordero', :protein => 18.0, :carbohydrates => 0.0, :lipids => 17.0, :gas => 20.0, :land_use => 185.0})
    @lentejas = Food::Food.new({:name => 'Lentejas', :protein => 23.5, :carbohydrates => 52.0, :lipids => 1.4, :gas => 0.4, :land_use => 3.4})
    @lista = Food::List.new
    @lista.pushVarious([@huevos, @cordero, @lentejas])
    @lista_grams = Food::List.new
    @lista_grams.pushVarious([10, 20, 30])
  end
  context "Naturaleza de Impact_Plate" do
    it "Impact_Plate es hija de Plate" do
      expect(Food::Impact_Plate.superclass).to eq(Food::Plate)
    end
    it "Impact_Plate también es un plato" do
      expect(Food::Impact_Plate.new("Lentejas Deluxe", @lista, @lista_grams)).to be_kind_of(Food::Plate)
    end
    it "Los objetos Impact_Plate son instancian de Food::Impact_Plate" do
      expect(Food::Impact_Plate.new("Lentejas Deluxe", @lista, @lista_grams)).to be_instance_of(Food::Impact_Plate)
    end
  end
  context "Funcionamiento y estructura de la clase Impact_Plate" do
    before :each do
      @impact_plate = Food::Impact_Plate.new("Lentejas Deluxe", @lista, @lista_grams)
    end
    it "Impact_Plate tiene un método para calcular las emisiones diarias de gases de efecto invernadero necesarias para la creación del plato" do
      expect(@impact_plate).to respond_to(:co2_impact)
    end
    it "Impact_Plate tiene un método para calcular la estimación de terreno necesaria para la creación del plato" do
      expect(@impact_plate).to respond_to(:land_use)
    end
    it "Se obtiene el impacto en gases de efecto invernadero de un plato adecuamente" do
      expect(@impact_plate.co2_impact).to eq(0.454)
    end
    it "Se obtiene el la estimación de terreno necesario para producir un plato adecuamente" do
      expect(@impact_plate.land_use).to eq(3.859)
    end
    it "Se obtiene una salida formateada correcta" do
      expect(@impact_plate.to_s).to eq("(Lentejas Deluxe: 10 gramos de Huevos, 20 gramos de Cordero, 30 gramos de Lentejas. CO2: 0.454, m2: 3.859)")
    end
  end
end