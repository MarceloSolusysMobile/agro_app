import 'package:agro_app/model/financa.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Indices extends StatefulWidget {
  const Indices({super.key});

  @override
  State<Indices> createState() => _IndicesState();
}

class _IndicesState extends State<Indices> {
  List<Financa> financas_list = [
    Financa(categoria: 'Vaneno', valor: 12000, color: Colors.red),
    Financa(categoria: 'Ração', valor: 10000, color: Colors.green),
    Financa(categoria: 'Água', valor: 9000, color: Colors.blue),
    Financa(categoria: 'Maquinário', valor: 15000, color: Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text('Indices'),
      ),
      body: Column(
        children: [
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(
              minimum: 5000,
              maximum: 15000,
              interval: 1000,
            ),
            series: <ChartSeries>[
              ColumnSeries<Financa, String>(
                dataSource: financas_list,
                pointColorMapper: (Financa financa, _) => financa.color,
                xValueMapper: (Financa financa, _) => financa.categoria,
                yValueMapper: (Financa financa, _) => financa.valor,
              )
            ],
          ),
          
        ],
      ),
    );
  }
}
