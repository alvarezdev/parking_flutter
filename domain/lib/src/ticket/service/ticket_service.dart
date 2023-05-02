import 'dart:core';
import 'package:domain/src/ticket/model/entry_ticket.dart';
import 'package:domain/src/ticket/model/exit_ticket.dart';

import '../../../domain.dart';

class TicketService{

  TicketService(this._ticketRepository);

  final TicketRepository _ticketRepository;

  final int _carHourValue = 1000;
  final int _carDayValue = 8000;
  final int _motorcycleHourValue = 500;
  final int _motorcycleDayValue = 4000;
  final int _addMotorcyclePay = 2000;
  final double _cylinderCapacityGreater = 500;

  addEntryTicket(String plate){
    String id = "ticket$plate";
    EntryTicket entryTicket = EntryTicket(id, plate, DateTime.now());
    _ticketRepository.addEntryTicket(entryTicket);
  }

  EntryTicket getEntryTicket(String id) {
    // Si este ticket esta vacio o mal donde se debe manejar la excepcion
    return _ticketRepository.getTicket(id);
  }

  ExitTicket getExitCarTicket(EntryTicket ticket){
    DateTime exitTime = DateTime.now();
    int value = calculateParkingValue(ticket.entryTime, exitTime, _carHourValue, _carDayValue);
    return ExitTicket(ticket.id, ticket.plate, ticket.entryTime, exitTime, value);
  }

  ExitTicket getExitMotorcycleTicket(EntryTicket ticket, double cylinderCapacity){
    DateTime exitTime = DateTime.now();
    int value = calculateParkingValue(ticket.entryTime, exitTime, _motorcycleHourValue, _motorcycleDayValue);
    if (cylinderCapacity > _cylinderCapacityGreater) {
      value += _addMotorcyclePay;
    }
    return ExitTicket(ticket.id, ticket.plate, ticket.entryTime, exitTime, value);
  }

  int calculateParkingValue(DateTime entryTime, DateTime exitTime, int hourPrice, int dayPrice ) {

    int time = exitTime.difference(entryTime).inHours;
    time = (time == 0) ? time++ : time;

    int result = 0;

    if (time >= 1 && time <= 9){
      result = time * hourPrice;
    }else if (time > 9 && time <= 24){
      result = dayPrice;
    }else if (time > 24){
      int hours = time - 24;
      if (hours < 0){
        hours *= -1;
      }
      result = dayPrice + (hours * hourPrice);
    }
    return result;
  }

}