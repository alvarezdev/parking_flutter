import 'package:domain/src/model/ticket.dart';

abstract class TicketRepository{
  addTicket(Ticket ticket);
  Ticket getTicket(String id);
  List<Ticket> getTicketList();
  deleteTicket(String id);
  deleteAll();
}