import 'package:domain/src/ticket_entry/model/ticket_entry.dart';

abstract class TicketExit {
  TicketExit(this._ticketEntry, this._exitTime);

  final TicketEntry _ticketEntry;
  final DateTime _exitTime;

  abstract final int hourPrice;
  abstract final int dayPrice;

  TicketEntry get ticketEntry => _ticketEntry;
  DateTime get exitTime => _exitTime;

  int calculateValue() {
    DateTime entryTime = _ticketEntry.entryTime;
    int time = exitTime.difference(entryTime).inHours;
    time = (time == 0) ? time++ : time;

    int result = 0;

    if (time >= 1 && time <= 9) {
      result = time * hourPrice;
    } else if (time > 9 && time <= 24) {
      result = dayPrice;
    } else if (time > 24) {
      int hours = time - 24;
      if (hours < 0) {
        hours *= -1;
      }
      result = dayPrice + (hours * hourPrice);
    }
    return result;
  }
}
