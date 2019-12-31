#:nodoc:
module Food
    # La clase +Impact_Plate+ permite recrear un plato de un menú alimenticio considerando además su impacto ambiental.
    # El plato se consituye por sus ingredientes, la cantidad de estos, y un nombre.
    class Impact_Plate < Plate
        #Kilogramos de CO2 generados en la producción del plato.
        attr_reader :co2_impact
        #Metro cuadrados de tierra necesarios para producir el plato.
        attr_reader :land_use

        # Constructor de la clase +Impact_Plate+.
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
        #   @plate = Food::Impact_Plate.new("Lentejas Deluxe", @lista, @lista_grams)
        def initialize(name, &block) #:notnew:
            @name = name
            @ingredients = List.new
            @ingredients_grams = List.new
            if block_given?
                if block.arity == 1
                    yield self
                else
                    instance_eval(&block)
                end
            end
            @co2_impact =  calculate_impact
            @land_use = calculate_land_use
        end

        # :category: Utilidades
        # Expresa el objeto como un string
        # Dato que retorna: String
        def to_s
            string = super.to_s
            string[string.length-1] = ". "
            string << "CO2: #{@co2_impact}, m2: #{@land_use})"
        end

        # :category: Utilidades
        # Función que permite comparar dos objetos +Impact_Plate+
        # === Parámetros
        # * +other+: Objeto +Impact_Plate+ con el que se realizará la comparación.
        # === Valor de retorno
        # Se pueden dar tres valores posibles:
        # * _-1_: _Self_ es menor que _other_
        # * _0_: _Self_ es igual que _other_ 
        # * _1_: _Self_ es mayor que _other_
        def <=>(other)
            return nil unless other.instance_of? Impact_Plate
            self.nutritional_footprint <=> other.nutritional_footprint
        end

        # :category: Obtención de datos.
        # Función que permite obtener la huella nutricional del plato.
        # === Valor de retorno
        # Dato que retorna: Float.
        # Se corresponde con la huella nutricional del plato.
        def nutritional_footprint
            (energy_indicator + carbon_indicator)/2.0
        end

        def alimento (food)
            if food[:ingrediente] then
                @ingredients.push(food[:ingrediente])
                if food[:gramos] then
                    @ingredients_grams.push(food[:gramos])
                else
                    @ingredients_grams.push(10)
                end
            end
        end

        private


        def calculate_impact
            co2_kg = 0.0
            @ingredients.each_with_index do |x, index|
                (co2_kg = co2_kg + (x.gases*100.round * @ingredients_grams[index]*100.round).truncate(3) / 10000000.0).round(3)
            end
            co2_kg
        end

        def calculate_land_use
            land_use = 0.0
            @ingredients.each_with_index do |x, index|
                land_use = land_use + (x.land_use*100.round * @ingredients_grams[index]*100.round).truncate(3) / 10000000.0
            end
            land_use
        end

        def energy_indicator
            if calculate_TCV < 670 then
                return 1.0
            elsif calculate_TCV > 830 then
                return 3.0
            else
                return 2.0
            end
        end

        def carbon_indicator
            if (co2_impact * 1000) < 800 then
                return 1.0
            elsif (co2_impact * 1000) > 1200 then
                return 3.0
            else
                return 2.0
            end
        end

    end
end