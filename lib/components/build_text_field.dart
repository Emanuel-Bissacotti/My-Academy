import 'package:flutter/material.dart';

class BuildFormField extends StatefulWidget {
  final String labelText;
  final bool showVisibilityIcon;
  String? Function(String?)? validator;
  TextInputType? keyboard;
  final TextEditingController controller;
  bool obscureText;

  BuildFormField(
      {Key? key,
      this.obscureText = false,
      required this.labelText,
      this.showVisibilityIcon = false,
      required this.controller,
      this.keyboard})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BuildFormFieldState createState() => _BuildFormFieldState();
}

class _BuildFormFieldState extends State<BuildFormField> {
  void togglePasswordVisibility() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    defaultValidator(value) {
      if (value == null || value.isEmpty) {
        return 'Informe o ${widget.labelText} corretamente';
      }
      return null;
    }

    return Padding(
      padding: const EdgeInsets.only(left: 40, bottom: 20, right: 40),
      child: TextFormField(
        controller: widget.controller, // Usar o TextEditingController fornecido
        obscureText: widget.obscureText,
        keyboardType: widget.keyboard ?? TextInputType.text,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white70,
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 19,
          ),
          suffixIcon: widget.showVisibilityIcon
              ? IconButton(
                  icon: Icon(
                    widget.obscureText
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: togglePasswordVisibility,
                )
              : null,
        ),
        validator: widget.validator ?? defaultValidator,
      ),
    );
  }
}
