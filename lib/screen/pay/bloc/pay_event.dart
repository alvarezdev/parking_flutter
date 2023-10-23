part of 'pay_bloc.dart';

@immutable
abstract class PayEvent extends Equatable {
  const PayEvent();
  @override
  List<Object> get props => [];
}

class GetVehicles extends PayEvent {

}