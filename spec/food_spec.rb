require 'spec_helper'
RSpec.describe Food do
  it "has a version number" do
    expect(Food::VERSION).not_to be nil
  end

  context "#Existencias de métodos"
    before :each do
      @basic_food = Food::Food.new()
    end

    it "Existe un método para obtener el nombre del alimento" do
      expect(@basic_food).to respond_to(:name)
    end
    it "Existe un método para obtener las emisiones de gases de efecto invernadero" do
      expect(@basic_food).to respond_to(:gases)
    end
    it "Existe un método para obtener el terreno utilizado" do
      expect(@basic_food).to respond_to(:land_use)
    end
    it "Existe un método para obtener el alimento formateado" do
      expect(@basic_food).to respond_to(:to_s)
    end
    it "Existe un método para obtener el valor energético de un alimento" do
      expect(@basic_food).to respond_to(:energetic_value)
    end
    it "Existe un método para obtener las proteínas de un alimento" do
      expect(@basic_food).to respond_to(:protein)
    end
    it "Existe un método para obtener los lípidos de un alimento" do
      expect(@basic_food).to respond_to(:lipids)
    end
    it "Existe un método para obtener los carbohidratos de un alimento" do
      expect(@basic_food).to respond_to(:carbohydrates)
    end

  context "Funcionamiento de métodos getters"
    before :each do
      @basic_food = Food::Food.new()
    end

    it "El nombre del alimento es el correcto" do
      expect(@basic_food.name).to eq("Huevos")
    end
end
