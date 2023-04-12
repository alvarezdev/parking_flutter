import 'package:domain/src/model/vehicle.dart';

class Motorcycle extends Vehicle{

  final String _zeroCylinderCapacityMsg = "The cylinder capacity of the vehicle must be greater than zero";

  final double? _cylinderCapacity;

  Motorcycle({required super.plate, required double? cylinderCapacity}) : _cylinderCapacity = cylinderCapacity{
    if (_cylinderCapacity! <= 0){
      throw Exception(_zeroCylinderCapacityMsg);
    }
  }

  double? get cylinderCapacity => _cylinderCapacity;
}