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
      if @tail != nil then
        if @tail[:prev] != nil then
          @tail = @tail[:prev]
          @tail[:next] = nil
        else
          @tail = nil
          @head[:next] = nil
          @head = nil
        end
        @size = @size - 1
      end
    end

    def shift
      if @head != nil then
        if @head[:next] != nil then
          @head = @head[:next]
          @head[:prev] = nil
        else
          @head = nil
          @tail[:prev] = nil
          @tail = nil
        end
        @size = @size -1
      end
    end

    def clear
      while @tail != nil do
        pop
      end
      @size = 0
    end
    

    def erase_from_tail(value)
      aux_node = @tail
        while ((aux_node != nil)) do
          if aux_node[:value] == value then
            aux_node[:next].prev = aux_node[:prev]
            aux_node[:prev].next = aux_node[:next]
            aux_node = nil
            @size = @size - 1
            break
          end
        aux_node = aux_node[:prev]
      end
    end

    def erase_from_head(value)
      aux_node = @head
      while((aux_node != nil)) do
        if aux_node[:value] == value then
          aux_node[:next].prev = aux_node[:prev]
          aux_node[:prev].next = aux_node[:next]
          aux_node = nil
          @size = @size - 1
          break
        end
        aux_node = aux_node[:next]
      end
    end

    def find_from_head(value)
      aux_node = @head
      value_position = nil
      i = 0
      while aux_node != nil do
        if aux_node[:value] == value then
          value_position = i
          break
        else
          i = i +1
          aux_node = aux_node[:next]
        end
      end
      value_position
    end

    def find_from_tail(value)
      aux_node = @tail
      value_position = nil
      i = -1
      while aux_node != nil do
        if aux_node[:value] == value then
          value_position = i
          break
        else
          i = i - 1
          aux_node = aux_node[:prev]
        end
      end
      value_position
    end
  end
end