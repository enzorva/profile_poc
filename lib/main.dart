import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:profile_poc/log_cellnumber.dart';
import 'package:profile_poc/log_email.dart';
import 'package:profile_poc/log_user_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  late String userName = '';
  late String cellNumber = '';
  late String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: 420,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/1000_F_267819930_Iye6k9nzmW1CnrZ6YvhyyXjLEHsgPFMY.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIwKuR9FrsBPW3aNFU4dG0g8mHVoSfij3Q5mxO2NfsWV-GbOLtJ2xS3wuZyDW7BcrVQIc&usqp=CAU',
                      ),
                      radius: 30,
                    ),
                    title: Text(
                      userName,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: Color(0xff455A64),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        height: 1.6,
                      ),
                    ),
                    subtitle: Text(
                      email,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: Color(0xff455A64),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        height: 1.6,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nome',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: Color(0xff455A64),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  //const SizedBox(height: 13),
                  LogUserName(
                      name: (value) {
                        setState(() {
                          userName = value;
                        });
                      },
                      formKey: _formKey),
                  const SizedBox(height: 25),
                  Text(
                    'Celular',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: Color(0xff455A64),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  LogCell(
                      onPhoneNumberChanged: (value) {
                        setState(() {
                          cellNumber = value;
                        });
                      },
                      formKey: _formKey,
                      controller: phoneNumberController),
                  const SizedBox(height: 25),
                  Text(
                    'Email',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: Color(0xff455A64),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  LogEmail(
                      email: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      formKey: _formKey,
                      controller: emailController)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
