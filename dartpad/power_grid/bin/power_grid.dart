void main(List<String> arguments) {

  PowerGrid grid = new PowerGrid();
  NuclearPlant nuclear = new NuclearPlant();
  SolarPlant solar = new SolarPlant();

  grid.addPlant(nuclear);
}

class PowerGrid {
  List<NuclearPlant> connectedPlants = [];

  addPlant(NuclearPlant plant){
    plant.turnOn();
    connectedPlants.add(plant);
  }
}

class NuclearPlant{
  turnOn(){
    print("I'm a nuclear plant turing on");
  }
}

class SolarPlant{
  turnOn(){
    print("I'm a solar plant turing on");
  }
}
