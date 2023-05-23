import 'package:domain/domain.dart';
import 'package:domain/src/ticket_entry/model/ticket_entry.dart';
import 'package:domain/src/ticket_exit/model/ticket_exit_motorcycle.dart';
import 'package:test/test.dart';

void main() {
  group('constructor', () {
    test('createTicketExitMotorcycleHour_success', () {
      //Arrange
      final month = 05;
      final day = 21;
      final year = 2023;
      final entryHour = 9;
      final exitHour = 10;
      final seconds = 0;
      final value = 500;
      final cylinderCapacity = 100.0;
      final plate = "BI1100";
      final motorcycle = Motorcycle(plate, cylinderCapacity);
      final entryTime = DateTime(year, month, day, entryHour, seconds);
      final exitTime = DateTime(year, month, day, exitHour, seconds);
      final ticket = TicketEntry(motorcycle, entryTime);
      //Act
      TicketExitMotorcycle ticketExitCar =
          TicketExitMotorcycle(ticket, exitTime);
      //Assert
      expect(value, equals(ticketExitCar.calculateParkingValue()));
    });

    test('createTicketExitMotorcycleDay_success', () {
      //Arrange
      final month = 05;
      final entryDay = 20;
      final exitDay = 21;
      final year = 2023;
      final value = 4000;
      final cylinderCapacity = 100.0;
      final plate = "BA1100";
      final motorcycle = Motorcycle(plate, cylinderCapacity);
      final entryTime = DateTime(year, month, entryDay);
      final exitTime = DateTime(year, month, exitDay);
      final ticket = TicketEntry(motorcycle, entryTime);
      //Act
      TicketExitMotorcycle ticketExitCar =
          TicketExitMotorcycle(ticket, exitTime);
      //Assert
      expect(value, equals(ticketExitCar.calculateParkingValue()));
    });

    test('createTicketExitMotorcycleHourCylinderCapacityGreater_success', () {
      //Arrange
      final month = 05;
      final day = 21;
      final year = 2023;
      final entryHour = 9;
      final exitHour = 10;
      final seconds = 0;
      final value = 2500;
      final cylinderCapacity = 600.0;
      final plate = "BI1100";
      final motorcycle = Motorcycle(plate, cylinderCapacity);
      final entryTime = DateTime(year, month, day, entryHour, seconds);
      final exitTime = DateTime(year, month, day, exitHour, seconds);
      final ticket = TicketEntry(motorcycle, entryTime);
      //Act
      TicketExitMotorcycle ticketExitCar =
          TicketExitMotorcycle(ticket, exitTime);
      //Assert
      expect(value, equals(ticketExitCar.calculateParkingValue()));
    });

    test('createTicketExitMotorcycleDayCylinderCapacityGreater_success', () {
      //Arrange
      final month = 05;
      final entryDay = 20;
      final exitDay = 21;
      final year = 2023;
      final value = 6000;
      final cylinderCapacity = 600.0;
      final plate = "FIS100";
      final motorcycle = Motorcycle(plate, cylinderCapacity);
      final entryTime = DateTime(year, month, entryDay);
      final exitTime = DateTime(year, month, exitDay);
      final ticket = TicketEntry(motorcycle, entryTime);
      //Act
      TicketExitMotorcycle ticketExitCar =
          TicketExitMotorcycle(ticket, exitTime);
      //Assert
      expect(value, equals(ticketExitCar.calculateParkingValue()));
    });
  });
}
