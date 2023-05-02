import 'package:domain/domain.dart';
import 'package:domain/src/exception/business_exception.dart';

class CarService{

  CarService(this._carRepository);

  final CarRepository _carRepository;

  final String _maxCapacityCarMsg = "Parking capacity for cars is full";
  final String _repeatVehiclePlateMsg = "The vehicle plate is repeat";
  final String _unauthorizedEntry = "Unauthorized entry";

  final int _maxCapacityCar = 20;
  final int sunday = DateTime.sunday;
  final int monday = DateTime.monday;

  enterCarParking(Car car, DateTime entryTime){
    int dayOfWeek =  entryTime.weekday;
    var isParkingFullCars = _carRepository.getCarList();
    if(isParkingFullCars.length >= _maxCapacityCar){
      throw BusinessException(_maxCapacityCarMsg);
    }else if(_carRepository.carExist(car.plate)){
      throw BusinessException(_repeatVehiclePlateMsg);
    }else if((dayOfWeek == sunday || dayOfWeek == monday) && car.plate.substring(0, 1) == "A"){
      throw BusinessException(_unauthorizedEntry);
    }else{
      _carRepository.addCar(car);
    }
  }

  Car getCar(String plate) {
    return _carRepository.getCar(plate);
  }

  leaveCarParking(String plate) {
    _carRepository.deleteCar(plate);
  }

}