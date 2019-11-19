module Food
  class List
    Node = Struct.new(:value, :next, :prev)
    attr_reader :head
  end
end