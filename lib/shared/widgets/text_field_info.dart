import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldInfo extends StatefulWidget {
  const TextFieldInfo({super.key, required this.text, required this.errorText});

  final String text;
  final String errorText;

  @override
  State<TextFieldInfo> createState() => _TextFieldInfo();
}

class _TextFieldInfo extends State<TextFieldInfo> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: widget.text,
          border: textFieldBorderDecoration,
          focusedBorder: textFieldBorderDecoration,
          enabledBorder: textFieldBorderDecoration,
          labelStyle: const TextStyle(color: CupertinoColors.label, fontSize: 15),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.errorText;
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
