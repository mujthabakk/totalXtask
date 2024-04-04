import 'package:flutter/material.dart';
import 'package:totalx_task/core/size/size.dart';

class FrontendPagesButton extends StatelessWidget {
  final String text;
  final void Function() ontap;
  const FrontendPagesButton(
      {super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width(328),
      height: context.height(90),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),
        onPressed: ontap,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
