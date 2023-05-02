import 'package:domain/domain.dart';

abstract class MotorcycleRepository{

  addMotorcycle(Motorcycle motorcycle);

  Motorcycle getMotorcycle(String plate);

  deleteMotorcycle(String plate);

  List<Motorcycle> getMotorcycleList();

  bool motorcycleExist(String plate);
}