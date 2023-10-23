import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:parking_flutter/screen/register_car/register_car_screen.dart';
import 'package:parking_flutter/screen/register_motorcycle/register_motorcycle_screen.dart';
import 'package:parking_flutter/shared/app_routes.dart';

class AlertDialogGeneric extends StatelessWidget {
  const AlertDialogGeneric({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: AlertDialog(
        title: const Text('Tipo de vehiculo'),
        content: const Text('¿Cual desea registrar?'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.push(
                context, route(RegisterMotorcycleScreen.routeName)),
            child: const Text('Moto'),
          ),
          TextButton(
            onPressed: () =>
                Navigator.push(context, route(RegisterCarScreen.routeName)),
            child: const Text('Carro'),
          ),
        ],
      ),
    );
  }

  MaterialPageRoute route(String type) {
    return MaterialPageRoute(
        builder: AppRouter.routes.entries
            .firstWhere((element) => element.key == type)
            .value);
  }
}
