import 'package:domain/domain.dart';
import 'package:domain/src/ticket_entry/model/ticket_entry.dart';
import 'package:domain/src/ticket_entry/service/ticket_entry_service.dart';

class TicketEntryMotorcycleService extends TicketEntryService {
  TicketEntryMotorcycleService(super.ticketRepository);

  @override
  int get maxCapacityVehicle => 10;

  @override
  List<TicketEntry> getListTicket() {
    List<TicketEntry> listReturn = [];
    List<TicketEntry> list = getListTicketEntry();

    for (var element in list) {
      try {
        Motorcycle motorcycle = element.vehicle as Motorcycle;
        listReturn.add(element);
      } catch (e) {}
    }
    return listReturn;
  }
}
