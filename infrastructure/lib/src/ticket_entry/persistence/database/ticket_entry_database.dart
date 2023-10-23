import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:infrastructure/src/ticket_entry/persistence/dao/ticket_entry_car/ticket_entry_car_dao.dart';
import 'package:infrastructure/src/ticket_entry/persistence/dao/ticket_entry_motorcycle/ticket_entry_motorcycle_dao.dart';
import 'package:infrastructure/src/ticket_entry/persistence/entity/ticket_entry_entity_car.dart';
import 'package:infrastructure/src/ticket_entry/persistence/entity/ticket_entry_entity_motorcycle.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'ticket_entry_database.g.dart';

@DriftDatabase(
  tables: [TicketEntryCarEntity, TicketEntryMotorcycleEntity],
  daos: [TicketEntryCarDao, TicketEntryMotorcycleDao]
)
@singleton
class TicketEntryDatabase extends _$TicketEntryDatabase {
  TicketEntryDatabase() : super(_openConnection());

  TicketEntryDatabase.withQueryEx(super.queryExecutor);

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db_ticket_entry_database.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}