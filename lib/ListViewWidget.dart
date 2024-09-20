import 'package:flutter/material.dart';

class Produto {
  late String nome;
  late String descricao;
  late double preco;

  Produto(this.nome, this.descricao, this.preco);
}

class ListViewWidget extends StatelessWidget {
  ListViewWidget({super.key});

  final List<String> categorias = <String>[
    "Categoria 1",
    "Categoria 2",
    "Categoria 3"
  ];
  List<Produto> produtos = [];

  void addProdutos() {
    produtos.add(Produto("Tijolo", "Tal", 10));
    produtos.add(Produto("Alfinete", "Tal", 10));
    produtos.add(Produto("Carro", "Tal", 100.000));
  }

  @override
  Widget build(BuildContext context) {
    addProdutos();
    return ListView.builder(
      itemCount: categorias.length,
      itemBuilder: (context, index) {
        return Row(
          children: <Widget>[
            Text(categorias[index]),
            Expanded(
                child: SizedBox(
              height: 200.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: produtos.length,
                itemBuilder: (context, id) {
                  return Card(
                    child: Column(
                      children: [
                        Text(produtos[id].nome),
                        Text(produtos[id].descricao),
                        Text(produtos[id].preco.toString()),
                      ],
                    ),
                  );
                  // return Column(
                  //   children: [
                  //     Text(produtos[id].nome),
                  //     Text(produtos[id].descricao),
                  //     Text(produtos[id].preco.toString()),
                  //   ],
                  // );
                },
              ),
            )),
          ],
        );
      },
    );
  }
}
