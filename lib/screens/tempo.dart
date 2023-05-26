import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:agro_app/model/previsao.dart';
import 'package:http/http.dart' as http;

class Tempo extends StatefulWidget {
  const Tempo({super.key});

  @override
  State<Tempo> createState() => _TempoState();
}

class _TempoState extends State<Tempo> {
  Previsao minhaPrevisao = Previsao();
  
  final TextEditingController _controllerPesquisa =
      TextEditingController(text: '');

  final String apiKey = '5ebaf5ca0c1e0aca915c0a100f647dd9';    
  //import 'package:http/http.dart' as http;
  Future<Previsao> buscarTempo(String cidade) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather'
        '?q=$cidade&appid=$apiKey&units=metric'));
    
    if (response.statusCode == 200) {
      return Previsao.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao obter informações de clima');
    }
  }

  String convertGraus(double k){
    double c = (k - 273.15);
    return c.toStringAsFixed(2);
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: const Text("Previsão do Tempo")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading:const Icon(Icons.cloud_circle),
              title: Text('Previsao Tempo em ${_controllerPesquisa.text}'),
              subtitle: Text(minhaPrevisao.descricao),
              trailing: 
              Text('Max:${minhaPrevisao.temperaturaMax} Min: ${minhaPrevisao.temperaturaMin}'),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: _controllerPesquisa,
              decoration: const InputDecoration(
                hintText: 'Pesquisa de cidade',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: ()async {
                    minhaPrevisao = await 
                    buscarTempo(_controllerPesquisa.text);
                    
                    setState(() {                      
                    
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 60),
                  ),
                  child: const Text(
                    'Pesquisar',
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
