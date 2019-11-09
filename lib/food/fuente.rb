module Food
    class Food
        attr_reader :name, :gases, :land_use, :protein, :lipids, :carbohydrates

        def initialize(name, protein, carbohydrates)
            @name = name
            @protein = protein
            @carbohydrates = carbohydrates
        end

        def to_s

        end

        def energetic_value

        end

    end
end