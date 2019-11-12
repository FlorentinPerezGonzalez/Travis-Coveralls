module Food
    class Food
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

        end
    end
end