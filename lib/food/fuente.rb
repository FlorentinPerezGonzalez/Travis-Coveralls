module Food
    class Food
        attr_reader :name, :gases, :land_use, :protein, :lipids, :carbohydrates

        def initialize(name, protein, carbohydrates, lipids, gases, land_use)
            @name = name
            @protein = protein
            @carbohydrates = carbohydrates
            @lipids = lipids
            @gases = gases
            @land_use = land_use
        end

        def to_s
            "{#@name, #@protein, #@carbohydrates, #@lipids, #@gases, #@land_use}"
        end

        def energetic_value
            (value = @protein*4.0 + @carbohydrates*4.0 + @lipids*9).truncate(3)
        end

    end
end