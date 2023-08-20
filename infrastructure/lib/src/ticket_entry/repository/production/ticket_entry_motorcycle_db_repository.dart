import 'package:domain/domain.dart';
import 'package:infrastructure/src/ticket_entry/anticorruption/ticket_entry_translator.dart';
import 'package:infrastructure/src/ticket_entry/persistence/dao/ticket_entry_motorcycle/ticket_entry_motorcycle_dao.dart';
import 'package:infrastructure/src/ticket_entry/repository/contracts/ticket_entry_repository_database.dart';

class TicketEntryMotorcycleDbRepository extends TicketEntryRepositoryDatabase {
  TicketEntryMotorcycleDbRepository(TicketEntryMotorcycleDao ticketEntryDao)
      : _ticketEntryMotorcycleDao = ticketEntryDao;
  final TicketEntryMotorcycleDao _ticketEntryMotorcycleDao;

  @override
  add(TicketEntry ticket) {
    _ticketEntryMotorcycleDao.insertTicketEntry(
        TicketEntryTranslator.fromMotorcyleDomainToDatabase(ticket));
  }

  @override
  Future<List<TicketEntry>> getList() async {
    final result = await _ticketEntryMotorcycleDao.getAllTickets();
    return result.map(TicketEntryTranslator.fromMotorcycleDatabaseToDomain).toList();
  }

  @override
  delete(String id) {
    _ticketEntryMotorcycleDao.deleteTicketEntry(id);
  }

  @override
  Future<TicketEntry?> getById(String id) async {
    var ticket = await _ticketEntryMotorcycleDao.getTicketEntryById(id);
    return TicketEntryTranslator.fromMotorcycleDatabaseToDomain(ticket);
  }
}
