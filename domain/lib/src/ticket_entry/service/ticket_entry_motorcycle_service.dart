import 'package:domain/domain.dart';
import 'package:domain/src/ticket_entry/service/ticket_entry_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class TicketEntryMotorcycleService extends TicketEntryService {
  TicketEntryMotorcycleService(super.ticketRepository);

  @override
  int get maxCapacityVehicle => 10;

  @override
  Future<List<TicketEntry>> getListTicket() async {
    List<TicketEntry> listReturn = [];
    List<TicketEntry> list = await getListTicketEntry();

    for (var element in list) {
      try {
        Motorcycle motorcycle = element.vehicle as Motorcycle;
        listReturn.add(element);
      } catch (e) {}
    }
    return listReturn;
  }
}
