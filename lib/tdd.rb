require "tdd/version"

# @author Juan Martínez
class Alimento
    include Comparable
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

    # Formatea el alimento
    #
    # @return [String]
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

    def huella_nutricional
      if self.valor_energetico < 670 and self.gei < 800
        return 1,self
      elseif self.valor_energetico.between?(670,830) and self.gei.between?(800-1200)
        return 2,self
      else
        return 3,self
      end
    end

    def <=> (another)
        self.valor_energetico <=> another.valor_energetico
    end
end
