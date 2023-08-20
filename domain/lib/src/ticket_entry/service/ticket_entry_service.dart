import 'dart:core';
import 'package:domain/src/shared/exception/business_exception.dart';
import 'package:domain/src/ticket_entry/model/ticket_entry.dart';
import 'package:domain/src/ticket_entry/repository/ticket_repository.dart';

abstract class TicketEntryService {
  TicketEntryService(this._ticketRepository);

  final TicketEntryRepository _ticketRepository;

  abstract final int maxCapacityVehicle;
  Future<List<TicketEntry>> getListTicket();

  static const String _repeatVehiclePlateMsg = "The vehicle plate is repeat";
  static const String _maxCapacityVehicleMsg =
      "Parking capacity for vehicle is full";

  Future<void> addTicketEntry(TicketEntry entryTicket) async {
    var list = await getListTicket();
    var ticket = await getTicketEntry(entryTicket.vehicle.plate);
    if (list.length >= maxCapacityVehicle){
      throw BusinessException(_maxCapacityVehicleMsg);
    } else if (ticket != null) {
      throw BusinessException(_repeatVehiclePlateMsg);
    } else {
      await _ticketRepository.add(entryTicket);
    }
  }

  Future<TicketEntry?> getTicketEntry(String id) {
    return _ticketRepository.getById(id);
  }

  Future<List<TicketEntry>> getListTicketEntry(){
    return _ticketRepository.getList();
  }

  deleteTicket(String id){
    return _ticketRepository.delete(id);
  }

}
