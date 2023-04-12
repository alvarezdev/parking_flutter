import '../model/vehicle.dart';

abstract class VehicleRepository{
  addVehicle(Vehicle vehicleDto);
  Vehicle getVehicle(String plate);
  List<Vehicle> getVehicleList();
  deleteVehicle(String plate);
  deleteAll();
}
