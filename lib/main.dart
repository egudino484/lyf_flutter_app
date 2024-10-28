import 'package:flutter/material.dart';
import 'package:lyf_flutter_app/pages/gridview_services.dart';
import 'package:lyf_flutter_app/pages/home.dart';
import 'dart:math';
import 'pages/contract_screen.dart';
import 'pages/detail_view.dart';
import 'pages/user_info_screen.dart';

void main() {
  runApp(HotelApp());
}

class HotelApp extends StatelessWidget {
  const HotelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  elevation: 0,
  backgroundColor: Colors.white,
  leading: Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {
        // Acción al hacer clic en el avatar
        print("Avatar clicked!");
        // Puedes navegar a otra pantalla o realizar cualquier otra acción
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserProfileScreen()), // Cambia a la página que deseas abrir
        );
      },
      child: const CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage('assets/imgs/detail_img.png'),
      ),
    ),
  ),
  title: const Text(
    'Hello, John',
    style: TextStyle(color: Colors.black),
  ),
  actions: [
    IconButton(
      icon: const Icon(Icons.notifications_none, color: Colors.black),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ContractPage()),
        );
      },
    ),
  ],
),
body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Subject, skill, technology',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Colors.grey),
              SizedBox(width: 5),
              Text('Lyf, Singapore'),
            ],
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: 4, // Puedes cambiar el número de tarjetas
              itemBuilder: (context, index) {
                return _buildServiceCard(
                  context,
                  "John Doe",
                  "https://example.com/image.jpg",
                  ["Programming", "Digital Marketing", "English"],
                  4,
                  () {
                    print("Card tapped!");

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailViewScreen()),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 1) {
            // Navegar directamente al presionar Config
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CardGridScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_membership),
            label: 'Membership',
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, String name, String imageUrl,
      List<String> skills, int rating, VoidCallback onClick) {
    final List<Color> colors = [
      Color(0xFFE573FF), // Color rosa
      Color(0xFFB3E5FC), // Color azul claro
      Color(0xFFD1C4E9), // Color morado claro
      Color(0xFFE573FF), // Color rosa

      Color(0xFFE573FF), // Color rosa
    ];

    Color getRandomColor() {
      final random = Random();
      return colors[random.nextInt(colors.length)];
    }

    return GestureDetector(
      onTap: onClick,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/imgs/detail_img.png'),
              ),
              const SizedBox(height: 10),
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                  );
                }),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 4.0, // Espacio horizontal entre textos
                children: skills
                    .map((skill) => Text(
                          skill,
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // Negritas
                            color: getRandomColor()
                                .withOpacity(0.8), // Color de fondo más claro
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
