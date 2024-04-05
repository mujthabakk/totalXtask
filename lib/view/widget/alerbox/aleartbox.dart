

import 'package:flutter/material.dart';
import 'package:totalx_task/core/size/size.dart';
import 'package:totalx_task/view/widget/Textfield/text_field.dart';

class AlertBox extends StatelessWidget {
  final String text;
  const AlertBox({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      content: SizedBox(
        width: context.width(300),
        height: context.width(250),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: const AssetImage('assets/image/Group 18796.png'),
              maxRadius: context.width(40),
            ),
            const Textfiels(
              labeltext: 'Enter your name',
              toptext: 'Name',
            ),
            SizedBox(
              height: context.height(20),
            ),
            const Textfiels(
              labeltext: 'Enter your number',
              toptext: 'number',
            )
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(onPressed: () {}, child: const Text("Cancel")),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 26, 124, 204),
            ),
            onPressed: () {},
            child: const Text(
              "save",
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
  }
}
