import '../../../../domain.dart';

abstract class CarRepository{

  addCar(Car car);

  Car getCar(String plate);

  deleteCar(String plate);

  List<Car> getCarList();

  bool carExist(String plate);
}
