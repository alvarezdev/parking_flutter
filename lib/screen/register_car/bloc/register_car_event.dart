part of 'register_car_bloc.dart';

@immutable
abstract class RegisterCarEvent extends Equatable {
  const RegisterCarEvent();
  @override
  List<Object> get props => [];
}

class RegisterCar extends RegisterCarEvent {
  const RegisterCar(this.plate);

  final String plate;

  @override
  List<Object> get props => [plate];
}