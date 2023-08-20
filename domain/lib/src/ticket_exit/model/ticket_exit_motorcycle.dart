import 'package:domain/domain.dart';
import 'package:domain/src/ticket_exit/model/ticket_exit.dart';

class TicketExitMotorcycle extends TicketExit {
  TicketExitMotorcycle(this._ticketEntry, DateTime exitTime) : super(_ticketEntry, exitTime);

  final TicketEntry _ticketEntry;

  static const int _addMotorcyclePay = 2000;
  static const double _cylinderCapacityGreater = 500;

  @override
  int get dayPrice => 4000;

  @override
  int get hourPrice => 500;

  int calculateParkingValue() {
    double cylinderCapacity =
        (_ticketEntry.vehicle as Motorcycle).cylinderCapacity;
    int value = calculateValue();
    if (cylinderCapacity > _cylinderCapacityGreater) {
      return value += _addMotorcyclePay;
    }
    return value;
  }
}
