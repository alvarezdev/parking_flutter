import 'package:domain/domain.dart';

abstract class TicketEntryRepositoryDatabase {
  add(TicketEntry ticket);

  Future<TicketEntry?> getById(String id);

  Future<List<TicketEntry>> getList();

  delete(String id);
}