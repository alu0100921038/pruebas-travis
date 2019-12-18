require "tdd/version"

# @author Juan Martínez Hurtado de Mendoza
class Menu
    include Comparable
    attr_reader :platos

    def initialize (platos)
        @platos = platos
    end

    # Calcula los gramos totales de proteínas, carbohidratos y lipidos.
    #
    # @return [Integer] El número total de gramos
    def total_gramos
        gramos = 0
        @platos.each do |plato|
          gramos += plato.proteinas + plato.carbohidratos + plato.lipidos
        end
        return gramos
    end

    # Calcula porcentaje de proteinas
    #
    # @return [Integer] Porcentaje de proteínas
    def proteinas_porcentaje
      gramos_total = self.total_gramos
      proteinas_total = 0
      platos.each do |plato|
        proteinas_total += plato.proteinas
      end
      return ((proteinas_total*100)/gramos_total).to_i
    end

    # Calcula porcentaje de lipidos
    #
    # @return [Integer] Porcentaje de lipidos
    def lipidos_porcentaje
      gramos_total = self.total_gramos
      lipidos_total = 0
      platos.each do |plato|
        lipidos_total += plato.lipidos
      end
      return ((lipidos_total*100)/gramos_total).to_i
    end

    # Calcula porcentaje de lipidos
    #
    # @return [Integer] Porcentaje de lipidos
    def carbohidratos_porcentaje
      gramos_total = self.total_gramos
      carbohidratos_total = 0
      platos.each do |plato|
        carbohidratos_total += plato.carbohidratos
      end
      return ((carbohidratos_total*100)/gramos_total).to_i
    end

    # Calcula el valor calórico total
    #
    # @return [Integer] Calorias totales
    def valorCaloricoTotal
      calorias_totales = 0
      platos.each do |plato|
        calorias_totales += plato.valor_energetico
      end
      return calorias_totales
    end

    # Método que utiliza el módulo Comparable para poder comparar
    #
    # @param another [Object] Objeto con el que comparar
    # @return [Boolean] True or false
    def <=> (another)
        self.valorCaloricoTotal <=> another.valorCaloricoTotal
    end
end

class MenuEficiente < Menu
    include Comparable
    attr_reader :tipo_menu

    def initialize (platos)
      super(platos)
    end

    def total_gases
      gases = 0
      @platos.each do |plato|
        gases += plato.gei
      end
      return gases
    end

    def total_terreno
      terreno = 0
      @platos.each do |plato|
        terreno += plato.terreno
      end
      return terreno
    end

    def to_s
      "Gases Totales: #{self.total_gases} kgCO2eq,\n " +
      "Uso Terreno: #{self.total_terreno} m2año"
    end

    def <=> (another)
        self.total_gases <=> another.total_gases
    end
end
