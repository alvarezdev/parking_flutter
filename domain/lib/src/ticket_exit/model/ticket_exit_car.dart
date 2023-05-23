import 'package:domain/src/ticket_entry/model/ticket_entry.dart';
import 'package:domain/src/ticket_exit/model/ticket_exit.dart';

class TicketExitCar extends TicketExit {
  TicketExitCar(TicketEntry ticketEntry, DateTime exitTime)
      : super(ticketEntry, exitTime);

  @override
  int get dayPrice => 8000;

  @override
  int get hourPrice => 1000;

  int calculateParkingValue() {
    return calculateValue();
  }

}
