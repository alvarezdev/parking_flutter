import 'package:domain/domain.dart';
import 'package:domain/src/shared/exception/business_exception.dart';
import 'package:domain/src/ticket_entry/service/ticket_entry_car_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../ticket_entry_car_service/ticket_entry_car_service_test.mocks.dart';

@GenerateMocks([TicketEntryRepository])
void main() {

  late MockTicketEntryRepository entryRepository;
  late TicketEntryCarService ticketEntryServiceCar;
  late List<TicketEntry> list = [];
  late String plate;
  late Car car;
  late TicketEntry ticket;

  setUp(() {
    entryRepository = MockTicketEntryRepository();
    ticketEntryServiceCar = TicketEntryCarService(entryRepository);
    list = [];
    plate = "FIS100";
    car = Car(plate);
    ticket = TicketEntry(car, DateTime.now());
  });

  test('addTicketEntry_success', () async {
    //Arrange
    when(entryRepository.getList()).thenAnswer((_) async => list);
    when(entryRepository.getById(plate)).thenAnswer((_) async => list.firstOrNull);
    when(entryRepository.add(ticket)).thenAnswer((_) async => { });

    //Act
    await ticketEntryServiceCar.addTicketEntry(ticket);
    list.add(ticket);

    //Assert
    when(entryRepository.getById(plate)).thenAnswer((_) async => list.firstOrNull);
    var ticketCar = await ticketEntryServiceCar.getTicketEntry(plate);
    expect(ticketCar, ticket);
  });

  test('getTicketEntry_success', () async {
    //Arrange
    list.add(ticket);
    when(entryRepository.getById(plate)).thenAnswer((_) async => list.firstOrNull);
    when(entryRepository.getById(plate)).thenAnswer((_) async => list.firstOrNull);

    //Act
    var getTicket = await ticketEntryServiceCar.getTicketEntry(plate);

    //Assert
    expect(getTicket, ticket);
  });

  test('getEmptyList_success', () async {
    //Arrange
    when(entryRepository.getList()).thenAnswer((_) async => list);

    //Act
    var ticketList = await ticketEntryServiceCar.getListTicketEntry();

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
    expect(() => ticketEntryServiceCar.addTicketEntry(ticket),
        throwsA(isA<BusinessException>()));
  });

  test('fullParking_exception', () async {
    //Arrange
    List<TicketEntry> tickets = [];
    for (var i = 0; i <= 21; i++) {
      Car car;
      if (i >= 0 && i <= 9) {
        car = Car("BAA10$i");
      } else {
        car = Car("BAA1$i");
      }
      tickets.add(TicketEntry(car, DateTime.now()));
    }

    for (var i = 0; i <= 7; i++) {
      Motorcycle motorcycle;
      if (i >= 0 && i <= 9) {
        motorcycle = Motorcycle("BAA10$i", 100.0);
      } else {
        motorcycle = Motorcycle("BAA1$i", 100.0);
      }
      tickets.add(TicketEntry(motorcycle, DateTime.now()));
    }

    when(entryRepository.getList()).thenAnswer((_) async => tickets);
    when(entryRepository.getById(plate)).thenAnswer((_) async => list.firstOrNull);
    when(entryRepository.add(ticket)).thenAnswer((_) async => {});

    //Act
    //Assert
    await expectLater(ticketEntryServiceCar.addTicketEntry(ticket), throwsA(isA<BusinessException>()));
  });
}
