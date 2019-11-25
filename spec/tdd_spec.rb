require "spec_helper"
require 'lib/tdd'
require 'lib/listaDE'

RSpec.describe Tdd do
  before :all do

    #Práctica 6
    @alimento1 = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
    @menu_hombre = Alimento.new("Pollo", 60, 2, 40, 2.7, 3.4)
    @menu_mujer = Alimento.new("Cordero", 50, 3, 30, 3.1, 3)

    #Práctica 7
    @node = Node.new(nil,nil,nil);
    @node2 = Node.new("Hola",nil,nil)
    @lista = ListaDE.new();

    @lista2 = ListaDE.new()

    @carne_vaca = Alimento.new("Carne Vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
    @carne_cordero = Alimento.new("Cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
    @pollo = Alimento.new("Pollo", 20.6 ,0.0, 5.6, 5.7, 7.1)
    @dietaCarne = ListaDE.new()
    @dietaCarne.insertarHead(@carne_vaca)
    @dietaCarne.insertarHead(@carne_cordero)
    @dietaCarne.insertarHead(@pollo)

    #Práctica 8
    @alimento2 = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
    @alimento3 = Alimento.new("Pollo", 60, 2, 40, 2.7, 3.4)
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
  # Pruebas practica 7 - Lista DE #
  ################################################

  describe "Lista doblemente enlazada - comprobación acceso atributos y métodos" do
    it "Debe existir un nodo de la lista con sus datos, su siguiente y su previo" do
      expect(@node.value).to eq(nil)
      expect(@node.next).to eq(nil)
      expect(@node.prev).to eq(nil)
    end

    it "Debe existir una Lista con su cabeza y su cola" do
      expect(@lista.head).to eq(nil)
      expect(@lista.tail).to eq(nil)
    end

    it "Se puede insertar un elemento en la Lista" do
      @lista2.insertarHead("Hola")
      expect(@lista2.head.value).to eq("Hola")
    end

    it "Se pueden insertar varios elementos en la Lista" do
      @lista2.insertarHead("Hola")
      @lista2.insertarHead("Adiós")
      expect(@lista2.head.value).to eq("Adiós")
    end

    it "Se extrae el primer elemento de la Lista" do
      expect(@lista2.extraerHead.value).to eq("Adiós")
      expect(@lista2.extraerHead.value).to eq("Hola")
    end

    it "Se extrae el último elemento de la Lista" do
      @lista2.insertarHead("Hola")
      @lista2.insertarHead("Adiós")
      expect(@lista2.extraerTail.value).to eq("Hola")
    end
  end

  describe "Se crea lista de alimentos" do
    it "Se estiman correctamente las emisiones de gases diarias de una dieta" do
      expect(@dietaCarne.emisionesDiarias).to eq(75.7)
    end

    it "Se estiman correctamente las emisiones de gases anuales de una dieta" do
      @dietaCarne.insertarHead(@carne_vaca)
      @dietaCarne.insertarHead(@carne_cordero)
      @dietaCarne.insertarHead(@pollo)
      expect(@dietaCarne.emisionesAnuales).to eq(27630.5)
    end

    it "Se estiman correctamente los km2 e uso de terreno de una dieta" do
      @dietaCarne.insertarHead(@carne_vaca)
      @dietaCarne.insertarHead(@carne_cordero)
      @dietaCarne.insertarHead(@pollo)
      expect(@dietaCarne.usoTerreno).to eq(356.1)
    end
  end

  ################################################
  # Pruebas practica 8 - Comparable y Enumerable #
  ################################################

  describe "Se comparan dos alimentos con todos los operadores de Comparable" do
    it "Alimento 2 es menor que Alimento 3 (Operador '<=')" do
      expect(@alimento2 < @alimento3).to eq(true)
      expect(@alimento2 <= @alimento2).to eq(true)
    end

    it "Alimento 3 es mayor que Alimento 2 (Operador '>=')" do
      expect(@alimento3 > @alimento2).to eq(true)
      expect(@alimento3 >= @alimento3).to eq(true)
    end

    it "Alimento 1 está entre Alimento 2 y 3 (Operador 'between?')" do
      expect(@alimento1.between?(@alimento2, @alimento3)).to eq(true)
    end
  end
end
