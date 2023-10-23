part of 'register_car_bloc.dart';

@immutable
abstract class RegisterCarState extends Equatable {
  const RegisterCarState();
  @override
  List<Object> get props => [];
}

class RegisterCarStarted extends RegisterCarState {}

class RegisterCarLoading extends RegisterCarState {}

class RegisterCarSuccess extends RegisterCarState {}

class RegisterCarError extends RegisterCarState {
  const RegisterCarError(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}