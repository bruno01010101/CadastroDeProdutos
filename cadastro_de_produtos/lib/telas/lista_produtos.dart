import 'package:flutter/material.dart';
import 'cadastro_produto.dart';
import 'detalhes_produto.dart';
import '../modelos/produtos.dart';

class ListaProdutos extends StatefulWidget {
  const ListaProdutos({super.key});

  @override
  State<ListaProdutos> createState() => _ListaProdutosState();
}

class _ListaProdutosState extends State<ListaProdutos> {
  final List<Produto> _produtos = [];

  void _adicionarProduto(Produto produto) {
    setState(() {
      _produtos.add(produto);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Produtos')),
      body: ListView.builder(
        itemCount: _produtos.length,
        itemBuilder: (context, index) {
          final produto = _produtos[index];
          return ListTile(
            leading: Image.network(
              produto.imagemUrl,
              width: 50,
              height: 50,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
            ),
            title: Text(produto.nome),
            subtitle: Text('R\$ ${produto.precoVenda.toStringAsFixed(2)}'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetalhesProduto(produto: produto),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CadastroProduto(onProdutoCadastrado: _adicionarProduto),
          ),
        ),
      ),
    );
  }
}
