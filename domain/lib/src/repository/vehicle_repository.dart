import '../model/vehicle.dart';

class VehicleImpl{
  addVehicle(Vehicle vehicleDto){}
  Vehicle getVehicle(String plate) => Vehicle(plate: "ABC111",
      cylinderCapacity: 100,
      entryTime: DateTime.now());
  List<Vehicle> getVehicleList() => List.empty();
  deleteVehicle(String plate){}
  deleteAll(){}
}
