# Estructura para representar los nodos de una lista
# Incluye el valor del nodo y los nodos siguiente y previo a este
Node = Struct.new(:value, :next, :prev)

class ListaDE
  attr_reader :head, :tail, :size

    # Initialize de la lista, establece a nil la cabeza y la cola
    def initialize()
        @head = Node.new(nil,nil,nil)
        @tail = Node.new(nil,nil,nil)
        @size = 0
    end

    def insertarHead(value)
        nodo = Node.new(value)
        if isNil(@head) and isNil(@tail)
            @head = nodo
            @tail = nodo
        else
            @head.next = nodo
            nodo.prev = @head
            @head = nodo
        end
        @size+=1
    end

    def isNil (node)
      if node.value.nil? and node.next.nil? and node.prev.nil?
        return true
      else
        return false
      end
    end
end
