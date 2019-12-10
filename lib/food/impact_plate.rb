module Food
    class Impact_Plate < Plate
        attr_reader :co2_impact, :land_use
        def initialize(name, ingredients, ingredients_grams)
            super(name, ingredients, ingredients_grams)
            @co2_impact =  calculate_impact
            @land_use = calculate_land_use
        end

        def to_s
            string = super.to_s
            string[string.length-1] = ". "
            string << "CO2: #{@co2_impact}, m2: #{@land_use})"
        end

        def <=>(other)
            return nil unless other.instance_of? Impact_Plate
            self.nutritional_footprint <=> other.nutritional_footprint
        end

        def nutritional_footprint
            (energy_indicator + carbon_indicator)/2.0
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