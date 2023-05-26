import 'package:agro_app/screens/listagemPrecos.dart';
import 'package:agro_app/screens/tempo.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  
  void navigatelistagem() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ListagePrecos(),
      ),
    );
  }

   void navigateTempo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Tempo(),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text('Menu'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Card(
            child: InkWell(
              onTap: () {
                navigatelistagem();
              },
              splashColor: Colors.green.withAlpha(30),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.monetization_on,
                      size: 70,
                      color: Colors.green,
                    ),
                    Text("Cotação", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                navigateTempo();              
              },
              splashColor: Colors.green.withAlpha(30),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.sunny,
                      size: 70,
                      color: Colors.green,
                    ),
                    Text("Tempo", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
              },
              splashColor: Colors.green.withAlpha(30),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.graphic_eq_outlined,
                      size: 70,
                      color: Colors.green,
                    ),
                    Text("Índices", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
