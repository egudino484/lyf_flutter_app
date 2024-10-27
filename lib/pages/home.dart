import 'package:flutter/material.dart';

class CardListScreen extends StatelessWidget {
  // Lista de datos para los servicios (esto es un ejemplo)
  final List<String> services = List<String>.generate(10, (index) => "Servicio $index");

  CardListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Servicios'),
      ),
      body: ListView(
        children: cargarServicios(context), // Llama a la función que carga los servicios
      ),
    );
  }

  // Función que genera la lista de Cards
  List<Widget> cargarServicios(BuildContext context) {
    return services.map((service) {
      return Card(
        margin: const EdgeInsets.all(10),
        child: ListTile(
          leading: const Icon(Icons.work),
          title: Text(service),
          subtitle: Text('Descripción del $service'),
          onTap: () {
            // Acción al presionar la card
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Presionaste $service')),
            );
          },
        ),
      );
    }).toList(); // Convertimos el iterable a una lista de widgets
  }
}