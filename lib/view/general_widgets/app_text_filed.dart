import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextInputType keyboardType;
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const AppTextField({
    Key? key,
    required this.keyboardType,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
      ),
    );
  }
}
