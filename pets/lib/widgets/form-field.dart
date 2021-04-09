import 'package:flutter/material.dart';

class FormItem extends StatelessWidget {
  const FormItem({
    @required this.formFieldName,
    this.onChanged,
    this.initialValue,
    this.suffix,
    this.controller,
    Key key,
  }) : super(key: key);

  final String formFieldName;
  final Widget suffix;
  final Function onChanged;
  final String initialValue;
  final TextEditingController controller;

  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some correct $formFieldName';
        }
        return null;
      },
      initialValue: initialValue,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: formFieldName,
        labelStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 50),
        suffixIcon: suffix,
      ),
      controller: controller,
    );
  }
}
