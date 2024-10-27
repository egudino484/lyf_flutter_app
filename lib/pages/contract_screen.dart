import 'package:flutter/material.dart';
import 'package:lyf_flutter_app/desc_service.dart';

class ContractPage extends StatefulWidget {
  const ContractPage({super.key});

  @override
  _ContractPageState createState() => _ContractPageState();
}

class _ContractPageState extends State<ContractPage> {
  final DecentralisedIDService _decentralisedIDService = DecentralisedIDService();

  Future<void> _fetchDID() async {
    String userAddress = "0x4222d04fb9Cd0A0d48FC1A5A89cbe5e118c2A3f3"; // Reemplaza con la dirección del usuario en hexadecimal
    await _decentralisedIDService.getDID(userAddress);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Decentralised ID"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _fetchDID,
          child: const Text("Fetch DID"),
        ),
      ),
    );
  }
}
