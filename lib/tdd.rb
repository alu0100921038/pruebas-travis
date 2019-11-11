require "tdd/version"

class Alimento
    attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :gei, :terreno

    def initialize (nombre, proteinas, carbohidratos, lipidos, gei, terreno)
      @nombre = nombre
      @proteinas = proteinas
      @carbohidratos = carbohidratos
      @lipidos = lipidos
      @gei = gei
      @terreno = terreno
    end

end
