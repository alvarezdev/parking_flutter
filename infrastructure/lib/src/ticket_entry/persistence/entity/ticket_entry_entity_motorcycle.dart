import 'package:drift/drift.dart';

class TicketEntryMotorcycleEntity extends Table {
  TextColumn get id => text()();
  DateTimeColumn get entryTime => dateTime()();
  RealColumn get cylinderCapacity => real()();
  @override
  Set<Column> get primaryKey => {id};
}