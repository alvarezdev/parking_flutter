import 'package:domain/domain.dart';
import 'package:domain/src/exception/business_exception.dart';
import 'package:domain/src/vehicle/repository/motorcycle/motorcycle_repository.dart';

class MotorcycleService{

  MotorcycleService(this._motorcycleRepository);

  final MotorcycleRepository _motorcycleRepository;

  final String _maxCapacityMotorcycleMsg = "Parking capacity for Motorcycles is full";
  final String _repeatVehiclePlateMsg = "The vehicle plate is repeat";
  final String _unauthorizedEntry = "Unauthorized entry";

  final int _maxCapacityMotorcycle = 10;
  final int sunday = DateTime.sunday;
  final int monday = DateTime.monday;

  enterCarParking(Motorcycle motorcycle, DateTime entryTime){
    int dayOfWeek =  entryTime.weekday;
    var isParkingFullCars = _motorcycleRepository.getMotorcycleList();
    if(isParkingFullCars.length >= _maxCapacityMotorcycle){
      throw BusinessException(_maxCapacityMotorcycleMsg);
    }else if(_motorcycleRepository.motorcycleExist(motorcycle.plate)){
      throw BusinessException(_repeatVehiclePlateMsg);
    }else if((dayOfWeek == sunday || dayOfWeek == monday) && motorcycle.plate.substring(0, 1) == "A"){
      throw BusinessException(_unauthorizedEntry);
    }else{
      _motorcycleRepository.addMotorcycle(motorcycle);
    }
  }

  Motorcycle getCar(String plate) {
    return _motorcycleRepository.getMotorcycle(plate);
  }

  leaveCarParking(String plate) {
    _motorcycleRepository.deleteMotorcycle(plate);
  }

}