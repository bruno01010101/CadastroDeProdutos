import 'package:flutter/material.dart';
import '../modelos/produtos.dart';

class CadastroProduto extends StatefulWidget {
  final Function(Produto) onProdutoCadastrado;

  const CadastroProduto({super.key, required this.onProdutoCadastrado});

  @override
  State<CadastroProduto> createState() => _CadastroProdutoState();
}

class _CadastroProdutoState extends State<CadastroProduto> {
  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _precoCompraController = TextEditingController();
  final _precoVendaController = TextEditingController();
  final _quantidadeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _categoriaController = TextEditingController();
  final _imagemUrlController = TextEditingController();

  bool _ativo = false;
  bool _promocao = false;
  double _desconto = 0;

  void _cadastrar() {
    if (_formKey.currentState!.validate()) {
      final produto = Produto(
        nome: _nomeController.text,
        precoCompra: double.parse(_precoCompraController.text),
        precoVenda: double.parse(_precoVendaController.text),
        quantidade: int.parse(_quantidadeController.text),
        descricao: _descricaoController.text,
        categoria: _categoriaController.text,
        imagemUrl: _imagemUrlController.text,
        ativo: _ativo,
        promocao: _promocao,
        desconto: _desconto,
      );
      widget.onProdutoCadastrado(produto);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Produto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) => value!.isEmpty ? 'Informe o nome' : null,
              ),
              TextFormField(
                controller: _precoCompraController,
                decoration: const InputDecoration(labelText: 'Preço de Compra'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Informe o preço de compra' : null,
              ),
              TextFormField(
                controller: _precoVendaController,
                decoration: const InputDecoration(labelText: 'Preço de Venda'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Informe o preço de venda' : null,
              ),
              TextFormField(
                controller: _quantidadeController,
                decoration: const InputDecoration(labelText: 'Quantidade'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Informe a quantidade' : null,
              ),
              TextFormField(
                controller: _descricaoController,
                decoration: const InputDecoration(labelText: 'Descrição'),
                validator: (value) => value!.isEmpty ? 'Informe a descrição' : null,
              ),
              TextFormField(
                controller: _categoriaController,
                decoration: const InputDecoration(labelText: 'Categoria'),
              ),
              TextFormField(
                controller: _imagemUrlController,
                decoration: const InputDecoration(labelText: 'URL da Imagem'),
              ),
              SwitchListTile(
                title: const Text('Produto Ativo'),
                value: _ativo,
                onChanged: (val) => setState(() => _ativo = val),
              ),
              CheckboxListTile(
                title: const Text('Em Promoção'),
                value: _promocao,
                onChanged: (val) => setState(() => _promocao = val!),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Desconto (%)'),
                  Slider(
                    value: _desconto,
                    min: 0,
                    max: 100,
                    divisions: 20,
                    label: '${_desconto.round()}%',
                    onChanged: (val) => setState(() => _desconto = val),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _cadastrar,
                child: const Text('Cadastrar Produto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}