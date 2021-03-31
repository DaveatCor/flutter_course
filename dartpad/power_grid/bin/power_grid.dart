void main(List<String> arguments) {

  PowerGrid grid = new PowerGrid();
  NuclearPlant nuclear = new NuclearPlant();
  SolarPlant solar = new SolarPlant();

  grid.addPlant(nuclear);

  grid.addPlant(solar);
}

class PowerGrid {
  List<PowerPlant> connectedPlants = [];

  addPlant(PowerPlant plant){
    plant.turnOn();
    connectedPlants.add(plant);
  }
}

abstract class PowerPlant{
  turnOn();
}

class NuclearPlant implements PowerPlant{
  turnOn(){
    print("I'm a nuclear plant turing on");
  }
}

class SolarPlant implements PowerPlant{
  turnOn(){
    print("I'm a solar plant turing on");
  }
}
