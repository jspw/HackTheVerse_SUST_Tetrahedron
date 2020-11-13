import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController _controller;

  String labeltext;

  Icon xicon;

  CustomTextField(this._controller, this.labeltext,this.xicon);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: TextField(
        controller: _controller,
        style: TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          suffixIcon: xicon,
          labelText: labeltext,
          border: new OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          hoverColor: Colors.indigo,
          fillColor: Colors.blue,
        ),
      ),
    );
  }
}
