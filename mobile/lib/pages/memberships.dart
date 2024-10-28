import 'package:flutter/material.dart';

class SessionBookingScreen extends StatefulWidget {
  @override
  _SessionBookingScreenState createState() => _SessionBookingScreenState();
}

class _SessionBookingScreenState extends State<SessionBookingScreen> {
  List<String> subjects = ['Math', 'Science', 'History'];
  List<String> schedules = [
    'Monday 1 Nov: 4-5pm CO Time',
    'Friday 4 Nov: 4-5pm CO Time',
    'Wednesday 8 Nov: 4-5pm CO Time'
  ];

  String selectedSubject = '';
  String selectedSchedule = '';

  @override
  void initState() {
    super.initState();
    selectedSubject = subjects.first; // Selecciona el primer elemento de la lista como predeterminado
    selectedSchedule = schedules.first;
  }

  void _bookSession() {
    // Lógica para la acción del botón
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book a Session"),
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
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage("https://via.placeholder.com/150"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      "Omowumi John",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                      children: List.generate(5, (index) => Icon(Icons.star, color: Colors.amber)),
                    ),
                  ),
                  Center(
                    child: Text("15 reviews", style: TextStyle(color: Colors.grey)),
                  ),
                  const SizedBox(height: 20),
                  Text("About",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(
                    "Experienced programmer with...",
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
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
