
import 'package:flutter/material.dart';

class Radiobutton extends StatelessWidget {
  final String text;
  final void Function(String?) ontap;
  const Radiobutton({
    super.key,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      activeColor: Colors.blue,
      hoverColor: Colors.blue,
      title: Text(text),
      value: '',
      groupValue:
          'groupValue', // Make sure to replace 'groupValue' with your actual group value
      onChanged: ontap,
    );
  }
}