import 'dart:core';

import 'package:domain/src/enum/ticket_type.dart';
import 'package:domain/src/model/ticket.dart';
import 'package:domain/src/repository/ticket_repository.dart';

class VehicleService{
  final String _fullParkingMsg = "The parking is full";
  final String _repeatVehiclePlateMsg = "The vehicle plate is repeat";
  final String _unauthorizedEntry = "Unauthorized entry";
  final String _maxCapacityCarMsg = "Parking capacity for cars is full";
  final String _maxCapacityMotorcycleMsg = "Parking capacity for Motorcycles is full";
  final String _vehicleNotExistMsg = "This vehicle is not in the parking";
  final int _maxCapacityCar = 20;
  final int _maxCapacityMotorcycle = 10;
  final int _maxCapacityParking = 30;
  final int _carHourValue = 1000;
  final int _motorcycleHourValue = 500;
  final int _carDayValue = 8000;
  final int _motorcycleDayValue = 4000;
  final int _addMotorcyclePay = 2000;
  final double _cylinderCapacityGreater = 500;

  final TicketRepository _ticketRepository;

  VehicleService(this._ticketRepository);

  createEntryTicket(Ticket ticket){
    List<Ticket> ticketList = _ticketRepository.getTicketList();
    if (ticketList.length >= _maxCapacityParking) {
      throw Exception(_fullParkingMsg);
    } else {
      bool maxCapacity = maxCapacityVehicle(ticketList);
      bool plateRepeat = checkPlateNoRepeat(ticketList, ticket);
      bool checkDate = validateDate(ticket);
      if (maxCapacity && plateRepeat && checkDate){
        _ticketRepository.addTicket(ticket);
      }
    }
  }

  bool maxCapacityVehicle(List<Ticket> ticketList){
    int numCar = ticketList.where((item) => item.ticketType == TicketType.car).length;
    int numMotorcycle = ticketList.where((item) => item.ticketType == TicketType.motorcycle).length;

    if (numCar == _maxCapacityCar) {
      throw Exception(_maxCapacityCarMsg);
    }
    if (numMotorcycle == _maxCapacityMotorcycle) {
      throw Exception(_maxCapacityMotorcycleMsg);
    }
    return true;
  }

  bool checkPlateNoRepeat(List<Ticket> ticketList, Ticket ticket) {
    bool vehicleExist = ticketList.any((item) => item.vehicle!.plate == ticket.vehicle!.plate );
    if (vehicleExist){
      throw Exception(_repeatVehiclePlateMsg);
    }else{
      return true;
    }
  }

  bool validateDate(Ticket ticket) {
    int dayOfWeek =  ticket.entryTime!.weekday;
    if ((dayOfWeek == DateTime.sunday || dayOfWeek == DateTime.monday) &&
        ticket.vehicle!.plate!.substring(0, 1) == "A"){
      throw Exception(_unauthorizedEntry);
    }else{
      return true;
    }
  }

  List<Ticket> getTicketList(){
    return _ticketRepository.getTicketList();
  }

  Ticket getVehicle(String id) {
    Ticket ticket = _ticketRepository.getTicket(id);
    return ticket;
  }

  leaveVehicle(String id) {
    _ticketRepository.deleteTicket(id);
  }

  int calculateValueTicket(TicketType ticketType,
      double cylinderCapacity,
      DateTime vehicleEntryTime,
      DateTime vehicleDepartureTime) {

    int time = vehicleDepartureTime.difference(vehicleDepartureTime).inMilliseconds;
    time = (time == 0) ? time++ : time;

    int hourPrice = 0;
    int dayPrice = 0;

    switch (ticketType) {
      case TicketType.car:
        hourPrice = _carHourValue;
        dayPrice = _carDayValue;
        break;
      case TicketType.motorcycle:
        hourPrice = _motorcycleHourValue;
        dayPrice = _motorcycleDayValue;
        break;
    }

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
    if (ticketType == TicketType.motorcycle && cylinderCapacity > _cylinderCapacityGreater) {
      result += _addMotorcyclePay;
    }
    return result;
  }

}