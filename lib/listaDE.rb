# Estructura para representar los nodos de una lista
# Incluye el valor del nodo y los nodos siguiente y previo a este
Node = Struct.new(:value, :next, :prev)

# @author Juan Martínez
class ListaDE
  include Enumerable
  attr_reader :head, :tail, :size

    # Initialize de la lista, establece a nil la cabeza y la cola
    def initialize()
        @head = nil
        @tail = nil
        @size = 0
    end

    # Inserta el valor pasado a la lista por el head
    #
    # @param value
    # @return
    def insertarHead(value)
        nodo = Node.new(value)
        if @head == nil and @tail == nil
            @head = nodo
            @tail = nodo
        else
            @head.next = nodo
            nodo.prev = @head
            @head = nodo
        end
        @size+=1
    end

    # Inserta el valor pasado a la lista por el tail
    #
    # @param value
    # @return
    def insertarTail(value)
       nodo = Node.new(value)
       if @head == nil and @tail == nil
           @head = nodo
           @tail = nodo
       else
           @tail.prev = nodo
           nodo.next = @tail
           @tail = nodo
       end
       @size+=1
   end

   # Extrae el primer valor de la lista.
   #
   # @return
   def extraerHead ()
        extraer = @head
        headActual = @head.prev
        @head = headActual
        if headActual == nil
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
        if tailActual == nil
            @head = nil
        else
            @tail.prev = nil
        end
        @size-=1
        return extraer
    end

  def emisionesDiarias
    emisiones = 0
    for i in 0..self.size-1
      emisiones += self.extraerHead.value.gei
    end
    return emisiones
  end

  def emisionesAnuales
    emisiones = 0
    for i in 0..self.size-1
      emisiones += self.extraerHead.value.gei
    end
    emisiones = emisiones * 365
    return emisiones
  end

  def usoTerreno
    uso_terreno = 0
    for i in 0..self.size-1
      uso_terreno += self.extraerHead.value.terreno
    end
    return uso_terreno
  end

  def each
        nodo=@tail
        while nodo != nil
            yield nodo.value
            nodo = nodo.next
        end
    end
end
