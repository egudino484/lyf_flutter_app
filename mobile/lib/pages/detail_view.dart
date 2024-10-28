import 'package:flutter/material.dart';

import 'payment_process_screen.dart';

class DetailViewScreen extends StatefulWidget {
  @override
  _DetailViewScreenState createState() => _DetailViewScreenState();
}

class _DetailViewScreenState extends State<DetailViewScreen> {
  String selectedSubject = 'Programming'; // Valor inicial del dropdown
  List<String> subjects = ['Programming', 'Digital Marketing', 'English'];
  List<String> schedules = [
    'Monday 1 Nov: 4-5pm CO Time',
    'Friday 4 Nov: 4-5pm CO Time',
    'Wednesday 8 Nov: 4-5pm CO Time'
  ];
  String selectedSchedule =
      "Monday 1 Nov: 4-5pm CO Time"; // Valor inicial del dropdown

  void _bookSession() {
    // Lógica para reservar sesión
    print("Session booked!");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentProcessingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              // Lógica para agregar a favoritos
              print("Added to favorites!");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/imgs/detail_img.png', // Specify the path here
                      width: MediaQuery.of(context).size.width,
                      height: 300, // Optional: Set height
                      fit:
                          BoxFit.fitWidth, // Optional: Adjust the image fitting
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      "John Smith",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Center(
                    child: Text(
                      "20 USD/ per session",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          5, (index) => Icon(Icons.star, color: Colors.amber)),
                    ),
                  ),
                  Center(
                    child: Text("15 reviews",
                        style: TextStyle(color: Colors.grey)),
                  ),
                  const SizedBox(height: 20),
                  Text("About",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(
                    "Experienced programmer with a background in digital marketing and fluent in English. Skilled in developing digital solutions and optimizing campaigns to drive engagement and growth.",
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    children: subjects.map((subject) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Chip(
                          label: Text(subject),
                          backgroundColor: Colors.purpleAccent,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  Text("Subject",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  DropdownButton<String>(
                    value: selectedSubject,
                    items: subjects.map((subject) {
                      return DropdownMenuItem<String>(
                        value: subject,
                        child: Text(subject),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedSubject = newValue!;
                      });
                    },
                    isExpanded: true,
                  ),
                  const SizedBox(height: 20),
                  Text("Availability",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  DropdownButton<String>(
                    value: selectedSchedule,
                    items: schedules.map((schedule) {
                      return DropdownMenuItem<String>(
                        value: schedule,
                        child: Text(schedule),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedSchedule = newValue!;
                      });
                    },
                    isExpanded: true,
                  ),
                  Spacer(),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _bookSession,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF546A83),
                        foregroundColor: Colors.white, // Color del texto
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text("Book and pay session"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
