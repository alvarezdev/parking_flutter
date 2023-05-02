import 'package:domain/src/ticket/model/ticket.dart';

class ExitTicket extends Ticket{

  ExitTicket(super.id, super._plate, super._entryTime, this._exitTime, this._value);

  final DateTime _exitTime;
  final int _value;

  DateTime get exitTime => _exitTime;
  int get value => _value;

}