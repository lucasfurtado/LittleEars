import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String value;
  final String label;
  final bool isPassword;

  Editor(
      {required this.controlador,
        required this.value,
        required this.label,
        required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(

          labelText: value,
          hintText: label,
        ),
        keyboardType: TextInputType.text,
        obscureText: isPassword,
      ),
    );
  }
}