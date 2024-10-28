import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  final List<Map<String, String>> skills = [
    {'skill': 'Programming: Java', 'price': '20 usd'},
    {'skill': 'Web Development: HTML/CSS', 'price': '25 usd'},
    {'skill': 'Mobile Development: Flutter', 'price': '30 usd'},
    {'skill': 'Data Analysis: Python', 'price': '40 usd'},
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFF5),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/imgs/detail_img.png'),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Jhon Doe',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Team Lead @ Meta',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.flag, size: 16, color: Colors.black),
                      SizedBox(width: 4),
                      Text('English, Spanish'),
                      SizedBox(width: 8),
                      Icon(Icons.qr_code, size: 16),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            SizedBox(height: 16),
            _buildInfoRow('Document Type', 'Passport'),
            _buildInfoRow('Doc. Number', 'A762222'),
            _buildInfoRow('Country', 'United States'),
            _buildInfoRow('Birth Date', '1/10/1995'),
            _buildInfoRow('Membership', 'Golden', trailingIcon: Icons.info),
            SizedBox(height: 16),

            Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      'Skills',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    Icon(
      Icons.edit, // Cambia el ícono según lo que necesites
      color: Colors.grey,
    ),
  ],
),
            Text(
              'I am a skilled and professional teacher with over 10 years of teaching students and preparing them to ace their final secondary school examination.',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          Expanded(
              child: ListView.builder(
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 14,
                            child: Text(skills[index]['skill']![0]),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '${skills[index]['skill']}  ${skills[index]['price']}',
                              style: TextStyle(fontSize: 14, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
           Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      'Payment Methods',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    Icon(
      Icons.edit, // Cambia el ícono según lo que necesites
      color: Colors.grey,
    ),
  ],
),
            Text(
              'Eth Account: 0x4222d04fb9Cd0A0d48FC1A5A89cbe5e118c2A3f3',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            Text(
              'Balance: 800 USD',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, {IconData? trailingIcon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$title  ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ),
          if (trailingIcon != null)
            Icon(trailingIcon, size: 16, color: Colors.grey[600]),
        ],
      ),
    );
  }
}
