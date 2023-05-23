import 'package:domain/domain.dart';
import 'package:domain/src/shared/exception/business_exception.dart';
import 'package:domain/src/ticket_entry/model/ticket_entry.dart';
import 'package:domain/src/ticket_entry/repository/ticket_repository.dart';
import 'package:domain/src/ticket_entry/service/ticket_entry_motorcycle_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'ticket_entry_car_service_test.mocks.dart';

@GenerateMocks([TicketEntryRepository])
void main() {
  test('addTicketEntry_success', () {
    //Arrange
    final entryRepository = MockTicketEntryRepository();
    final plate = "BA1100";
    final cylinderCapacity = 100.0;
    final motorcycle = Motorcycle(plate, cylinderCapacity);
    final ticket = TicketEntry(motorcycle, DateTime.now());
    when(entryRepository.getList()).thenReturn(List.empty());
    when(entryRepository.getById(plate)).thenReturn(null);
    when(entryRepository.add(ticket)).thenAnswer((_) => {});
    final ticketEntryServiceCar = TicketEntryMotorcycleService(entryRepository);

    //Act
    ticketEntryServiceCar.addTicketEntry(ticket);

    //Assert
    when(entryRepository.getById(plate)).thenReturn(ticket);
    expect(ticketEntryServiceCar.getTicketEntry(plate), ticket);
  });

  test('getTicketEntry_success', () {
    //Arrange
    final entryRepository = MockTicketEntryRepository();
    final plate = "BA1100";
    final cylinderCapacity = 100.0;
    final motorcycle = Motorcycle(plate, cylinderCapacity);
    final ticket = TicketEntry(motorcycle, DateTime.now());
    when(entryRepository.getById(plate)).thenReturn(ticket);
    final ticketEntryServiceCar = TicketEntryMotorcycleService(entryRepository);

    //Act
    var getTicket = ticketEntryServiceCar.getTicketEntry(plate);

    //Assert
    expect(getTicket, ticket);
  });

  test('getEmptyList_success', () {
    //Arrange
    final entryRepository = MockTicketEntryRepository();
    when(entryRepository.getList()).thenReturn(List.empty());
    final ticketEntryServiceCar = TicketEntryMotorcycleService(entryRepository);

    //Act
    var ticketList = ticketEntryServiceCar.getListTicketEntry();

    //Assert
    expect(ticketList.length, 0);
  });

  test('repeatVehicle_exception', () {
    //Arrange
    final entryRepository = MockTicketEntryRepository();
    final plate = "BA1100";
    final cylinderCapacity = 100.0;
    final motorcycle = Motorcycle(plate, cylinderCapacity);
    final ticket = TicketEntry(motorcycle, DateTime.now());
    when(entryRepository.getList()).thenReturn(List.empty());
    when(entryRepository.getById(plate)).thenReturn(ticket);
    when(entryRepository.add(ticket)).thenAnswer((_) => {});
    final ticketEntryServiceCar = TicketEntryMotorcycleService(entryRepository);

    //Act
    //Assert
    expect(() => ticketEntryServiceCar.addTicketEntry(ticket),
        throwsA(isA<BusinessException>()));
  });

  test('fullParking_exception', () {
    //Arrange
    final entryRepository = MockTicketEntryRepository();
    final plate = "BA1100";
    final cylinderCapacity = 100.0;
    final motorcycle = Motorcycle(plate, cylinderCapacity);
    final ticket = TicketEntry(motorcycle, DateTime.now());

    List<TicketEntry> list = [];
    for (var i = 0; i <= 19; i++) {
      Car car;
      if (i >= 0 && i <= 9) {
        car = Car("BAA10$i");
      } else {
        car = Car("BAA1$i");
      }
      list.add(TicketEntry(car, DateTime.now()));
    }

    for (var i = 0; i <= 9; i++) {
      Motorcycle motorcycle;
      if (i >= 0 && i <= 9) {
        motorcycle = Motorcycle("BA110$i", 100.0);
      } else {
        motorcycle = Motorcycle("BA11$i", 100.0);
      }
      list.add(TicketEntry(motorcycle, DateTime.now()));
    }

    when(entryRepository.getList()).thenReturn(list);
    when(entryRepository.add(ticket)).thenAnswer((_) => {});
    final ticketEntryServiceCar = TicketEntryMotorcycleService(entryRepository);

    //Act
    //Assert
    expect(() => ticketEntryServiceCar.addTicketEntry(ticket),
        throwsA(isA<BusinessException>()));
  });
}
