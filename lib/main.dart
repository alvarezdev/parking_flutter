import 'package:flutter/material.dart';
import 'package:parking_flutter/dependencyInjection/dependency_injection.dart';
import 'package:parking_flutter/screen/pay/pay_screen.dart';
import 'package:parking_flutter/screen/register_car/register_car_screen.dart';
import 'package:parking_flutter/screen/register_motorcycle/register_motorcycle_screen.dart';
import 'package:parking_flutter/shared/alert_dialog_generic.dart';
import 'package:parking_flutter/shared/app_routes.dart';

void main() {
  configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeScreen.routeName,
      routes: AppRouter.routes,
    );
    /* MaterialApp(
      title: 'App Parking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );*/
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parking"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => const AlertDialogGeneric()
                  );
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text("Ingresar"),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    PayScreen.routeName,
                  );
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text("Pagar"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
