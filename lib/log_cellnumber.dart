import 'package:flutter/material.dart';

class LogCell extends StatefulWidget {
  const LogCell(
      {required this.onPhoneNumberChanged,
      required this.formKey,
      required this.controller,
      Key? key})
      : super(key: key);

  final Function(String) onPhoneNumberChanged;
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;

  @override
  State<LogCell> createState() => _LogCellState();
}

class _LogCellState extends State<LogCell> {
  final regExp = RegExp(r'^\([1-9]{2}\) 9 [5-9][0-9]{3}-[0-9]{4}$');
  //r'^\(?[1-9]{2}\)?\s?9?[6789][0-9]{4}\-?[0-9]{4}$'); //^([14689][0-9]|2[12478]|3([1-5]|[7-8])|5([13-5])|7[193-7])9[0-9]{8}$
  //final regExp = RegExp(r'^(\([0-9]{2}\])?([1-9]{5})[0-9]{4}$');

  late TextEditingController phoneNumberController;

  @override
  void initState() {
    phoneNumberController = widget.controller;
    super.initState();
  }

  // @override
  // void dispose() {
  //   phoneNumberController.dispose();
  //   super.dispose();
  // }

  void updateFormattedPhoneNumber(String text) {
    String formatted = text.replaceAllMapped(
      RegExp(r'(\d{2})(\d{1})(\d{4})(\d{4})'),
      (Match m) => "(${m[1]}) ${m[2]} ${m[3]}-${m[4]}",
    );

    phoneNumberController.value = phoneNumberController.value.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: phoneNumberController,
      keyboardType: TextInputType.phone,
      autocorrect: false,
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
        hintText: '(00) 0 0000-0000',
        hintStyle: TextStyle(
            color: Color(0xff455A64),
            fontSize: 16,
            fontWeight: FontWeight.w300),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, digite o número de celular';
        } else if (!regExp.hasMatch(value)) {
          return 'Por favor, digite um número de celular válido';
        }
        return null;
      },
      onChanged: (value) {
        updateFormattedPhoneNumber(value);
        widget.onPhoneNumberChanged(value);
      },
    );
  }
}
