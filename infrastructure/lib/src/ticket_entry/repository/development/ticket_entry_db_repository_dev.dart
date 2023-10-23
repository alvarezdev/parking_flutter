import 'package:domain/domain.dart';
import 'package:infrastructure/src/ticket_entry/repository/contracts/ticket_entry_repository_database.dart';


class TicketEntryCarDbRepositoryDev extends TicketEntryRepositoryDatabase{
  @override
  Future<void> add(TicketEntry ticket) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<TicketEntry?> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<List<TicketEntry>> getList() {
    // TODO: implement getList
    throw UnimplementedError();
  }


}