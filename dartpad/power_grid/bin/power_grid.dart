void main(List<String> arguments) {

  var grid = PowerGrid();
  var nuclear = NuclearPlant();
  var solar = SolarPlant();

  grid.addPlant(nuclear, 'Hello');

  grid.addPlant(solar, 'world');
}

class PowerGrid {

  List<PowerPlant> connectedPlants = [];

  addPlant(PowerPlant plant, String value){
    plant.turnOn(value);
    connectedPlants.add(plant);
  }
}

abstract class PowerPlant{
  bool turnOn(String value);
}

class NuclearPlant implements PowerPlant{
  bool turnOn(String value){
    print("I'm a nuclear plant turing on");
    return true;
  }
}

class SolarPlant implements PowerPlant{
  bool turnOn(String value){
    print("I'm a solar plant turing on");
    return true;
  }
}
