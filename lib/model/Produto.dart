import 'package:testing_flutter/model/Categoria.dart';

class Produto {
  late String nome;
  late String descricao;
  late double preco;
  late Categoria categoria;

  Produto(this.nome, this.descricao, this.preco, this.categoria);
}