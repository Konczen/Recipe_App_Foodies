import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final hintText;
  final VoidCallback onChanged;

  CustomTextField(this.controller, this.hintText, {this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: TextField(
            onChanged: (String text) {
              this.onChanged();
            },
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    controller.clear();
                  }),
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Colors.black, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(color: Colors.blue, width: 1.5),
              ),
              prefixIcon: Icon(Icons.search),
            )));
  }
}
