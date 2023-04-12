import 'package:domain/domain.dart';
import 'package:domain/src/enum/ticket_type.dart';

class Ticket {
  final String _vehicleDepartureTimeMsg = "The departure time must be greater than the entry time";

  String? _id;
  final Vehicle? _vehicle;
  final TicketType? _ticketType;
  final DateTime? _entryTime;
  DateTime? _departureTime;

  Ticket({required Vehicle? vehicle,
    required TicketType? ticketType,
    required DateTime? entryTime,
    DateTime? departureTime}) :
        _vehicle = vehicle,
        _ticketType = ticketType,
        _entryTime = entryTime,
        _departureTime = departureTime{
    _id = DateTime.now().toString();
    //var validateDepartureTime = _vehicleDepartureTime != null && _vehicleDepartureTime! > _vehicleEntryTime;
    //if (validateDepartureTime){
      //throw Exception(_vehicleDepartureTimeMsg);
    //}
  }

  String? get id => _id;

  Vehicle? get vehicle => _vehicle;

  TicketType? get ticketType => _ticketType;

  DateTime? get entryTime => _entryTime;

  DateTime get departureTime => _departureTime!;

  set departureTime(DateTime value) {
    _departureTime = value;
  }
}