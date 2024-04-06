import 'package:flutter/material.dart';

import 'package:totalx_task/core/size/size.dart';
import 'package:totalx_task/service/user_service/user_service.dart';
import 'package:totalx_task/view/widget/Textfield/text_field.dart';

class AlertBox extends StatelessWidget {
  final String text;
  const AlertBox({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController age = TextEditingController();
    TextEditingController image = TextEditingController();

    return AlertDialog(
      title: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      content: SizedBox(
        width: context.width(300),
        height: context.width(330),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage:
                    const AssetImage('assets/image/Group 18796.png'),
                maxRadius: context.width(40),
              ),
              Textfiels(
                labeltext: 'Enter your name',
                toptext: 'Name',
                textEditingController: name,
              ),
              SizedBox(
                height: context.height(20),
              ),
              Textfiels(
                labeltext: 'Enter your number',
                toptext: 'number',
                textEditingController: phone,
              ),
              Textfiels(
                labeltext: 'Enter your age',
                toptext: 'age',
                textEditingController: age,
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 26, 124, 204),
            ),
            onPressed: () {
              FireStoreservice.create(
                  name.text, age.text, phone.text, image.toString());
              Navigator.pop(context);
              age.clear();
              phone.clear();
              name.clear();
            },
            child: const Text(
              "save",
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
  }
}
