import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_flutter/dependencyInjection/dependency_injection.dart';
import 'package:parking_flutter/main.dart';
import 'package:parking_flutter/screen/pay/bloc/pay_bloc.dart';
import 'package:parking_flutter/screen/pay/pay_screen.dart';
import 'package:parking_flutter/screen/register_car/bloc/register_car_bloc.dart';
import 'package:parking_flutter/screen/register_car/register_car_screen.dart';
import 'package:parking_flutter/screen/register_motorcycle/bloc/register_motorcycle_bloc.dart';
import 'package:parking_flutter/screen/register_motorcycle/register_motorcycle_screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    HomeScreen.routeName: (context) => const HomeScreen(),
    RegisterCarScreen.routeName: (context) => BlocProvider(
      create: (_) => getIt<RegisterCarBloc>(),
      child: const RegisterCarScreen(),
    ),
    RegisterMotorcycleScreen.routeName: (context) => BlocProvider(
      create: (_) => getIt<RegisterMotorcycleBloc>(),
      child: const RegisterMotorcycleScreen(),
    ),
    PayScreen.routeName: (context) => BlocProvider(
      create: (context) => getIt<PayBloc>(),
      child: const PayScreen(),
    ),
  };

  static const int _transitionDurationInMillis = 550;

  /*static RouteFactory onGenerateRoute = (RouteSettings settings) {
    final name = settings.name;

    if (name == MovieDetailScreen.routeName) {
      const transitionDuration =
      Duration(milliseconds: _transitionDurationInMillis);
      final args = settings.arguments;

      return PageRouteBuilder(
        transitionDuration: transitionDuration,
        reverseTransitionDuration: transitionDuration,
        pageBuilder: (_, animation, ___) {
          return FadeTransition(
            opacity: animation,
            child: BlocProvider(
              create: (_) =>
              getIt<MovieDetailBloc>(param1: args)..add(GetMovie()),
              child: const MovieDetailScreen(),
            ),
          );
        },
      );
    }
    return null;
  };*/
}