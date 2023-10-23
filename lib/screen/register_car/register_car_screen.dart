import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_flutter/screen/register_car/bloc/register_car_bloc.dart';
import 'package:parking_flutter/shared/widgets/text_field_info.dart';

class RegisterCarScreen extends StatefulWidget {
  const RegisterCarScreen({super.key});

  static const routeName = 'register-car-screen';

  @override
  State<RegisterCarScreen> createState() => _RegisterCarScreen();
}

class _RegisterCarScreen extends State<RegisterCarScreen> {

  static const String _errorMessage = "Ingrese el valor correcto";
  static const String _plate = "Placa";

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                textFieldPlate(),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: (){
                    BlocProvider.of<RegisterCarBloc>(context).add(RegisterCar(controller.text));
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text("Aceptar"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textFieldPlate() {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: _plate,
          border: textFieldBorderDecoration,
          focusedBorder: textFieldBorderDecoration,
          enabledBorder: textFieldBorderDecoration,
          labelStyle: const TextStyle(color: CupertinoColors.label, fontSize: 15),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return _errorMessage;
          }
          return null;
        },
      ),
    );
  }

  InputBorder textFieldBorderDecoration = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
  );

}

