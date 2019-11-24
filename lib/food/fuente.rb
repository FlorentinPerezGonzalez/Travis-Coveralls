module Food
    class Food
        include Comparable
        attr_reader :name, :gases, :land_use, :protein, :lipids, :carbohydrates

        def initialize(values)
            raise TypeError, "Se espera como argumento un hash de seis elementos" unless ((values.is_a?Hash) && (values.length == 6))
                @name = values[:name]
                @protein = values[:protein]
                @carbohydrates = values[:carbohydrates]
                @lipids = values[:lipids]
                @gases = values[:gas]
                @land_use = values[:land_use]
        end

        def to_s
            "{#@name, #@protein, #@carbohydrates, #@lipids, #@gases, #@land_use}"
        end

        def energetic_value
            (value = @protein*4.0 + @carbohydrates*4.0 + @lipids*9).truncate(3)
        end

        def portion_impact(protein_grams)
            [BigDecimal("#{portion_impact_co2(protein_grams)}"), BigDecimal("#{portion_impact_land(protein_grams)}")]
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