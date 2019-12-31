module Food
    class Menu
        attr_reader :price
        attr_reader :name
        @@default_price = 5.0
        def initialize(name, &block)
            @name = name
            @plate_list = List.new
            @price_list = List.new
            if block_given?
                if block.arity == 1
                    yield self
                else
                    instance_eval(&block)
                end
            end
            @price = calculate_price
        end

        def componente(plate)
            if plate[:plato] then
                @plate_list.push(plate[:plato])
                if plate[:precio] then
                    @price_list.push(plate[:precio])
                else
                    @price_list.push(@@default_price)
                end
            end
        end

        def self.set_default_price(price)
            raise TypeError "Se espera un argumento numérico" unless price.is_a?(Numeric)
            
            @@default_price = price
        end

        def to_s
            
        end

        def calculate_TCV

        end

        def calculate_impact

        end

        private

        def calculate_price
            
        end

    end
end    