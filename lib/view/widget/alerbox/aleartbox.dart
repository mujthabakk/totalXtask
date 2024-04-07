import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_task/controller/image_picker/image_picker_controller.dart';

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

    final imageProvider = Provider.of<ImagePickerController>(context);

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
              InkWell(
                borderRadius: BorderRadius.circular(context.width(240)),
                onTap: () {
                  imageProvider.pickImageGallery(context);
                },
                child: Consumer<ImagePickerController>(
                  builder: (context, value, _) {
                    return value.image != null
                        ? CircleAvatar(
                            backgroundImage: FileImage(
                              File(value.image!.path),
                            ),
                            maxRadius: context.width(40),
                          )
                        : CircleAvatar(
                            backgroundImage: const AssetImage(
                                'assets/image/Group 18796.png'),
                            maxRadius: context.width(40),
                          );
                  },
                ),
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
                labeltext: 'Enter your age',
                toptext: 'age',
                textEditingController: age,
              ),
              Textfiels(
                labeltext: 'Enter your number',
                toptext: 'number',
                textEditingController: phone,
                keybordtype: TextInputType.phone,
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
                name.text,
                age.text,
                phone.text,
                imageProvider.reference.toString(),
              );
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
