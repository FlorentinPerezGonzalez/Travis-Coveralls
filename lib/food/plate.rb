module Food
    class Plate
        attr_reader :ingredients, :ingredients_grams, :name
        def initialize(name, ingredients, ingredients_grams)
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

        def protein_percentage

        end

        def carbohydrates_percentage

        end

        def lipids_percentage

        end
    end
end