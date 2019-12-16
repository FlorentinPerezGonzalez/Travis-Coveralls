#:nodoc:
module Food
    # La clase _Food_ permite instanciar objetos que, en la práctica, son simulaciones de alimentos.
    # Los alimentos se caracterizan por sus nutrientes y el impacto ambiental asociado a su producción.
    class Food
        include Comparable
        
        #Nombre del alimento que representa el objeto.
        attr_reader :name
        #Gases de efecto de invernadero (Kg) que genera la producción de un Kg del alimento. 
        attr_reader :gases
        #Tierra necesaria (m2) para producir un Kg del alimento 
        attr_reader :land_use
        #Gramos de proteínas en una porción del alimento. 
        attr_reader :protein
        #Gramos de lípidos en una porción del alimento. 
        attr_reader :lipids
        #Gramos de carbohidratos en una porcioón del alimento. 
        attr_reader :carbohydrates

        # Constructor de la clase +Food+.
        # === Parámetros
        # * +values+: Se trata de un +Hash+ de longitud seis en el que se especifican todos los parámetros del alimento.
        # ==== Claves de values
        # * +:name+: Nombre del alimento que representa el objeto.
        # * +:gases+: Gases de efecto de invernadero (Kg) que genera la producción de un Kg del alimento.
        # * +:land_use+: Tierra necesaria (m2) para producir un Kg del alimento
        # * +:protein+: Gramos de proteínas en una porción del alimento.
        # * +:lipids+: Gramos de lípidos en una porción del alimento.
        # * +:carbohydrates+: Gramos de carbohidratos en una porcioón del alimento.
        # === Excepciones
        # * +TypeError+: Si el parámetro no es un hash o si su longitud no es de seis elementos
        # === Ejemplos
        #   huevos = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
        def initialize(values) #:notnew:
            raise TypeError, "Se espera como argumento un hash de seis elementos" unless ((values.is_a?Hash) && (values.length == 6))
                @name = values[:name]
                @protein = values[:protein]
                @carbohydrates = values[:carbohydrates]
                @lipids = values[:lipids]
                @gases = values[:gas]
                @land_use = values[:land_use]
        end

        # :category: Utilidades
        # Expresa el objeto como un string
        # <b>Dato que retorna:</b> String
        def to_s
            "{#@name, #@protein, #@carbohydrates, #@lipids, #@gases, #@land_use}"
        end

        # :category: Características
        # Función que permite calcular el valor energético de un plato
        # <b>Dato que retorna+:</b> Float
        def energetic_value
            (value = @protein*4.0 + @carbohydrates*4.0 + @lipids*9).truncate(3)
        end

        # :category: Características
        # Función que permite calcular el impacto ambiental de un alimento a través de especificar una porción del mismo que se calcula a través de la proteínas contenias en esta.
        # === Parámetros
        # * +protein_grams+: Gramos de proteínas que tendrá la porción sobre la cual desea trabajar.
        # === Valor de retorno
        # <b>Dato que retorna</b>: [Float, Float]
        # El array que retorna la función está formado por los gases generados para la producción de la porción y por los m2 necesarios para producirla.
        def portion_impact(protein_grams)
            [BigDecimal("#{portion_impact_co2(protein_grams)}"), BigDecimal("#{portion_impact_land(protein_grams)}")]
        end

        # :category: Utilidades
        # Función que permite comparar dos objetos +Food+
        # === Parámetros
        # * +other+: Objeto +Food+ con el que se realizará la comparación.
        # === Valor de retorno
        # Se pueden dar tres valores posibles:
        # * _-1_: _Self_ es menor que _other_
        # * _0_: _Self_ es igual que _other_ 
        # * _1_: _Self_ es mayor que _other_
        def <=>(other)
            return nil unless other.instance_of? Food
            [self.energetic_value, self.gases, self.land_use] <=> [other.energetic_value, other.gases, other.land_use]
        end

        private

        def portion_impact_co2(protein_grams)
            ((protein_grams * 100).round * (@gases * 100).round / (@protein * 100) / 100).round(3)
        end

        def portion_impact_land(protein_grams)
            ((protein_grams * 100).round * (@land_use * 100).round / (@protein * 100) / 100).round(3)
        end
    end
end