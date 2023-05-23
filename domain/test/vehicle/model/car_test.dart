import 'package:domain/src/shared/exception/business_exception.dart';
import 'package:domain/src/vehicle/model/car.dart';
import 'package:test/test.dart';

void main() {
  group('constructor', () {
    test('emptyPlate_exception', () {
      //Arrange
      const String plate = '';
      //Act
      //Assert
      expect(() => Car(plate), throwsA(isA<BusinessException>()));
    });

    test('plateWithFiveChars_exception', () {
      //Arrange
      const String plate = "FIS10";
      //Act
      //Assert
      expect(() => Car(plate), throwsA(isA<BusinessException>()));
    });

    test('plateWithSevenChars_exception', () {
      //Arrange
      const String plate = "FIS1000";
      //Act
      //Assert
      expect(() => Car(plate), throwsA(isA<BusinessException>()));
    });

    test('plateWithoutNumbers_exception', () {
      //Arrange
      const String plate = "ABCABC";
      //Act
      //Assert
      expect(() => Car(plate), throwsA(isA<BusinessException>()));
    });

    test('plateWithoutLetters_exception', () {
      //Arrange
      const String plate = "111222";
      //Act
      //Assert
      expect(() => Car(plate), throwsA(isA<BusinessException>()));
    });

    test('createCar_success', () {
      //Arrange
      const String plate = "FIS100";
      //Act
      Car car = Car(plate);
      //Assert
      expect(car.plate, equals(Car(plate).plate));
    });

  });
}
