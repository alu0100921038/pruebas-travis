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

    def get_nombre
      "Nombre: #{@nombre}"
    end

    def get_gei
      "GEI: #{@gei} kgCO2eq"
    end

    def get_terreno
      "Terreno: #{@terreno} m2/año"
    end

    def to_s
      "Nombre: #{@nombre}\n " +
      "Proteinas: #{@proteinas}\n " +
      "Carbohidratos: #{@carbohidratos}\n " +
      "Lipidos: #{@lipidos}\n " +
      "GEI: #{@gei}\n " +
      "Terreno: #{@terreno}"
    end

    def valor_energetico
      (@lipidos * 9) + (@proteinas * 4) + (@carbohidratos * 4)
    end

    def impacto_ambiental
      true
    end

end
