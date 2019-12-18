require "spec_helper"
require 'lib/tdd'
require 'lib/listaDE'
require 'lib/menu'

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

    @chocolate = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
    @carne_vaca = Alimento.new("Carne Vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
    @carne_cordero = Alimento.new("Cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
    @pollo = Alimento.new("Pollo", 20.6 ,0.0, 5.6, 5.7, 7.1)
    @camarones = Alimento.new("Camarones", 17.6, 1.5, 0.6, 18.0, 2.0)
    @salmon = Alimento.new("Salmon", 19.9, 0.0, 13.6, 6.0, 3.7)
    @cerdo = Alimento.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
    @queso = Alimento.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0)
    @cerveza = Alimento.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
    @leche_vaca = Alimento.new("Leche Vaca", 3.3, 4.8, 3.2, 3.2, 8.9)
    @huevos = Alimento.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)
    @cafe = Alimento.new("Cafe", 0.1, 0.0, 0.0, 0.4, 0.3)
    @tofu = Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
    @lentejas = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
    @nuez = Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)

    @dietaCarne = ListaDE.new()
    @dietaCarne.insertarHead(@carne_vaca)
    @dietaCarne.insertarHead(@carne_cordero)
    @dietaCarne.insertarHead(@pollo)

    #Práctica 8
    @alimento2 = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
    @alimento3 = Alimento.new("Pollo", 60, 2, 40, 2.7, 3.4)
    @alimento4 = Alimento.new("Camarones", 17.6, 1.5, 0.6, 18.0, 2.0)
    @alimento5 = Alimento.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)

    @numeros = ListaDE.new()
    @numeros.insertarHead(3)
    @numeros.insertarHead(7)
    @numeros.insertarHead(1)
    @numeros.insertarHead(2)
    @numeros.insertarHead(9)
    @numeros.insertarHead(4)

    array_menu = [@alimento2, @alimento3, @alimento4, @alimento5]
    array_menu2 = [@alimento2, @alimento3, @alimento4, @alimento5]
    array_menu3 = [@alimento3, @alimento4, @alimento5]
    array_menu4 = [@alimento2, @alimento3]
    @menu = Menu.new(array_menu)
    @menu2 = MenuEficiente.new(array_menu)
    @menu3 = MenuEficiente.new(array_menu3)
    @menu4 = MenuEficiente.new(array_menu4)

    @lista_menus = ListaDE.new()
    @lista_menus.insertarHead(@menu2)
    @lista_menus.insertarHead(@menu3)
    @lista_menus.insertarHead(@menu4)

    @array_menus = [@chocolate, @carne_vaca, @carne_cordero, @pollo, @camarones]
    @precios = [5, 13, 15, 11, 20]
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

  describe "Se enumeran correctamente las instancias de una lista DE con todos los operadores" do
    it "Con el método collect" do
      expect(@numeros.collect { |numero| numero*2  }).to eq ([6, 14, 2, 4, 18, 8])
    end

    it "Con el método select" do
      expect(@numeros.select { |numero| numero % 2 == 0  }).to eq ([2, 4])
    end

    it "Con el método max" do
      expect(@numeros.max).to eq (9)
    end

    it "Con el método min" do
      expect(@numeros.min).to eq (1)
    end

    it "Con el método done" do
      expect(@numeros.sort).to eq ([1, 2, 3, 4, 7, 9])
    end
  end

  describe "Clase Ruby para representar información nutricional de menús" do
    it "Obteniendo el nombre de un plato" do
      expect(@menu.platos[2].nombre).to eq('Camarones')
    end

    it "Existe un conjunto de alimentos" do
      expect(@menu.platos.size).to eq(4)
    end

    it "Existe un conjunto de alimentos en gramos" do
      expect(@menu.total_gramos).to eq(231.8)
    end

    it "Porcentaje de proteinas del conjunto de alimentos" do
      expect(@menu.proteinas_porcentaje).to eq(45)
    end

    it "Porcentaje de lipidos del conjunto de alimentos" do
      expect(@menu.lipidos_porcentaje).to eq(33)
    end

    it "Porcentaje de carbohidratos del conjunto de alimentos" do
      expect(@menu.carbohidratos_porcentaje).to eq(21)
    end

    it "Valor Calórico Total del conjunto de alimentos" do
      expect(@menu.valorCaloricoTotal).to eq(1311.7)
    end

    it "Se obtiene el plato formateado" do
      expect(@menu.platos[0].to_s).to eq("Nombre: Chocolate\n Proteinas: 5.3\n Carbohidratos: 47.0\n Lipidos: 30.0\n GEI: 2.3\n Terreno: 3.4")
    end
  end

  describe "Jerarquia de clases eficiencie energética" do
    it "Valor total de las emisiones diarias de gases" do
      expect(@menu2.total_gases).to eq(30.6)
    end

    it "Estimación metros cuadrados uso terreno" do
      expect(@menu2.total_terreno).to eq(19.8)
    end

    it "Se obtiene la eficiencia energética formateada" do
      expect(@menu2.to_s).to eq ("Gases Totales: 30.6 kgCO2eq,\n Uso Terreno: 19.8 m2año")
    end

    it "Comprobar clase" do
      expect(@menu2.class).to eq(MenuEficiente)
    end

    it "Comprobar el tipo" do
      expect(@menu2.is_a?Object).to eq(true)
    end

    it "Comprobar pertenencia a una jerarquía" do
      expect(@menu2.is_a?MenuEficiente).to eq(true)
      expect(@menu2.is_a?Menu).to eq(true)
    end

    it "Comprobar su superclase" do
      expect(@menu2.class.superclass).to eq(Menu)
    end
  end

  describe "Comparación entre platos del menu" do
    it "Alimento 2 es menor que Alimento 3" do
      expect(@menu.platos[0] < @menu.platos[1]).to eq(true)
    end

    it "Menu2 contamina mas que Menu3" do
      expect(@menu2 > @menu3).to eq(true)
    end
  end

  describe "Enumerar lista de platos de un menú de una dieta" do
    it "Método sort" do
      expect(@lista_menus.sort).to eq([@menu4, @menu3, @menu2])
    end

    it "Método max" do
      expect(@lista_menus.max).to eq(@menu2)
    end

    it "Método min" do
      expect(@lista_menus.min).to eq(@menu4)
    end

    it "Método collect" do
      expect(@lista_menus.collect { |menu| menu.total_gases }).to eq([30.6, 28.299999999999997, 5.0])
    end

    it "Método select" do
      expect(@lista_menus.select { |menu| menu.total_gases > 30}).to eq([@menu2])
    end
  end

  ################################################
  # Pruebas practica 9 - Programación Funcional #
  ################################################

  describe "Pruebas calculo aporte energetico de los menus" do
   it "Aporte energetico menu " do
     expect((@array_menus.collect { |alimento| alimento.valor_energetico}).reduce(:+)).to eq(1031.1)
   end
   it "Plato con máxima huella nutricional " do
     expect((@array_menus.collect { |alimento| alimento.valor_energetico}.max)).to eq(479.2)
   end
   it "Plato con máxima huella nutricional " do
     expect((@array_menus.collect { |alimento| alimento.huella_nutricional}.max)).to eq([1, @chocolate])
   end
 end

 describe "Aumentando precios acorde al menú de máxima huella " do
   it "Aumentando precios acorde al plato de máxima huella nutricional" do
     indice = @array_menus.collect { |alimento| alimento.huella_nutricional}.max.first
     expect(@precios.map{ |y| y * indice}).to eq ([5, 13, 15, 11, 20])
   end
 end
end
