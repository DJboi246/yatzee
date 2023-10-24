import 'package:flutter/material.dart';
import 'yatzee.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'EduSABeginner'),
      home: const Frontscreen(),
    );
  }
}

class Frontscreen extends StatefulWidget {
  const Frontscreen({super.key});

  @override
  State<Frontscreen> createState() => _FrontscreenState();
}

class _FrontscreenState extends State<Frontscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Yatzee",
              style: TextStyle(
                  fontSize: 80, color: Color.fromARGB(247, 255, 60, 46)),
            ),
            ElevatedButton(
              child: const Text("Play", style: TextStyle(fontSize: 25),),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const Yatzee()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
