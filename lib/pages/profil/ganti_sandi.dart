import 'package:flutter/material.dart';

class GantiSandi extends StatelessWidget {
  const GantiSandi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Ganti Kata Sandi',
          style: TextStyle(
            color: Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[],
        ),
      ),
    );
  }
}
