import 'dart:convert';

import 'package:agro_app/model/tempo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PrevisaoTempo extends StatefulWidget {
  const PrevisaoTempo({super.key});

  @override
  State<PrevisaoTempo> createState() => _PrevisaoTempoState();
}

class _PrevisaoTempoState extends State<PrevisaoTempo> {
  final TextEditingController _controllerCidade =
      TextEditingController(text: '');
  final String apiKey = '5ebaf5ca0c1e0aca915c0a100f647dd9';
  Tempo meuTempo = Tempo();

  Future<Tempo> buscarTempo(String cidade) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cidade&appid=$apiKey'));
    if (response.statusCode == 200) {
      return Tempo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao obter informações de clima');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text('Previsão do Tempo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            meuTempo.descricao.isEmpty
                ? const SizedBox()
                : Card(
                    child: ListTile(
                      leading: const Icon(Icons.cloud),
                      title: Text(
                          'Previsão do tempo em ${_controllerCidade.text}'),
                      subtitle: Text('Hoje: ${meuTempo.descricao}'),
                      trailing: Text(
                          'Min:${meuTempo.temperaturaMin} Max:${meuTempo.temperaturaMax}'),
                    ),
                  ),
            const SizedBox(height: 20),
            TextField(
              controller: _controllerCidade,
              decoration: const InputDecoration(
                hintText: 'Digite o nome da Cidade',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      meuTempo = await buscarTempo(_controllerCidade.text);
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(double.infinity, 60),
                    ),
                    child: const Text(
                      'Buscar',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
