import 'package:domain/domain.dart';
import 'package:infrastructure/infrastructure.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    TicketRepositoryMock ticketRepositoryMock = TicketRepositoryMock();
    TicketService? ticketService;

    setUp(() {
      ticketService = TicketService(ticketRepositoryMock);
    });

    test('EnterParking_EnterCarWhenParkingHasSpace_Successful_Test', () {

      //Arrenge
      Car car = Car(plate: "FIS100");
      Ticket ticket = Ticket(vehicle: car, ticketType: TicketType.car, entryTime: DateTime.now());

      //Act
      ticketService!.createEntryTicket(ticket);

      //Assert
      List<Ticket> list = ticketService!.getTicketList();
      Ticket getTicket = list.firstWhere((item) => item.id == ticket.id);
      expect(getTicket.id, ticket.id);
    });
  });
}
