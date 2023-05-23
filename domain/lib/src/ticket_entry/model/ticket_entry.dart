import 'package:domain/domain.dart';
import 'package:domain/src/shared/exception/business_exception.dart';

class TicketEntry {
  TicketEntry(this._vehicle, this._entryTime) {
    _id = vehicle.plate;
    _entryTimeValidation();
  }

  static const String _unauthorizedEntry = "Unauthorized entry";
  static const String _firstLetter = "A";

  static const int sunday = DateTime.sunday;
  static const int monday = DateTime.monday;

  final Vehicle _vehicle;
  String? _id;
  final DateTime? _entryTime;

  String get id => _id!;
  Vehicle get vehicle => _vehicle;
  DateTime get entryTime => _entryTime!;

  void _entryTimeValidation() {
    int dayOfWeek = _entryTime!.weekday;
    if ((dayOfWeek == sunday || dayOfWeek == monday) &&
        vehicle.plate.substring(0, 1) == _firstLetter) {
      throw BusinessException(_unauthorizedEntry);
    }
  }
}
