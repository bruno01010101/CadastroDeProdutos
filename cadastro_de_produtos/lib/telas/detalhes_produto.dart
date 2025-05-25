import 'package:flutter/material.dart';
import '../modelos/produtos.dart';

class DetalhesProduto extends StatelessWidget {
  final Produto produto;
  const DetalhesProduto({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(produto.nome)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.network(
              produto.imagemUrl,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 100),
            ),
            const SizedBox(height: 16),
            Text(produto.nome, style: Theme.of(context).textTheme.titleLarge),
            Text('Descrição: ${produto.descricao}'),
            Text('Categoria: ${produto.categoria}'),
            Text('Preço Compra: R\$ ${produto.precoCompra.toStringAsFixed(2)}'),
            Text('Preço Venda: R\$ ${produto.precoVenda.toStringAsFixed(2)}'),
            Text('Quantidade: ${produto.quantidade}'),
            Text('Desconto: ${produto.desconto.toStringAsFixed(1)}%'),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  produto.ativo ? Icons.check_circle : Icons.cancel,
                  color: produto.ativo ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 8),
                Text(produto.ativo ? 'Ativo' : 'Inativo'),
              ],
            ),
            Row(
              children: [
                Icon(
                  produto.promocao ? Icons.local_offer : Icons.remove,
                  color: produto.promocao ? Colors.blue : Colors.grey,
                ),
                const SizedBox(width: 8),
                Text(produto.promocao ? 'Em Promoção' : 'Sem Promoção'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
