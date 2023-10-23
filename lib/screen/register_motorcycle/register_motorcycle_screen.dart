import 'package:flutter/material.dart';
import 'package:parking_flutter/shared/widgets/text_field_info.dart';

class RegisterMotorcycleScreen extends StatefulWidget {
  const RegisterMotorcycleScreen({super.key});

  static const routeName = 'register-motorcycle-screen';

  @override
  State<RegisterMotorcycleScreen> createState() => _RegisterMotorcycleScreen();
}

class _RegisterMotorcycleScreen extends State<RegisterMotorcycleScreen> {

  static const String _errorMessage = "Ingrese el valor correcto";
  static const String _plate = "Placa";
  static const String _cylinderCapacity = "Cilindraje";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                TextFieldInfo(text: _plate, errorText: _errorMessage),
                SizedBox(height: 15),
                TextFieldInfo(text: _cylinderCapacity, errorText: _errorMessage),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

