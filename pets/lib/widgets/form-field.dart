import 'package:flutter/material.dart';

class FormItem extends StatelessWidget {
  const FormItem({
    required this.formFieldName,
    this.initialValue,
    this.suffix,
    this.onChanged,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final String formFieldName;
  final Widget? suffix;
  final Function? onChanged;
  final String? initialValue;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some correct $formFieldName';
        }
        if (formFieldName == 'email') {
          final isEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value);
          if(!isEmail){
            return 'Please enter some correct email';
          }
        }
        else if(formFieldName == 'password'){
          final hasMinLength = value.length >= 6;
          if(!hasMinLength){
            return 'Plese enter some password with more than equal 6 characters';
          }
        }
        return null;
      },
      initialValue: initialValue,
      //onChanged: onChanged.call,
      decoration: InputDecoration(
        hintText: formFieldName,
        labelStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 50),
        suffixIcon: suffix,
      ),
      controller: controller,
      obscureText: formFieldName == 'password',
      obscuringCharacter: '*',
    );
  }
}
