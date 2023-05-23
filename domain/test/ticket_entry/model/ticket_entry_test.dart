import 'package:domain/domain.dart';
import 'package:domain/src/shared/exception/business_exception.dart';
import 'package:domain/src/ticket_entry/model/ticket_entry.dart';
import 'package:test/test.dart';

void main() {
  group('constructor', () {
    test('zeroCylinderCapacity_exception', () {
      //Arrange
      const String plate = "AI1100";
      Car car = Car(plate);
      //Act
      //Assert
      expect(() => TicketEntry(car, DateTime(2023,5,15)),
          throwsA(isA<BusinessException>()));

    });

    test('zeroCylinderCapacity_exception', () {
      //Arrange
      const String plate = "AI1100";
      Car car = Car(plate);
      //Act
      //Assert
      expect(() => TicketEntry(car, DateTime(2023,5,14)),
          throwsA(isA<BusinessException>()));

    });
  });
}