import 'package:drift/drift.dart';

class TicketEntryCarEntity extends Table {
  TextColumn get id => text()();
  DateTimeColumn get entryTime => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}