import 'package:domain/src/ticket_entry/model/ticket_entry.dart';
import 'package:domain/src/ticket_entry/service/ticket_entry_service.dart';
import 'package:domain/src/vehicle/model/car.dart';
import 'package:injectable/injectable.dart';

@injectable
class TicketEntryCarService extends TicketEntryService {
  TicketEntryCarService(super.ticketRepository);

  @override
  int get maxCapacityVehicle => 20;

  @override
  Future<List<TicketEntry>> getListTicket() async {
    List<TicketEntry> listReturn = [];
    List<TicketEntry> list = await getListTicketEntry();
    for (var element in list) {
      try {
        element.vehicle as Car;
        listReturn.add(element);
      } catch (e) {}
    }
    return listReturn;
  }
}
