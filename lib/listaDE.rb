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

    def insertarTail(value)
       nodo = Node.new(value)
       if isNil(@head) and isNil(@tail)
           @head = nodo
           @tail = nodo
       else
           @tail.prev = nodo
           nodo.next = @tail
           @tail = nodo
       end
       @size+=1
   end

   def extraerHead ()
        extraer = @head
        headActual = @head.prev
        @head = headActual
        if isNil(headActual)
            @tail = nil
        else
            @head.next = nil
        end
        @size-=1
        return extraer
  end

  def extraerTail()
        extraer = @tail
        tailActual = @tail.next
        @tail = tailActual
        if isNil(tailActual)
            @head = nil
        else
            @tail.prev = nil
        end
        @size-=1
        return extraer
    end

  def isNil (node)
    if node.value.nil? and node.next.nil? and node.prev.nil?
      return true
    else
      return false
    end
  end
end
