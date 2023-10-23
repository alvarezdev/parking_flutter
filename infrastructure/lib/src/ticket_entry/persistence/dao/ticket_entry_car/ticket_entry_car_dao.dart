import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:infrastructure/src/ticket_entry/persistence/database/ticket_entry_database.dart';
import 'package:infrastructure/src/ticket_entry/persistence/entity/ticket_entry_entity_car.dart';

part 'ticket_entry_car_dao.g.dart';

@injectable
@DriftAccessor(tables: [TicketEntryCarEntity])
class TicketEntryCarDao extends DatabaseAccessor<TicketEntryDatabase> with _$TicketEntryCarDaoMixin {
  TicketEntryCarDao(super.db);

  insertTicketEntry(TicketEntryCarEntityCompanion ticket) {
    into(ticketEntryCarEntity).insert(ticket);
  }

  Future<List<TicketEntryCarEntityData>> getAllTickets() async {
    return transaction(() async {
      return select(ticketEntryCarEntity).get();
    });
  }

  Future<TicketEntryCarEntityData?> getTicketEntryById(String id) async {
    return transaction(() async {
      return (select(ticketEntryCarEntity)..where((t) => t.id.equals(id)))
          .getSingleOrNull();
    });
  }

  deleteTicketEntry(String id) {
    (delete(ticketEntryCarEntity)..where((t) => t.id.equals(id))).go();
  }
}
