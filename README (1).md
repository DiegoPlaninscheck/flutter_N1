
# flutter_N1

## List View Widget

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
    Produto("Alfinete", "Tal", 10, Categoria("Coisa")),
    // Outros produtos...
  ];

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  // Código da classe...
}
```

