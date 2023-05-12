import 'package:agro_app/model/Produto.dart';
import 'package:flutter/material.dart';

class ListagePrecos extends StatefulWidget {
  const ListagePrecos({super.key});

  @override
  State<ListagePrecos> createState() => _ListagePrecosState();
}

class _ListagePrecosState extends State<ListagePrecos> {
  List<Produto> produtos = [
    Produto(descricao: 'Soja', valor: 12.00),
    Produto(descricao: 'Milho', valor: 12.00),
    Produto(descricao: 'Feijão', valor: 12.00),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(produtos[index].descricao),
                          trailing: Text('R\$ ${produtos[index].valor.toString()}'),
                        ),
                      ),
                      const Divider()
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }
}
