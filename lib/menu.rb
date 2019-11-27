require "tdd/version"

class Menu
    attr_reader :platos

    def initialize (platos)
        @platos = platos
    end

    def total_gramos
        gramos = 0
        @platos.each do |plato|
          gramos += plato.proteinas + plato.carbohidratos + plato.lipidos
        end
        return gramos
    end

    def proteinas_porcentaje
      gramos_total = self.total_gramos
      proteinas_total = 0
      platos.each do |plato|
        proteinas_total += plato.proteinas
      end
      return ((proteinas_total*100)/gramos_total).to_i
    end

    def lipidos_porcentaje
      gramos_total = self.total_gramos
      lipidos_total = 0
      platos.each do |plato|
        lipidos_total += plato.lipidos
      end
      return ((lipidos_total*100)/gramos_total).to_i
    end

    def carbohidratos_porcentaje
      gramos_total = self.total_gramos
      carbohidratos_total = 0
      platos.each do |plato|
        carbohidratos_total += plato.carbohidratos
      end
      return ((carbohidratos_total*100)/gramos_total).to_i
    end

    def valorCaloricoTotal
      calorias_totales = 0
      platos.each do |plato|
        calorias_totales += plato.valor_energetico
      end
      return calorias_totales
    end
end
