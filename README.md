# flutter_N1

## List View Widget
 [code]
import 'package:flutter/material.dart';
import 'package:testing_flutter/editarProdutoScreen.dart';
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

  void _editarProduto(Produto produto, int id) {
    setState(() {
      widget.produtos[id] = produto;
    });
  }

  void _deletarProduto(int id) {
    setState(() {
      widget.produtos.removeAt(id);
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

  Future<void> _irParaEditarProduto(BuildContext context, int id) async {
    final Produto? novoProduto = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const EditarProdutoScreen()));

    if (novoProduto != null) {
      _editarProduto(novoProduto, id);
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
        backgroundColor: const Color(0xFF2A0308),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.produtos.length,
              itemBuilder: (context, id) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: const Color(0xFFF8EBBE),
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.produtos[id].nome,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () =>
                                    _irParaEditarProduto(context, id),
                              )
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.produtos[id].descricao,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                  onPressed: () => _deletarProduto(id),
                                  icon: const Icon(Icons.delete))
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Preço: R\$${widget.produtos[id].preco.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF7BA58D),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Categoria: ${widget.produtos[id].categoria.nome}',
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
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

 [code]
