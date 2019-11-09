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
end
