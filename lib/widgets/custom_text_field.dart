import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function(String) onChanged;
  final String label;
  final String hint;
  final IconData icon;
  final bool obscureText;

  const CustomTextField(
      {super.key,
      required this.onChanged,
      required this.label,
      required this.icon,
      required this.hint,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
      onChanged: onChanged,
      obscureText: obscureText,
    );
  }
}
