import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "code ninja";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome flutter"),
      ),
      body: Center(
        child: Container(
          child: Text("welcome to flutter in $days with $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
