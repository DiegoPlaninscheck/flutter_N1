import 'package:flutter/material.dart';
import 'package:testing_flutter/model/Categoria.dart';
import 'package:testing_flutter/model/Produto.dart';
import 'cadastrarProdutoScreen.dart';

class ListViewWidget extends StatefulWidget {
  ListViewWidget({super.key});

  List<Produto> produtos = [
    Produto("Tijolo", "Tal", 10, Categoria("Alimento")),
    Produto("Alfinete", "Tal", 10, Categoria("Cosmetico")),
    Produto("Carro", "Tal", 100.000, Categoria("Tecnologia"))
  ];

  @override
  State<StatefulWidget> createState() => _ListViewWidget();
}

class _ListViewWidget extends State<ListViewWidget> {
  void _adicionarProduto(Produto produto) {
    setState(() {
      widget.produtos.add(produto);
    });
  }

  Future<void> _irParaCadastrarProduto(BuildContext context) async {
    final Produto? novoProduto = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CadastrarProdutoScreen()),
    );

    if (novoProduto != null) {
      _adicionarProduto(novoProduto);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Produtos'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _irParaCadastrarProduto(context),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.produtos.length,
              itemBuilder: (context, id) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.produtos[id].nome,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            widget.produtos[id].descricao,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Preço: R\$${widget.produtos[id].preco.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Categoria: ${widget.produtos[id].categoria.nome}',
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
