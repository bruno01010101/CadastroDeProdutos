import 'package:flutter/material.dart';
import 'telas/lista_produtos.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Produtos',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: ListaProdutos(), // tela inicial
      debugShowCheckedModeBanner: false,
    );
  }
}