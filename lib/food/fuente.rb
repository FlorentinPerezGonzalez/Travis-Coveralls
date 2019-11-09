module Food
    class Food
        attr_reader :name, :gases, :land_use, :protein, :lipids, :carbohydrates

        def initialize(name, protein, carbohydrates, lipids, gases)
            @name = name
            @protein = protein
            @carbohydrates = carbohydrates
            @lipids = lipids
            @gases = gases
        end

        def to_s

        end

        def energetic_value

        end

    end
end