#:nodoc:
module Food
    # La clase +Plate+ permite recrear un plato de un menú alimenticio.
    # El plato se consituye por sus ingredientes, la cantidad de estos, y un nombre.
    class Plate
        include Comparable

        #Lista de ingredientes. Se corresponde con un objeto +List+ de +Food+.
        attr_reader :ingredients 
        #Lista de flotantes. Cada flotante se corresponde con la cantidad en gramos de un alimento.
        attr_reader :ingredients_grams
        #Nombre del plato.
        attr_reader :name

        # Constructor de la clase +Plate+.
        # === Parámetros
        # * +name+: Nombre del plato.
        # * +ingredients+: Lista de objetos +Food+.
        # * +ingredients_grams+: Lista de flotantes que representan cantidades de los alimentos establecidos en _ingredients_,
        # === Excepciones
        # * +TypeError+: Si +name+ no es un String.
        # * +TypeError+: Si +ingredients+ no es un objeto List.
        # * +TypeError+: Si +ingredients_grams+ no es un objeto List.
        # * +TypeError+: Si +ingredients no contiene exclusivamente objetos Food.
        # * +TypeError+: Si +ingredients_grams+ no contiene exclusivamente objetos Numeric.
        # * +ArgumentError+: Si +ingredients+ y +ingredients_grams+ no tienen el mismo tamaño.
        # === Ejemplos
        #   @huevos = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
        #   @cordero = Food::Food.new({:name => 'Cordero', :protein => 18.0, :carbohydrates => 0.0, :lipids => 17.0, :gas => 20.0, :land_use => 185.0})
        #   @lentejas = Food::Food.new({:name => 'Lentejas', :protein => 23.5, :carbohydrates => 52.0, :lipids => 1.4, :gas => 0.4, :land_use => 3.4})
        #   @lista = Food::List.new
        #   @lista.pushVarious([@huevos, @cordero, @lentejas])
        #   @lista_grams = Food::List.new
        #   @lista_grams.pushVarious([10, 20, 30])
        #   @plate = Food::Plate.new("Lentejas Deluxe", @lista, @lista_grams)
        def initialize(name, ingredients, ingredients_grams) #:notnew:
            raise TypeError "Se espera un string como primer argumento. Se obtuvo #{name.class.name}" unless name.is_a?(String)
            raise TypeError "Se espera una lista como segundo argumento. Se obtuvo #{ingredients.class.name}" unless ingredients.instance_of?(List)
            raise TypeError "Se espera una lista como tercer argumento. Se obtuvo #{ingredients_grams.class.name}" unless ingredients_grams.instance_of?(List)
            raise ArgumentError "Se espera que como segundo y tercer argumento dos listas de igual longitud" unless (ingredients.count() == ingredients_grams.count())
            ingredients.each {|x| raise TypeError "El segundo argumento debe ser una lista solo de alimentos" unless x.instance_of?(Food)}
            ingredients_grams.each {|x| raise TypeError "El tercer argumento debe ser una lista solo de valores numéricos" unless x.is_a?(Numeric)}
            
            @name = name
            @ingredients = ingredients
            @ingredients_grams = ingredients_grams
        end

        # :category: Obtención de datos.
        # Función que permite obtener el porcentaje de proteínas de un plato.
        # === Valor de retorno
        # Dato que retorna: Float.
        # Se corresponde con el porcentaje de proteínas calculado.
        def protein_percentage
            protein_grams = 0.0
            carbohydrates_grams = 0.0
            lipids_grams = 0.0
            @ingredients.each_with_index do |x, index|
                protein_grams = protein_grams + ((@ingredients_grams[index] * 100).round) * ((x.protein*100).round) / 10000000.0
                carbohydrates_grams = carbohydrates_grams + ((@ingredients_grams[index] * 100).round) * ((x.carbohydrates*100).round) / 10000000.0
                lipids_grams = lipids_grams + ((@ingredients_grams[index] * 100).round) * ((x.lipids*100).round) / 10000000.0
            end
            (protein_grams.round(2) / (protein_grams.round(2) + carbohydrates_grams.round(2) + lipids_grams.round(2))).truncate(3) * 100
        end

        # :category: Obtención de datos.
        # Función que permite obtener el porcentaje de carbohidratos de un plato.
        # === Valor de retorno
        # Dato que retorna: Float.
        # Se corresponde con el porcentaje de carbohidratos calculado.
        def carbohydrates_percentage
            protein_grams = 0.0
            carbohydrates_grams = 0.0
            lipids_grams = 0.0
            @ingredients.each_with_index do |x, index|
                protein_grams = protein_grams + ((@ingredients_grams[index] * 100).round) * ((x.protein*100).round) / 10000000.0
                carbohydrates_grams = carbohydrates_grams + ((@ingredients_grams[index] * 100).round) * ((x.carbohydrates*100).round) / 10000000.0
                lipids_grams = lipids_grams + ((@ingredients_grams[index] * 100).round) * ((x.lipids*100).round) / 10000000.0            
            end
            (carbohydrates_grams.round(2) / (protein_grams.round(2) + carbohydrates_grams.round(2) + lipids_grams.round(2))).truncate(3) * 100
        end

        # :category: Obtención de datos.
        # Función que permite obtener el porcentaje de lípidos de un plato.
        # === Valor de retorno
        # Dato que retorna: Float.
        # Se corresponde con el porcentaje de lípidos calculado.
        def lipids_percentage
            protein_grams = 0.0
            carbohydrates_grams = 0.0
            lipids_grams = 0.0
            @ingredients.each_with_index do |x, index|
                protein_grams = protein_grams + ((@ingredients_grams[index] * 100).round) * ((x.protein*100).round) / 10000000.0
                carbohydrates_grams = carbohydrates_grams + ((@ingredients_grams[index] * 100).round) * ((x.carbohydrates*100).round) / 10000000.0
                lipids_grams = lipids_grams + ((@ingredients_grams[index] * 100).round) * ((x.lipids*100).round) / 10000000.0            
            end
            (lipids_grams.round(2) / (protein_grams.round(2) + carbohydrates_grams.round(2) + lipids_grams.round(2))).truncate(3) * 100
        end

        # :category: Utilidades
        # Expresa el objeto como un string
        # Dato que retorna: String
        def to_s
            solution = "(#{@name}:"
            @ingredients.each_with_index do |x, index|
                solution = solution + " #{ingredients_grams[index]} gramos de #{x.name},"
            end
            solution[solution.length-1]=")"
            solution
        end

        # :category: Obtención de datos.
        # Función que permite obtener el valor nutricional en kilocalorías del plato.
        # === Valor de retorno
        # Dato que retorna: Float.
        # Se corresponde con el valor nutricional del plato calculado.
        def calculate_TCV
            solution = 0.0
            @ingredients.each_with_index do |x, index|
                solution = solution + (((@ingredients_grams[index] * 100).round) * ((x.protein*100).round) / 1000000.0) * 4
                solution = solution + (((@ingredients_grams[index] * 100).round) * ((x.carbohydrates*100).round) / 1000000.0) * 4
                solution = solution + (((@ingredients_grams[index] * 100).round) * ((x.lipids*100).round) / 1000000.0) * 9
            end
            solution
        end

        # :category: Utilidades
        # Función que permite comparar dos objetos +Plate+
        # === Parámetros
        # * +other+: Objeto +Plate+ con el que se realizará la comparación.
        # === Valor de retorno
        # Se pueden dar tres valores posibles:
        # * _-1_: _Self_ es menor que _other_
        # * _0_: _Self_ es igual que _other_ 
        # * _1_: _Self_ es mayor que _other_
        def <=>(other)
            return nil unless other.is_a?(Plate)
            self.calculate_TCV <=> other.calculate_TCV
        end
    end
end