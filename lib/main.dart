import 'package:flutter/material.dart';
import 'package:lyf_flutter_app/pages/gridview_services.dart';
import 'package:lyf_flutter_app/pages/home.dart';

import 'pages/contract_screen.dart';

void main() {
  runApp(HotelApp());
}

class HotelApp extends StatelessWidget {
  const HotelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
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
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://storage.googleapis.com/a1aa/image/ZrUp88GfLCV1WSB9ajmuzJN7e11hwP4PA4jJxfbCE6lsalTnA.jpg',
            ),
          ),
        ),
        title: const Text(
          'Hello, Alpay',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  ContractPage()),
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
                  'Genga Ajayi',
                  'https://storage.googleapis.com/a1aa/image/rxek1hyItiSfT0gSKtoMl9au4TwoofRfCKN5xrDEGCag1KnOB.jpg',
                  ['Computer studies', 'English', 'Chemistry'],
                  5,
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
      List<String> skills, int rating) {
    return Card(
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
              backgroundImage: NetworkImage(imageUrl),
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
              children: skills.map((skill) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Chip(
                    label: Text(skill),
                    backgroundColor: Colors.purpleAccent,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
