import 'package:domain/src/ticket_entry/model/ticket_entry.dart';

abstract class TicketEntryRepository {
  Future<void> add(TicketEntry ticket);

  Future<TicketEntry?> getById(String id);

  Future<List<TicketEntry>> getList();

  Future<void> delete(String id);
}
