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
      if @head == nil then
        @head = Node.new(value, nil, @tail)
        @tail = @head
        @size = 1
      else
        aux_node = Node.new(value, nil, @tail)
        @tail[:next] = aux_node
        @tail = aux_node
        @size = @size + 1
      end
    end

    def unshift(value)
      if @head == nil then
        @head = Node.new(value, nil, @tail)
        @tail = @head
        @size = 1
      else
        aux_node = Node.new(value, @head, nil)
        @head[:prev] = aux_node
        @head = aux_node
        @size = @size + 1
      end
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
      raise TypeError "El argumento debe ser un array con los elementos a insertar" unless values.is_a?Array
      values.each{|x| push(x)}
    end

    def unshiftVarious(values)
      raise TypeError "El argumento debe ser un array con los elementos a insertar" unless values.is_a?Array
      values.each{|x| unshift(x)}
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