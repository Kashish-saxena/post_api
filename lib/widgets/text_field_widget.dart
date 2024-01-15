import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget(
      {super.key, required this.controller, required this.text});
  TextEditingController controller;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 5,
              ),
            ]),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: text,
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ));
  }
}
