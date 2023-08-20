
import 'package:domain/domain.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infrastructure/src/ticket_entry/anticorruption/ticket_entry_translator.dart';
import 'package:infrastructure/src/ticket_entry/persistence/dao/ticket_entry_car/ticket_entry_car_dao.dart';
import 'package:infrastructure/src/ticket_entry/persistence/database/ticket_entry_database.dart';


void main() {
  late TicketEntryDatabase database;

  late String plate;
  late Car car;
  late TicketEntry ticket;

  setUp(() {
    database = TicketEntryDatabase.withQueryEx(NativeDatabase.memory());

    plate = "FIS100";
    car = Car(plate);
    ticket = TicketEntry(car, DateTime.now());
  });

  tearDown(() async {
    await database.close();
  });

  group('Entry Tickets Car', () {

    test('insert ticket entry car > verify ticket insert', () async {

      //Arrenge
      final ticketEntryCarDao = TicketEntryCarDao(database);

      //Act
      ticketEntryCarDao.insertTicketEntry(TicketEntryTranslator.fromCarDomainToDatabase(ticket));
      final ticketEntryList = await ticketEntryCarDao.getAllTickets();
      final ticketEntry = TicketEntryTranslator.fromCarDatabaseToDomain(ticketEntryList.first);

      //Assert
      expect(ticketEntry.id, ticket.id);

    });

    test('get ticket entry car list > verify list', () async {

      //Arrenge
      final ticketEntryCarDao = TicketEntryCarDao(database);

      //Act

      for (var i = 0; i <= 9; i++) {
        Car car;
        if (i >= 0 && i <= 9) {
          car = Car("BAA10$i");
        } else {
          car = Car("BAA1$i");
        }
        ticket = TicketEntry(car, DateTime.now());
        ticketEntryCarDao.insertTicketEntry(TicketEntryTranslator.fromCarDomainToDatabase(ticket));
      }
      final ticketEntryList = await ticketEntryCarDao.getAllTickets();

      //Assert
      expect(ticketEntryList.length, 10);

    });

    test('get ticket entry car > verify ticket', () async {

      //Arrenge
      final ticketEntryCarDao = TicketEntryCarDao(database);

      //Act
      ticketEntryCarDao.insertTicketEntry(TicketEntryTranslator.fromCarDomainToDatabase(ticket));
      var d = await ticketEntryCarDao.getTicketEntryById(plate);
      final ticketEntry = TicketEntryTranslator.fromCarDatabaseToDomain(d);

      //Assert
      expect(ticketEntry.id, ticket.id);

    });

    test('delete ticket entry car > verify ticket delete', () async {

      //Arrenge
      final ticketEntryCarDao = TicketEntryCarDao(database);
      ticketEntryCarDao.insertTicketEntry(TicketEntryTranslator.fromCarDomainToDatabase(ticket));

      //Act
      ticketEntryCarDao.deleteTicketEntry(plate);

      final ticketEntry = await ticketEntryCarDao.getTicketEntryById(plate);

      //Assert
      expect(ticketEntry, null);

    });


  });
}
