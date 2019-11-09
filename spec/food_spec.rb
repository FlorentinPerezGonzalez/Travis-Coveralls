require 'spec_helper'
RSpec.describe Food do
  it "has a version number" do
    expect(Food::VERSION).not_to be nil
  end

  context "Existencias de métodos" do
    before :each do
      @basic_food = Food::Food.new("Huevos",13.0, 1.1,11.0,4.2,5.7)
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
  end

  context "Funcionamiento de métodos getters asociados a las características íntegras de los alimentos" do
    before :each do
      @basic_food = Food::Food.new("Huevos",13.0, 1.1,11.0,4.2,5.7)
    end

    it "El nombre del alimento es el correcto" do
      expect(@basic_food.name).to eq("Huevos")
    end
    it "La cantidad de proteínas del alimento es la correcta" do
      expect(@basic_food.protein).to eq(13.0)
    end
    it "La cantidad de carbohidratos del alimento es la correcta" do
      expect(@basic_food.carbohydrates).to eq(1.1)
    end
    it "La cantidad de lípidos del alimento es la correcta" do
      expect(@basic_food.lipids).to eq(11.0)
    end
  end #context

  context "Funcionamiento de métodos getters asociados a las implicaciones medioambientales de los alimentos" do
    before :each do
      @basic_food = Food::Food.new("Huevos",13.0, 1.1,11.0,4.2,5.7)
    end

    it "La cantidad de gases de efecto invernadero asociados a la producción de un kilo del alimento es la correcta" do
      expect(@basic_food.gases).to eq(4.2)
    end
    it "La cantidad de terreno en m2 utilizados para la producción de un kilo del alimento es la correcta" do
      expect(@basic_food.land_use).to eq(5.7)
    end
  end #context


  it "La salida formateada de un alimento es la correcta" do
    huevos = Food::Food.new("Huevos",13.0, 1.1,11.0,4.2,5.7)
    expect(huevos.to_s).to eq("{Huevos, 13.0, 1.1, 11.0, 4.2, 5.7}")
  end

end #describe
