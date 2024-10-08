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
