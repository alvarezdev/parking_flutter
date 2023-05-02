import 'package:domain/src/ticket/model/entry_ticket.dart';

import '../model/exit_ticket.dart';

abstract class TicketRepository{

  addEntryTicket(EntryTicket ticket);

  EntryTicket getTicket(String id);

  deleteTicket(String id);
}