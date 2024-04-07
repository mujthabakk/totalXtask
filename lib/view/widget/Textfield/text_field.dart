// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:totalx_task/core/size/size.dart';

class Textfiels extends StatelessWidget {
  final String toptext;
  final String labeltext;
  final TextEditingController textEditingController;
  final TextInputType? keybordtype;
  const Textfiels({
    super.key,
    required this.toptext,
    required this.labeltext,
    required this.textEditingController,
    this.keybordtype,
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
          controller: textEditingController,
          keyboardType: keybordtype,
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
