import 'package:flutter/material.dart';
import 'package:testing_flutter/ListViewWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Color(0xFFE2AC3F),
          ),
        ),
        body: ListViewWidget());
  }
}
