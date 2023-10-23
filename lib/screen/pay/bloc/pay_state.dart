part of 'pay_bloc.dart';

@immutable
abstract class PayState extends Equatable {
  const PayState();
  @override
  List<Object> get props => [];
}

class PayLoading extends PayState {

}

class PaySuccess extends PayState {
  const PaySuccess({required this.tickets});
  final List<TicketEntry> tickets;
  @override
  List<Object> get props => [tickets];
}

class PayError extends PayState {
  const PayError(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}