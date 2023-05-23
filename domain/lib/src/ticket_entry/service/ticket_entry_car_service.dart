import 'package:domain/src/ticket_entry/model/ticket_entry.dart';
import 'package:domain/src/ticket_entry/service/ticket_entry_service.dart';
import 'package:domain/src/vehicle/model/car.dart';

class TicketEntryCarService extends TicketEntryService {
  TicketEntryCarService(super.ticketRepository);

  @override
  int get maxCapacityVehicle => 20;

  @override
  List<TicketEntry> getListTicket() {
    List<TicketEntry> listReturn = [];
    List<TicketEntry> list = getListTicketEntry();
    for (var element in list) {
      try {
        Car car = element.vehicle as Car;
        listReturn.add(element);
      } catch (e) {}
    }
    return listReturn;
  }
}
