
import 'package:domain/domain.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infrastructure/src/ticket_entry/anticorruption/ticket_entry_translator.dart';
import 'package:infrastructure/src/ticket_entry/persistence/dao/ticket_entry_car/ticket_entry_car_dao.dart';
import 'package:infrastructure/src/ticket_entry/persistence/dao/ticket_entry_motorcycle/ticket_entry_motorcycle_dao.dart';
import 'package:infrastructure/src/ticket_entry/persistence/database/ticket_entry_database.dart';


void main() {
  late TicketEntryDatabase database;

  late String plate;
  late double cylinderCapacity;
  late Motorcycle motorcycle ;
  late TicketEntry ticket;

  setUp(() {
    database = TicketEntryDatabase.withQueryEx(NativeDatabase.memory());

    plate = "BA1100";
    cylinderCapacity = 100.0;
    motorcycle = Motorcycle(plate, cylinderCapacity);
    ticket = TicketEntry(motorcycle, DateTime.now());
  });

  tearDown(() async {
    await database.close();
  });

  group('Entry Tickets Motorcycle', () {

    test('insert ticket entry motorcycle > verify ticket insert', () async {

      //Arrenge
      final ticketEntryMotorcycleDao = TicketEntryMotorcycleDao(database);

      //Act
      ticketEntryMotorcycleDao.insertTicketEntry(TicketEntryTranslator.fromMotorcyleDomainToDatabase(ticket));
      final ticketEntryList = await ticketEntryMotorcycleDao.getAllTickets();
      final ticketEntry = TicketEntryTranslator.fromMotorcycleDatabaseToDomain(ticketEntryList.first);

      //Assert
      expect(ticketEntry.id, ticket.id);

    });

    test('get ticket entry motorcycle list > verify list', () async {

      //Arrenge
      final ticketEntryMotorcycleDao = TicketEntryMotorcycleDao(database);

      //Act

      for (var i = 0; i <= 9; i++) {
        Motorcycle motorcycle;
        if (i >= 0 && i <= 9) {
          motorcycle = Motorcycle("BA110$i", 100.0);
        } else {
          motorcycle = Motorcycle("BA11$i", 100.0);
        }
        ticket = TicketEntry(motorcycle, DateTime.now());
        ticketEntryMotorcycleDao.insertTicketEntry(TicketEntryTranslator.fromMotorcyleDomainToDatabase(ticket));
      }
      final ticketEntryList = await ticketEntryMotorcycleDao.getAllTickets();

      //Assert
      expect(ticketEntryList.length, 10);

    });

    test('get ticket entry motorcycle > verify ticket', () async {

      //Arrenge
      final ticketEntryMotorcycleDao = TicketEntryMotorcycleDao(database);

      //Act
      ticketEntryMotorcycleDao.insertTicketEntry(TicketEntryTranslator.fromMotorcyleDomainToDatabase(ticket));
      var t = await ticketEntryMotorcycleDao.getTicketEntryById(plate);
      final ticketEntry = TicketEntryTranslator.fromMotorcycleDatabaseToDomain(t);

      //Assert
      expect(ticketEntry.id, ticket.id);

    });

    test('delete ticket entry motorcycle > verify ticket delete', () async {

      //Arrenge
      final ticketEntryMotorcycleDao = TicketEntryMotorcycleDao(database);
      ticketEntryMotorcycleDao.insertTicketEntry(TicketEntryTranslator.fromMotorcyleDomainToDatabase(ticket));

      //Act
      ticketEntryMotorcycleDao.deleteTicketEntry(plate);

      final ticketEntry = await ticketEntryMotorcycleDao.getTicketEntryById(plate);

      //Assert
      expect(ticketEntry, null);

    });

  });
}
