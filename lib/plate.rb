class Plate
  attr_accessor :nombre, :alimento

  def initialize(name, &block)
    @nombre = name
    @alimento = []
    
    if block_given?  
      if block.arity == 1
        yield self
      else
       instance_eval(&block) 
      end
    end
  end

  def to_s
    output = @nombre
    output << "\n#{'=' * @nombre.size}\n\n"
    output << "Alimentos: #{@alimento.join(', ')}\n\n"

    output
  end

  def nombre(name, options = {})
    nombre = name
    @nombre << " (#{nombre})"
  end

  def alimento(options = {})
    alimento = options[:descripcion]
    alimento << " (#{options[:gramos]} gramos)"
    @alimento << alimento
  end
end

class Menu2
  attr_accessor :nombre, :descripcion, :componente

  def initialize(name, &block)
	@nombre = name
        @descripcion = ''
	@componente = []

	if block_given?  
	   if block.arity == 1
	      yield self
	   else
	      instance_eval(&block) 
           end
       end	      
  end

  def to_s
	output = @nombre
	output << "\n#{'=' * @nombre.size}\n\n" 
	output << "Componentes: #{@componente.join(', ')}"
  end

  def descripcion(description, options = {})
	descripcion = description
	@nombre << " (#{descripcion})"
  end

  def componente(options = {})
  	componente = options[:descripcion]
	componente << " (#{options[:precio]} €)"
	@componente << componente
  end  
end

menu = Menu2.new("Combinado 1") do
	descripcion "hamburguesa con papas"
	componente :descripcion => "hamburguesa especial", :precio => 4.2
	componente :descripcion => "papas pequeñas", :precio => 3
end
puts menu 

plato = Plate.new("Hamurguesa") do
	nombre "Hamburguesa especial de la casa"
	alimento :descripcion => "carne de vaca",
		 :gramos => 20
	alimento :descripcion => "huevo", 
		 :gramos => 10
end
    
puts plato


