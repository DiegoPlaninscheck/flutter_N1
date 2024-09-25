# Atividade avaliativa sobre Flutter

## Widgets

### Main
```dart
import 'package:flutter/material.dart';
import 'package:testing_flutter/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
```
### Home
```dart
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
```
### List View Widget
 ```dart
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
```

### Cadastrar Produto Screen
```dart
import 'package:flutter/material.dart';
import 'package:testing_flutter/model/Categoria.dart';
import 'package:testing_flutter/model/Produto.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CadastrarProdutoScreen extends StatefulWidget {
  const CadastrarProdutoScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CadastrarProdutoScreenState();
}

class _CadastrarProdutoScreenState extends State<CadastrarProdutoScreen> {
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _precoController = TextEditingController();
  final _categoriaController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _descricaoController.dispose();
    _precoController.dispose();
    _categoriaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome do Produto'),
            ),
            TextField(
              controller: _descricaoController,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
            TextField(
              controller: _precoController,
              decoration: const InputDecoration(labelText: 'Preço'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _categoriaController,
              decoration: const InputDecoration(labelText: 'Categoria'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final String nome = _nomeController.text;
                final String descricao = _descricaoController.text;
                final double preco = double.tryParse(_precoController.text) ?? 0;
                final Categoria categoria = Categoria(_categoriaController.text);
                String msg = "Erro no cadastro do produto!";
                Color backgroundColor = const Color(0xFFE2AC3F);
                Color textColor = Colors.white;

                if (nome.isNotEmpty && descricao.isNotEmpty) {
                  msg = "Produto cadastrado com sucesso!";
                  backgroundColor = const Color(0xFF7BA58D);
                  textColor = Colors.black;
                  Produto novoProduto = Produto(nome, descricao, preco, categoria);

                  // Retorna o novo produto para a tela anterior
                  Navigator.pop(context, novoProduto);
                }
                Fluttertoast.showToast(
                  msg: msg,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.TOP,
                  backgroundColor: backgroundColor,
                  textColor: textColor,
                );
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xFFE2AC3F)),
              ),
              child: const Text('Cadastrar Produto', style: TextStyle(color: Colors.black),),
            )
          ],
        ),
      ),
    );
  }
}
```

### Editar Produto Screen
```dart
import 'package:flutter/material.dart';
import 'package:testing_flutter/model/Categoria.dart';
import 'package:testing_flutter/model/Produto.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditarProdutoScreen extends StatefulWidget {
  const EditarProdutoScreen({super.key});

  @override
  State<StatefulWidget> createState() => _EditarProdutoScreenState();
}

class _EditarProdutoScreenState extends State<EditarProdutoScreen> {
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _precoController = TextEditingController();
  final _categoriaController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _descricaoController.dispose();
    _precoController.dispose();
    _categoriaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome do Produto'),
            ),
            TextField(
              controller: _descricaoController,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
            TextField(
              controller: _precoController,
              decoration: const InputDecoration(labelText: 'Preço'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _categoriaController,
              decoration: const InputDecoration(labelText: 'Categoria'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final String nome = _nomeController.text;
                final String descricao = _descricaoController.text;
                final double preco = double.tryParse(_precoController.text) ?? 0;
                final Categoria categoria = Categoria(_categoriaController.text);
                String msg = "Erro ao editar o produto!";
                Color backgroundColor = const Color(0xFFE2AC3F);
                Color textColor = Colors.white;

                if (nome.isNotEmpty && descricao.isNotEmpty) {
                  msg = "Produto editado com sucesso!";
                  backgroundColor = const Color(0xFF7BA58D);
                  textColor = Colors.black;
                  Produto novoProduto = Produto(nome, descricao, preco, categoria);

                  // Retorna o novo produto para a tela anterior
                  Navigator.pop(context, novoProduto);
                }
                Fluttertoast.showToast(
                  msg: msg,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.TOP,
                  backgroundColor: backgroundColor,
                  textColor: textColor,
                );
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xFFE2AC3F)),
              ),
              child: const Text('Editar Produto', style: TextStyle(color: Colors.black),),
            )
          ],
        ),
      ),
    );
  }
}
```
