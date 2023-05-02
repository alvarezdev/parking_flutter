import 'package:domain/src/vehicle/model/vehicle.dart';

class Motorcycle extends Vehicle{

  Motorcycle(super.plate, this._cylinderCapacity) {
    if (_cylinderCapacity <= 0){
      throw Exception(_zeroCylinderCapacityMsg);
    }
  }

  final double _cylinderCapacity;

  final String _zeroCylinderCapacityMsg = "The cylinder capacity of the vehicle must be greater than zero";

  double get cylinderCapacity => _cylinderCapacity;
}