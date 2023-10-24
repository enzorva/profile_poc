import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    'Jesus de Nazaré',
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
                    'jesusosenhor@gmail.com.br',
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
        ],
      ),
    );
  }
}
