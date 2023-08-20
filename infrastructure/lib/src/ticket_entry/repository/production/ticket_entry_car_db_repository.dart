import 'package:domain/domain.dart';
import 'package:infrastructure/src/ticket_entry/anticorruption/ticket_entry_translator.dart';
import 'package:infrastructure/src/ticket_entry/persistence/dao/ticket_entry_car/ticket_entry_car_dao.dart';
import 'package:infrastructure/src/ticket_entry/repository/contracts/ticket_entry_repository_database.dart';

class TicketEntryCarDbRepository extends TicketEntryRepositoryDatabase {
  TicketEntryCarDbRepository(TicketEntryCarDao ticketEntryDao)
      : _ticketEntryCarDao = ticketEntryDao;
  final TicketEntryCarDao _ticketEntryCarDao;

  @override
  add(TicketEntry ticket) {
    _ticketEntryCarDao.insertTicketEntry(
        TicketEntryTranslator.fromCarDomainToDatabase(ticket));
  }

  @override
  Future<List<TicketEntry>> getList() async{
    final result = await _ticketEntryCarDao.getAllTickets();
    return result.map(TicketEntryTranslator.fromCarDatabaseToDomain).toList();
  }

  @override
  delete(String id) {
    _ticketEntryCarDao.deleteTicketEntry(id);
  }

  @override
  Future<TicketEntry?> getById(String id) async{
    var ticket = await _ticketEntryCarDao.getTicketEntryById(id);
    return TicketEntryTranslator.fromCarDatabaseToDomain(ticket);
  }
}
