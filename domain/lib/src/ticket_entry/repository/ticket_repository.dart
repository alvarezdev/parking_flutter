import 'package:domain/src/ticket_entry/model/ticket_entry.dart';

abstract class TicketEntryRepository {
  add(TicketEntry ticket);

  TicketEntry? getById(String id);

  List<TicketEntry> getList();

  delete(String id);
}
