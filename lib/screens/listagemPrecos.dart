import 'package:agro_app/model/produto.dart';
import 'package:flutter/material.dart';

class ListagePrecos extends StatefulWidget {
  const ListagePrecos({super.key});

  @override
  State<ListagePrecos> createState() => _ListagePrecosState();
}

class _ListagePrecosState extends State<ListagePrecos> {
  
  List<Produto> produtos = [
    Produto(descricao: 'Estado SP', nome: 'Soja', valor: 12.50),
    Produto(descricao: 'Estado SP', nome: 'Milho', valor: 11.60),
    Produto(descricao: 'Estado SP', nome: 'Feijão', valor: 23.60),
    Produto(descricao: 'Estado SP', nome: 'Arroz', valor: 15.00),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            title: const Text("Cotação do Dia")),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: produtos.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title:Text(produtos[index].nome) ,
                        subtitle: Text(produtos[index].descricao),
                        trailing:Text('R\$${produtos[index].valor}'),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }
}
