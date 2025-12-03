import 'package:flutter/material.dart';


class Savat extends StatefulWidget {
  const Savat({super.key});

  @override
  State<Savat> createState() => _SavatState();
}

class _SavatState extends State<Savat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Savat"),
      ),
    );
  }
}
