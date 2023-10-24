import 'package:flutter/material.dart';

class BuildFormField extends StatefulWidget {
  final String labelText;
  final bool showVisibilityIcon;
  final TextEditingController controller;
  bool obscureText;

  BuildFormField({
    Key? key,
    this.obscureText = false,
    required this.labelText,
    this.showVisibilityIcon = false,
    required this.controller,
  }) : super(key: key);

  @override
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
    return Padding(
      padding: const EdgeInsets.only(left: 40, bottom: 20, right: 40),
      child: TextFormField(
        controller: widget.controller, // Usar o TextEditingController fornecido
        obscureText: widget.obscureText,
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
      ),
    );
  }
}
