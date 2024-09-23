import 'package:flutter/material.dart';
import 'package:testing_flutter/listViewWidget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "App bar",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF2A0308),
        ),
        body: ListViewWidget());
  }
}
