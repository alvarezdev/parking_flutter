import 'package:domain/domain.dart';
import 'package:drift/drift.dart';
import 'package:infrastructure/src/ticket_entry/persistence/database/ticket_entry_database.dart';

class TicketEntryTranslator{
  static TicketEntry fromCarDatabaseToDomain(TicketEntryCarEntityData? carEntityData) {
    Car car = Car(carEntityData!.id);
    DateTime time = carEntityData.entryTime;
    return TicketEntry(car, time);
  }

  static TicketEntry fromMotorcycleDatabaseToDomain(TicketEntryMotorcycleEntityData? motorcycleEntityData) {
    Motorcycle motorcycle = Motorcycle(motorcycleEntityData!.id, motorcycleEntityData.cylinderCapacity);
    DateTime time = motorcycleEntityData.entryTime;
    return TicketEntry(motorcycle, time);
  }

  static TicketEntryCarEntityCompanion fromCarDomainToDatabase(TicketEntry ticketEntry) {
    return TicketEntryCarEntityCompanion(
      id: Value(ticketEntry.vehicle.plate),
      entryTime: Value(ticketEntry.entryTime)
    );
  }

  static TicketEntryMotorcycleEntityCompanion fromMotorcyleDomainToDatabase(TicketEntry ticketEntry) {
    return TicketEntryMotorcycleEntityCompanion(
      id: Value(ticketEntry.vehicle.plate),
      entryTime: Value(ticketEntry.entryTime),
      cylinderCapacity: Value((ticketEntry.vehicle as Motorcycle).cylinderCapacity),
    );
  }
}