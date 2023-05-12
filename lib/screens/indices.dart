import 'package:agro_app/model/financa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Indices extends StatefulWidget {
  const Indices({super.key});

  @override
  State<Indices> createState() => _IndicesState();
}

class _IndicesState extends State<Indices> {
  List<Indice> indices = [
    Indice(categoria: 'Veneno', valor: 100000),
    Indice(categoria: 'Ração', valor: 20000),
    Indice(categoria: 'Alimentação', valor: 40000),
    Indice(categoria: 'Água', valor: 33000),
    Indice(categoria: 'Maquinário', valor: 44000),
    Indice(categoria: 'Financiamento', valor: 44000),
  ];
  double returnValorTotal(List<Indice> indices) {
    double valorTotal = 0;
    for (var indice in indices) {
      valorTotal += indice.valor;
    }
    return valorTotal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Índices'),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'R\$ ${returnValorTotal(indices)}',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Text(
              'Gasto Total',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.blueGrey],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                        labelStyle: const TextStyle(color: Colors.white)),
                    primaryYAxis: NumericAxis(
                      minimum: 10000,
                      maximum: 120000,
                      interval: 10000.toDouble(),
                      labelPosition: ChartDataLabelPosition.outside,
                      labelAlignment: LabelAlignment.end,
                      rangePadding: ChartRangePadding.additional,
                      labelStyle:
                          const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    series: <ChartSeries>[
                      ColumnSeries<Indice, String>(
                          dataSource: indices,
                          xValueMapper: (Indice financa, _) =>
                              financa.categoria,
                          yValueMapper: (Indice financa, _) => financa.valor,
                          color: Colors.white)
                    ],
                    // Configurando a propriedade tooltipBehavior
                    tooltipBehavior: TooltipBehavior(
                      enable: true,
                      header: '',
                      canShowMarker: false,
                      builder: (dynamic data, dynamic point, dynamic series,
                          int pointIndex, int seriesIndex) {
                        return Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, blurRadius: 3)
                            ],
                          ),
                          child: Text('R\$${point.y}'),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
