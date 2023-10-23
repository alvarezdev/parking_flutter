import 'package:drift/drift.dart';
import 'package:infrastructure/src/ticket_entry/persistence/database/ticket_entry_database.dart';
import 'package:infrastructure/src/ticket_entry/persistence/entity/ticket_entry_entity_motorcycle.dart';
import 'package:injectable/injectable.dart';

part 'ticket_entry_motorcycle_dao.g.dart';

@injectable
@DriftAccessor(tables: [TicketEntryMotorcycleEntity])
class TicketEntryMotorcycleDao extends DatabaseAccessor<TicketEntryDatabase> with _$TicketEntryMotorcycleDaoMixin {
  TicketEntryMotorcycleDao(super.db);

  Future<void> insertTicketEntry(TicketEntryMotorcycleEntityCompanion ticket) async {
    await transaction(() async {
      await batch((batch) {
        batch.insert(ticketEntryMotorcycleEntity, ticket, mode: InsertMode.insertOrReplace);
      });
    });
  }

  Future<List<TicketEntryMotorcycleEntityData>> getAllTickets() async {
    return transaction(() async {
      return select(ticketEntryMotorcycleEntity).get();
    });
  }

  Future<TicketEntryMotorcycleEntityData?> getTicketEntryById(String id) async {
    return transaction(() async {
      return (select(ticketEntryMotorcycleEntity)..where((t) => t.id.equals(id)))
          .getSingleOrNull();
    });
  }

  deleteTicketEntry(String id) {
    (delete(ticketEntryMotorcycleEntity)..where((t) => t.id.equals(id))).go();
  }
}
