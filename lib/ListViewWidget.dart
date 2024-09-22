import 'package:flutter/material.dart';
import 'package:testing_flutter/model/Categoria.dart';
import 'package:testing_flutter/model/Produto.dart';

class ListViewWidget extends StatelessWidget {
  ListViewWidget({super.key});

  List<Produto> produtos = [];

  void addProdutos() {
    produtos.add(Produto("Tijolo", "Tal", 10, Categoria("Alimento")));
    produtos.add(Produto("Alfinete", "Tal", 10, Categoria("Cosmetico")));
    produtos.add(Produto("Carro", "Tal", 100.000, Categoria("Tecnologia")));
  }

  @override
  Widget build(BuildContext context) {
    addProdutos();
    return ListView.builder(
      itemCount: produtos.length,
      itemBuilder: (context, id) {
        return SizedBox(
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 8,
            width: MediaQuery.of(context).size.width / 8,
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Card(
                  color: const Color(0xFFF8EBBE),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Text("teste"),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
