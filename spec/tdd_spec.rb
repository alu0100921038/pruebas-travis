require "spec_helper"
require 'lib/tdd'

RSpec.describe Tdd do
  before :each do
    @alimento1 = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
    @menu_hombre = Alimento.new("Pollo", 60, 2, 40, 2.7, 3.4)
    @menu_mujer = Alimento.new("Cordero", 50, 3, 30, 3.1, 3)
  end

  ################################################
  # Pruebas practica 6 - Alimentos #
  ################################################

  describe "El alimento se inicializa correctamente y se puede acceder a sus atributos" do
    it "Debe existir un nombre para el alimento" do
      expect(@alimento1.nombre).to eq("Chocolate")
    end

    it "Debe existir la cantidad de emisiones de gases de efecto invernadero" do
      expect(@alimento1.gei).to eq(2.3)
    end

    it "Debe existir la cantidad de terreno utilizado en m2/año" do
      expect(@alimento1.terreno).to eq(3.4)
    end
  end

  describe "Existen métodos para obtener los diferentes elementos de un Alimento" do
    it "Debe existir un método para obtener el nombre del Alimento" do
      expect(@alimento1.get_nombre).to eq("Nombre: Chocolate")
    end

    it "Debe existir un método para obtener las emisiones de gases de efecto invernadero" do
      expect(@alimento1.get_gei).to eq("GEI: 2.3 kgCO2eq")
    end

    it "Debe existir un método para obtener el terreno utilizado" do
      expect(@alimento1.get_terreno).to eq("Terreno: 3.4 m2/año")
    end

    it "Debe existir un método para obtener el alimento formateado" do
      expect(@alimento1.to_s).to eq("Nombre: Chocolate\n Proteinas: 5.3\n Carbohidratos: 47.0\n Lipidos: 30.0\n GEI: 2.3\n Terreno: 3.4")
    end

    it "Debe existir un método para obtener el valor energetico de un alimento" do
      expect(@alimento1.valor_energetico).to eq(479.2)
    end
  end

  describe "Se calcula correctamente el impacto ambiental diario" do
    it "Impacto ambiental diario hombre 20-39 años" do
      expect(@menu_hombre.impacto_ambiental).to eq(true)
    end
    it "Impacto ambiental diario mujer 20-39 años" do
      expect(@menu_mujer.impacto_ambiental).to eq(true)
    end
  end

  ################################################
  # Pruebas practica 7 - Lista Doblemente Enlazada #
  ################################################

end
