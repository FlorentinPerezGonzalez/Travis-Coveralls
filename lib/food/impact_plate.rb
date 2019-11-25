module Food
    class Impact_Plate < Plate
        attr_reader :co2_impact, :land_use
        def initialize(name, ingredients, ingredients_grams)
            super(name, ingredients, ingredients_grams)
            @co2_impact =  calculate_impact
        end

        private

        def calculate_impact
            co2_kg = 0.0
            @ingredients.each_with_index do |x, index|
                co2_kg = co2_kg + (x.gases*100.round * @ingredients_grams[index]*100.round).truncate(3) / 10000000.0
            end
            co2_kg
        end
    end
end