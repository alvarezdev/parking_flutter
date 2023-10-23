import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'register_motorcycle_event.dart';
part 'register_motorcycle_state.dart';

@injectable
class RegisterMotorcycleBloc extends Bloc<RegisterMotorcycleEvent, RegisterMotorcycleState> {
  RegisterMotorcycleBloc({
    required TicketEntryCarService ticketEntryService
  })  : _ticketEntryService = ticketEntryService,
        super(PayLoading()) {
    on<GetMovies>((event, emit) async {
      emit(PayLoading());
      try {
        final result = await _ticketEntryService.getListTicketEntry();
        emit(PaySuccess(tickets: result));
      } on BusinessException catch (e) {
        emit(PayError(e.toString()));
      } on BusinessException catch (e) { //NotConnectedToNetworkException
        emit(PayError(e.toString()));
      } catch (e) {
        emit(PayError(e.toString()));
      }
    });
  }

  final TicketEntryCarService _ticketEntryService;

  @override
  Future<void> close() {
    debugPrint('HomeBloc - close $_ticketEntryService');
    return super.close();
  }
}
