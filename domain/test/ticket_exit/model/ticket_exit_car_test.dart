import 'package:domain/domain.dart';
import 'package:domain/src/ticket_entry/model/ticket_entry.dart';
import 'package:domain/src/ticket_exit/model/ticket_exit_car.dart';
import 'package:domain/src/vehicle/model/car.dart';
import 'package:test/test.dart';

void main() {
  group('constructor', () {
    test('createTicketExitCarHour_success', () {
      //Arrange
      final month = 05;
      final day = 21;
      final year = 2023;
      final entryHour = 9;
      final exitHour = 10;
      final seconds = 0;
      final value = 1000;
      final plate = "FIS100";
      final car = Car(plate);
      final entryTime = DateTime(year, month, day, entryHour, seconds);
      final exitTime = DateTime(year, month, day, exitHour, seconds);
      final ticket = TicketEntry(car, entryTime);
      //Act
      TicketExitCar ticketExitCar = TicketExitCar(ticket, exitTime);
      //Assert
      expect(value, equals(ticketExitCar.calculateParkingValue()));
    });

    test('createTicketExitCarDay_success', () {
      //Arrange
      final month = 05;
      final entryDay = 20;
      final exitDay = 21;
      final year = 2023;
      final value = 8000;
      final plate = "FIS100";
      final car = Car(plate);
      final entryTime = DateTime(year, month, entryDay);
      final exitTime = DateTime(year, month, exitDay);
      final ticket = TicketEntry(car, entryTime);
      //Act
      TicketExitCar ticketExitCar = TicketExitCar(ticket, exitTime);
      //Assert
      expect(value, equals(ticketExitCar.calculateParkingValue()));
    });
  });
}
