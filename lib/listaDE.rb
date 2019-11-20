# Estructura para representar los nodos de una lista
# Incluye el valor del nodo y los nodos siguiente y previo a este
Node = Struct.new(:value, :next, :prev)

class ListaDE
  attr_reader :head, :tail, :size

    # Initialize de la lista, establece a nil la cabeza y la cola
    def initialize(var)
        @head = Node.new(nil, nil, nil)
        @tail = Node.new(nil,nil,nil)
        @size = 0
    end
end
