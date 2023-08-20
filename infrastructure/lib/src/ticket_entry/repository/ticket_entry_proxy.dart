import 'package:domain/domain.dart';
import 'package:infrastructure/src/ticket_entry/repository/production/ticket_entry_car_db_repository.dart';
import 'package:infrastructure/src/ticket_entry/repository/production/ticket_entry_motorcycle_db_repository.dart';

class TicketEntryProxy implements TicketEntryRepository{
  TicketEntryProxy(
      TicketEntryCarDbRepository ticketEntryCarDbRepository,
      TicketEntryMotorcycleDbRepository ticketEntryMotorcycleDbRepository,
      ) : _ticketEntryCarDbRepository = ticketEntryCarDbRepository,
     _ticketEntryMotorcycleDbRepository = ticketEntryMotorcycleDbRepository;

  final TicketEntryCarDbRepository _ticketEntryCarDbRepository;
  final TicketEntryMotorcycleDbRepository _ticketEntryMotorcycleDbRepository;

  @override
  Future<void> add(TicketEntry ticket) async {
    try {
      ticket.vehicle as Car;
      _ticketEntryCarDbRepository.add(ticket);
    } catch (e) {
      _ticketEntryMotorcycleDbRepository.add(ticket);
    }
  }

  @override
  delete(String id) async {
    var ticketCar = await _ticketEntryCarDbRepository.getById(id);
    var ticketMotorcycle = await _ticketEntryMotorcycleDbRepository.getById(id);

    if (ticketCar != null){
      _ticketEntryCarDbRepository.delete(ticketCar.id);
    }
    if (ticketMotorcycle != null){
      _ticketEntryMotorcycleDbRepository.delete(ticketMotorcycle.id);
    }
  }

  @override
  Future<TicketEntry?> getById(String id)  {
    var ticketCar = _ticketEntryCarDbRepository.getById(id);
    var ticketMotorcycle = _ticketEntryMotorcycleDbRepository.getById(id);
    Future<TicketEntry?> ticket = ticketCar;
    if (ticketCar != null){
      ticket = ticketCar;
    }
    if (ticketMotorcycle != null) {
      ticket = ticketMotorcycle;
    }
    return ticket;
  }

  @override
  Future<List<TicketEntry>> getList() async {
    var listTicketEntryCar = await _ticketEntryCarDbRepository.getList();
    var listTicketEntryMotorcycle = await _ticketEntryMotorcycleDbRepository.getList();
    List<TicketEntry> listTicket = [];
    if (listTicketEntryCar.length >= 0){
      listTicket.addAll(listTicketEntryCar);
    }
    if (listTicketEntryMotorcycle.length >= 0){
      listTicket.addAll(listTicketEntryMotorcycle);
    }

    return listTicket;
  }

}