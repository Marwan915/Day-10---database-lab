import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldWidget extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  final bool isPassword;

  const TextFieldWidget({
    super.key,
    required this.text,
    required this.controller,
    this.isPassword = false,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool isobscureText = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: isobscureText,
      decoration: InputDecoration(
        labelText: widget.text,
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  isobscureText = !isobscureText;
                  setState(() {});
                },
                child: Icon(
                    isobscureText ? Icons.visibility : Icons.visibility_off),
              )
            : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
    );
  }
}
