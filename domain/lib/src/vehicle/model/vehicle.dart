import 'package:domain/src/shared/exception/business_exception.dart';

abstract class Vehicle {
  Vehicle(this._plate) {
    _plateValidation(_plate);
  }

  final String _plate;

  static const String _isEmptyVehiclePlateMsg = "Invalid vehicle plate format";
  static const int _maxNumChars = 6;
  static const String _plateRegularExpression = "^[A-Z]{3}[0-9]{3}|^[A-Z]{2}[0-9]{4}";

  String get plate => _plate;

  void _plateValidation(String plate) {
    RegExp reg = RegExp(_plateRegularExpression);
    if (!reg.hasMatch(plate) || plate.length > _maxNumChars) {
      throw BusinessException(_isEmptyVehiclePlateMsg);
    }

  }
}
