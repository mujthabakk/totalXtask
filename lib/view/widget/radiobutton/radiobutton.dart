import 'package:flutter/material.dart';

class Radiobutton extends StatelessWidget {
  final String text;
  final void Function(String?) ontap;
  final bool isSelected;
  const Radiobutton({
    super.key,
    required this.text,
    required this.ontap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      fillColor: MaterialStatePropertyAll(
        isSelected ? Colors.blue : Colors.black,
      ),
      selected: isSelected,
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
