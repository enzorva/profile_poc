import 'package:flutter/material.dart';

class LogEmail extends StatefulWidget {
  const LogEmail(
      {required this.email,
      required this.formKey,
      required this.controller,
      Key? key})
      : super(key: key);
  final Function(String) email;
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;

  @override
  State<LogEmail> createState() => LogEmailState();
}

class LogEmailState extends State<LogEmail> {
  final regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  late TextEditingController emailController;

  @override
  void initState() {
    emailController = widget.controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      controller: emailController,
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
        widget.email(value);
      },
    );
  }
}
