
import 'package:domain/src/exception/business_exception.dart';

class Ticket {

  Ticket(this._id, this._plate, this._entryTime){
    if(_id.isEmpty){
      throw BusinessException(_isEmptyPlate);
    }
  }

  final String _isEmptyPlate = "Plate the ticket is empty";

  final String _id;
  final String _plate;
  final DateTime _entryTime;

  String get id => _id;
  String get plate => _plate;
  DateTime get entryTime => _entryTime;
}