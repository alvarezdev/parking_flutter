import 'package:domain/domain.dart';

class TicketRepositoryMock implements TicketRepository{
  List<Ticket>? ticketList;

  TicketRepositoryMock(){
    ticketList = [];
  }

  @override
  addTicket(Ticket ticket) {
    ticketList!.add(ticket);
  }

  @override
  deleteTicket(String id) {
    if (ticketList!.isNotEmpty) {
      var ticket = getTicket(id);
      ticketList!.remove(ticket);
    }
  }

  @override
  Ticket getTicket(String id) {
    if (ticketList!.isNotEmpty) {
      return ticketList!.firstWhere((item) => item.id == id);
    }else{
      throw Exception("Empty Database");
    }
  }

  @override
  List<Ticket> getTicketList() {
    return ticketList!;
  }

  @override
  deleteAll() {
    if (ticketList!.isNotEmpty) {
      ticketList!.clear();
    }
  }


}