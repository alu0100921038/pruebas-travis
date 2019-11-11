require "spec_helper"
require 'lib/tdd'

RSpec.describe Tdd do
  before :each do
    @alimento1 = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
  end

  describe "El alimento se inicializa correctamente y se puede acceder a sus atributos" do
    it "Debe existir un nombre para el alimento" do
      expect(@alimento1.nombre).to eq("Chocolate")
    end
  end
end
