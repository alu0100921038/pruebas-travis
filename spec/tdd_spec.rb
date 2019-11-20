require "spec_helper"
require 'lib/tdd'
require 'lib/listaDE'

RSpec.describe Tdd do
  before :all do
    @alimento1 = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
    @menu_hombre = Alimento.new("Pollo", 60, 2, 40, 2.7, 3.4)
    @menu_mujer = Alimento.new("Cordero", 50, 3, 30, 3.1, 3)

    @node = Node.new(nil,nil,nil);
    @node2 = Node.new("Hola",nil,nil)
    @lista = ListaDE.new();

    @lista2 = ListaDE.new()
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

  describe "Lista doblemente enlazada - comprobación acceso atributos y métodos" do
    it "Debe existir un nodo de la lista con sus datos, su siguiente y su previo" do
      expect(@lista.head.value).to eq(nil)
      expect(@lista.head.next).to eq(nil)
      expect(@lista.head.prev).to eq(nil)
    end

    it "Debe existir una Lista con su cabeza y su cola" do
      expect(@lista.head).to eq(@node)
      expect(@lista.tail).to eq(@node)
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
end
