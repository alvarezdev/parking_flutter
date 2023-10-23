import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'register_car_event.dart';
part 'register_car_state.dart';

@injectable
class RegisterCarBloc extends Bloc<RegisterCarEvent, RegisterCarState> {
  RegisterCarBloc({
    required TicketEntryCarService ticketEntryCarService
  })  : _ticketEntryCarService = ticketEntryCarService,
        super(RegisterCarStarted()) {
    on<RegisterCar>(_registerCar);
  }

  final TicketEntryCarService _ticketEntryCarService;

  Future<void> _registerCar(RegisterCar event, Emitter<RegisterCarState> emit) async {
    emit(RegisterCarLoading());
    try {
      final car = Car(event.plate);
      final ticket = TicketEntry(car,DateTime.now());
      await _ticketEntryCarService.addTicketEntry(ticket);
      emit(RegisterCarSuccess());
    } catch (e) {
      emit(RegisterCarError(e.toString()));
    }
  }
  
  @override
  Future<void> close() {
    debugPrint('HomeBloc - close $_ticketEntryCarService');
    return super.close();
  }
}
