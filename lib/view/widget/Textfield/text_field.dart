import 'package:flutter/material.dart';
import 'package:totalx_task/core/size/size.dart';

class Textfiels extends StatelessWidget {
  final String toptext;
  final String labeltext;
  const Textfiels({
    super.key,
    required this.labeltext,
    required this.toptext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(toptext),
        SizedBox(
          height: context.height(18),
        ),
        TextField(
          decoration: InputDecoration(
            focusColor: Colors.black,
            focusedBorder: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.all(2),
            hintText: labeltext,
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
          ),
        ),
      ],
    );
  }
}