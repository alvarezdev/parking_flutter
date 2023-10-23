import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_flutter/screen/pay/bloc/pay_bloc.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({super.key});
  static const routeName = 'pay-screen';

  @override
  State<PayScreen> createState() => _PayScreen();
}

class _PayScreen extends State<PayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PayBloc, PayState>(
        builder: (context, state) {
          if (state is PayLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container();
        },
        listener: (context, state) {
          if (state is PayError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
      ),
    );
  }
}
