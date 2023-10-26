import 'package:flutter/material.dart';

class LogUserName extends StatefulWidget {
  const LogUserName({required this.name, required this.formKey, Key? key})
      : super(key: key);
  final Function(String) name;
  final GlobalKey<FormState> formKey;

  @override
  State<LogUserName> createState() => _LogUserNameState();
}

class _LogUserNameState extends State<LogUserName> {
  // RegExp regExp = RegExp(r'^[a-zA-Z]+( [a-zA-Z]+)+$');

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Color(0xff455A64), width: 1),
        ),
        filled: true,
        fillColor: Color(0xffFFFFFF),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Color(0xff455A64),
            width: 1,
          ),
        ),
        // hintText: '(00) 0 0000-0000',
        // hintStyle: TextStyle(
        //     color: Color(0xff455A64),
        //     fontSize: 16,
        //     fontWeight: FontWeight.w300),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, entre o nome';
        } //else if (!regExp.hasMatch(value)) {
        //return 'Por favor, entre um nome válido';
        //}
        return null;
      },
      onChanged: (value) {
        widget.name(value);
      },
    );
  }
}
