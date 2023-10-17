import 'package:flutter/material.dart';

Widget buildTextFormField({
  required TextEditingController controller,
  required String labelText,
  String? Function(String?)? validator,
  bool? password,
  TextInputType? keyboard,
}) {
  defaultValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Informe o $labelText corretamente';
    }
    return null;
  }

  return Padding(
    padding: const EdgeInsets.only(left: 40, bottom: 20, right: 40),
    child: TextFormField(
        controller: controller,
        obscureText: password ?? false,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white70,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 19,
          ),
        ),
        keyboardType: keyboard ?? TextInputType.text,
        validator: validator ?? defaultValidator),
  );
}
