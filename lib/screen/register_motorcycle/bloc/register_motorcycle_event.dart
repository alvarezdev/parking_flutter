part of 'register_motorcycle_bloc.dart';

@immutable
abstract class RegisterMotorcycleEvent extends Equatable {
  const RegisterMotorcycleEvent();
  @override
  List<Object> get props => [];
}

class GetMovies extends RegisterMotorcycleEvent {}