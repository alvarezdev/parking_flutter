import 'package:domain/domain.dart';

class VehicleDaoMock implements VehicleRepository{
  List<Vehicle>? vehicleList;

  VehicleDaoMock(){
    vehicleList = [];
  }

  @override
  addVehicle(Vehicle vehicleDto) {
    vehicleList!.add(vehicleDto);
  }

  @override
  deleteAll() {
    if (vehicleList!.isNotEmpty) {
      vehicleList!.clear();
    }
  }

  @override
  deleteVehicle(String plate) {
    if (vehicleList!.isNotEmpty) {
      var vehicle = getVehicle(plate);
      vehicleList!.remove(vehicle);
    }
  }

  @override
  Vehicle getVehicle(String plate) {
    if (vehicleList!.isNotEmpty) {
      return vehicleList!.firstWhere((vehicle) => plate == vehicle.plate);
    }else{
      return Vehicle(plate: "AAA111", cylinderCapacity: 1000, entryTime: DateTime.now());
    }
  }

  @override
  List<Vehicle> getVehicleList() {
    return vehicleList!;
  }


}