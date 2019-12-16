
#:nodoc:
module Food
    # La clase +List+ permite recrear una lista doblemente enlazada.
  class List
    include Enumerable

    #:nodoc:
    Node = Struct.new(:value, :next, :prev)

    #:doc:
    #Nodo inicial de la lista
    attr_reader :head
    #:doc:
    #Nodo final de la lista
    attr_reader :tail

    # :doc:
    # La clase +Node+ permite recrear los nodos internos de una lista doblemente enlazada
    # * :+value+: Valor que contendrá el nodo.
    # * :+next+: Referencia al siguiente nodo.
    # * :+prev+: Referencia al nodo previo.
    class Node
      undef min, max, value=
      # :category: Utilidades
      # Expresa el objeto como un string.
      # Dato que retorna: String.
      def to_s
          "(#{value.to_s})"
      end
    end

    # :category: Manipulación de la lista.
    # Función que permite introducir un nodo al final de la lista.
    # === Parámetros
    # * +value+: Dato contenido en el nodo.
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

    # :category: Manipulación de la lista.
    # Función que permite introducir un nodo al comienzo de la lista.
    # === Parámetros
    # * +value+: Dato contenido en el nodo.
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

    # :category: Utilidades
    # Función que expresa la lista como un array.
    # === Valor de retorno
    # Dato que retorna: Array.
    def to_a
      aux_node = @head
      a = []
      while aux_node != nil do
        a << aux_node.value
        aux_node = aux_node[:next]
      end
      a
    end

    # :category: Manipulación de la lista.
    # Función que permite introducir varios nodos al final de la lista.
    # === Parámetros
    # * +values+: Array con los datos que contendrán los nodos.
    # === Excepciones
    # * +TypeError+: Si el argumento de no es un array.
    def pushVarious(values)
      raise TypeError "El argumento debe ser un array con los elementos a insertar" unless values.is_a?Array
      values.each{|x| push(x)}
    end

    # :category: Manipulación de la lista.
    # Función que permite introducir varios nodos al comienzo de la lista.
    # === Parámetros
    # * +values+: Array con los datos que contendrán los nodos.
    # === Excepciones
    # * +TypeError+: Si el argumento de no es un array.
    def unshiftVarious(values)
      raise TypeError "El argumento debe ser un array con los elementos a insertar" unless values.is_a?Array
      values.each{|x| unshift(x)}
    end

    # :category: Manipulación de la lista.
    # Función que permite extraer un nodo al final de la lista.
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

    # :category: Manipulación de la lista.
    # Función que permite extraer un nodo al comienzo de la lista.
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

    # :category: Manipulación de la lista.
    # Función que permite resetear la lista.
    def clear
      while @tail != nil do
        pop
      end
      @size = 0
    end
    
    # :category: Manipulación de la lista.
    # Función que permite eliminar un nodo si este existe en la lista. Su búsqueda se realiza desde la cola.
    # === Parámetros
    # * +value+: Dato contenido en el nodo.
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

    # :category: Manipulación de la lista.
    # Función que permite eliminar un nodo si este existe en la lista. Su búsqueda se realiza desde la cabeza.
    # === Parámetros
    # * +value+: Dato contenido en el nodo.
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

    # :category: Búsqueda en la lista.
    # Función que permite buscar un valor en la lista. La búsqueda se realiza desde la cabeza
    # === Parámetros
    # * +value+: Dato contenido en el nodo.
    # === Valor de retorno
    # Dato que retorna:
    # * _nil_: En caso de que el elemento no se encontrase en la lista.
    # * _Integer_: Posición del elemento en la lista desde la cabeza.
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

    # :category: Búsqueda en la lista.
    # Función que permite buscar un valor en la lista. La búsqueda se realiza desde la cola
    # === Parámetros
    # * +value+: Dato contenido en el nodo.
    # === Valor de retorno
    # Dato que retorna:
    # * _nil_: En caso de que el elemento no se encontrase en la lista.
    # * _Integer_: Posición del elemento en la lista desde la cola.
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

    # :category: Utilidades.
    # Función que permite recorrer la totalidad de la lista. Puede ser utilizado por otras métodos para tareas que requieran trabajar con la lista en su conjunto..
    def each # :yields: node
      aux_node = @head
      while aux_node != nil do
        yield aux_node[:value]
        aux_node = aux_node[:next]
      end
    end

    # :category: Utilidades.
    # Función que permite acceder a un elemento de la lista en concreto.
    # === Parámetros
    # * +index+: índice que se utilizará para encontrar al elemento deseado. Existen distintas posibilidades.
    # ====Valores de index posibles:
    # * :head o "head": Se accede al nodo que conforma la cabeza.
    # * :tail o "tail": Se accede al nodo que conforma la cola.
    # * Dato de tipo Integer positivo: Se accede al nodo que ocupa la posición indicada desde la cabeza.
    # * Dato de tipo Integer negativo: Se accede al nodo que ocupa la posición indicada desde la cola.
    # === Valores de retorno
    # Dato que retorna:
    # * _nil_: Si el index no se reconoce, ya sea por ser un valor inválido o por corresponderse con un nodo de imposible acceso al no estar definido. 
    # * _Valor del nodo_ al que se accede.
    def [](index)
      case index
      when :head, "head"
        return @head[:value]
      when :tail, "tail"
        return @tail[:value]
      else
        if (index.instance_of?Integer) then
          if (index >= 0) && (index <= @size) then
            aux_node = @head
            i = 0
            while i != index do
              aux_node = aux_node[:next]
              i = i + 1
            end
            return aux_node[:value]
          elsif (index < 0) && (index.abs <= @size) then
            aux_node = @tail
            i = 1
            aux_index = index.abs
            while i != aux_index do
              aux_node = aux_node[:prev]
              i = i + 1
            end
            return aux_node[:value]
          end
        else
          return nil
        end
      end
    end

  end
end