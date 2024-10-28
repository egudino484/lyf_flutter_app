import 'package:flutter/material.dart';

class CardGridScreen extends StatelessWidget {
  // Lista de datos para los servicios (esto es un ejemplo)
  final List<String> services = List<String>.generate(10, (index) => "Servicio $index");

  CardGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuadrícula de Servicios'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Número de columnas
        crossAxisSpacing: 10, // Espacio horizontal entre elementos
        mainAxisSpacing: 10, // Espacio vertical entre elementos
        padding: const EdgeInsets.all(10),
        children: cargarServicios(context), // Llama a la función que carga los servicios
      ),
    );
  }

  // Función que genera la lista de Cards para la cuadrícula
  List<Widget> cargarServicios(BuildContext context) {
    return services.map((service) {
      return Card(
        elevation: 5,
        margin: const EdgeInsets.all(5),
        child: InkWell(
          onTap: () {
            // Acción al presionar la card
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Presionaste $service')),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.work, size: 50), // Ícono grande
              const SizedBox(height: 10),
              Text(service, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              const Text('Descripción breve', style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      );
    }).toList(); // Convertimos el iterable a una lista de widgets
  }
}

