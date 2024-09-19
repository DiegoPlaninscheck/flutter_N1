import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  ListViewWidget({super.key});

  final List<String> categorias = <String>["Categoria 1", "Categoria 2", "Categoria 3"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categorias.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Text(categorias[index]),
        );
      },
    );
  }
}
