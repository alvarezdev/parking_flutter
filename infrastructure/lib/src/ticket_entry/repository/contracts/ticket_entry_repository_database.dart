import 'package:domain/domain.dart';

abstract class TicketEntryRepositoryDatabase {
  Future<void> add(TicketEntry ticket);

  Future<TicketEntry?> getById(String id);

  Future<List<TicketEntry>> getList();

  Future<void> delete(String id);
}