part of 'register_motorcycle_bloc.dart';

@immutable
abstract class RegisterMotorcycleState extends Equatable {
  const RegisterMotorcycleState();
  @override
  List<Object> get props => [];
}

class PayLoading extends RegisterMotorcycleState {}

class PaySuccess extends RegisterMotorcycleState {
  const PaySuccess({required this.tickets});
  final List<TicketEntry> tickets;
  @override
  List<Object> get props => [tickets];
}

class PayError extends RegisterMotorcycleState {
  const PayError(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}