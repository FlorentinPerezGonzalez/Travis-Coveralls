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
      aux_node = @head
      a = []
      while aux_node != nil do
        a << aux_node.value
        aux_node = aux_node[:next]
      end
      a
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
    

    def erase_from_tail(value)
      
    end

    def erase_from_head(value)

    end

    def find_from_head(value)

    end

    def find_from_tail(value)

    end
  end
end