module Food
  class List
    Node = Struct.new(:value, :next, :prev)
    attr_reader :head, :tail

    class Node
      undef min, max, value=
      def to_s
          "(#{value.to_s})"
      end
    end

    def push(value)
      
    end

    def unshift(value)
      
    end

    def to_a
      
    end

    def pushVarious(values)
      
    end

    def unshiftVarious(values)
      
    end

    def pop
      
    end

    def shift
      
    end

    def clear
      
    end
    
  end
end