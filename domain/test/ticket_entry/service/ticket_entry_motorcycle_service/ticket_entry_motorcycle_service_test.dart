import 'package:domain/domain.dart';
import 'package:domain/src/shared/exception/business_exception.dart';
import 'package:domain/src/ticket_entry/service/ticket_entry_motorcycle_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../ticket_entry_car_service/ticket_entry_car_service_test.mocks.dart';


@GenerateMocks([TicketEntryRepository])
void main() {

  late MockTicketEntryRepository entryRepository;
  late TicketEntryMotorcycleService ticketEntryMotorcycleService;
  late List<TicketEntry> list;
  late String plate;
  late double cylinderCapacity;
  late Motorcycle motorcycle ;
  late TicketEntry ticket;

  setUp(() {
    entryRepository = MockTicketEntryRepository();
    ticketEntryMotorcycleService = TicketEntryMotorcycleService(entryRepository);
    list = [];
    plate = "BA1100";
    cylinderCapacity = 100.0;
    motorcycle = Motorcycle(plate, cylinderCapacity);
    ticket = TicketEntry(motorcycle, DateTime.now());
  });

  test('addTicketEntry_success', () async {
    //Arrange
    when(entryRepository.getList()).thenAnswer((_) async => list);
    when(entryRepository.getById(plate)).thenAnswer((_) async => list.firstOrNull);
    when(entryRepository.add(ticket)).thenAnswer((_) async => { });

    //Act
    await ticketEntryMotorcycleService.addTicketEntry(ticket);
    list.add(ticket);

    //Assert
    when(entryRepository.getById(plate)).thenAnswer((_) async => list.firstOrNull);
    var ticketMotorcycle = await ticketEntryMotorcycleService.getTicketEntry(plate);
    expect(ticketMotorcycle, ticket);
  });

  test('getTicketEntry_success', () async {
    //Arrange
    list.add(ticket);
    when(entryRepository.getById(plate)).thenAnswer((_) async => list.firstOrNull);
    when(entryRepository.getById(plate)).thenAnswer((_) async => list.firstOrNull);

    //Act
    var getTicket = await ticketEntryMotorcycleService.getTicketEntry(plate);

    //Assert
    expect(getTicket, ticket);
  });

  test('getEmptyList_success', () async {
    //Arrange
    when(entryRepository.getList()).thenAnswer((_) async => list);

    //Act
    var ticketList = await ticketEntryMotorcycleService.getListTicketEntry();

    //Assert
    expect(ticketList.length, 0);
  });

  test('repeatVehicle_exception', () {
    //Arrange
    when(entryRepository.getList()).thenAnswer((_) async => list);
    list.add(ticket);
    when(entryRepository.getById(plate)).thenAnswer((_) async => list.firstOrNull);
    when(entryRepository.add(ticket)).thenAnswer((_) async => {});

    //Act
    //Assert
    expect(() => ticketEntryMotorcycleService.addTicketEntry(ticket),
        throwsA(isA<BusinessException>()));
  });

  test('fullParking_exception', () {
    //Arrange
    List<TicketEntry> tickets = [];
    for (var i = 0; i <= 19; i++) {
      Car car;
      if (i >= 0 && i <= 9) {
        car = Car("BAA10$i");
      } else {
        car = Car("BAA1$i");
      }
      tickets.add(TicketEntry(car, DateTime.now()));
    }

    for (var i = 0; i <= 9; i++) {
      Motorcycle motorcycle;
      if (i >= 0 && i <= 9) {
        motorcycle = Motorcycle("BA110$i", 100.0);
      } else {
        motorcycle = Motorcycle("BA11$i", 100.0);
      }
      tickets.add(TicketEntry(motorcycle, DateTime.now()));
    }

    when(entryRepository.getList()).thenAnswer((_) async => tickets);
    when(entryRepository.getById(plate)).thenAnswer((_) async => list.firstOrNull);
    when(entryRepository.add(ticket)).thenAnswer((_) async => {});

    //Act
    //Assert
    expect(() => ticketEntryMotorcycleService.addTicketEntry(ticket),
        throwsA(isA<BusinessException>()));
  });
}
