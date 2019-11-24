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
            grams = 0.0
            protein_grams = 0.0
            @ingredients.each_with_index do |x, index|
                protein_grams = protein_grams + ((@ingredients_grams[index] * 100).round) * ((x.protein*100).round) / 10000000.0
            end
            for x in @ingredients_grams do
                grams = grams + x
            end
            (protein_grams.round(2) / (grams.round(2))).truncate(3) * 100
        end

        def carbohydrates_percentage

        end

        def lipids_percentage
            grams = 0.0
            lipids_grams = 0.0
            @ingredients.each_with_index do |x, index|
                lipids_grams = lipids_grams + ((@ingredients_grams[index] * 100).round) * ((x.lipids*100).round) / 10000000.0
            end
            for x in @ingredients_grams do
                grams = grams + x
            end
            (lipids_grams.round(2) / (grams.round(2))).truncate(3) * 100
        end
    end
end