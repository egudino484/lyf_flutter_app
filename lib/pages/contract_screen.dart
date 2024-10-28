import 'package:flutter/material.dart';
import 'package:lyf_flutter_app/desc_service.dart';
import 'package:lyf_flutter_app/utils.dart';

class ContractPage extends StatefulWidget {
  const ContractPage({super.key});

  @override
  _ContractPageState createState() => _ContractPageState();
}

class _ContractPageState extends State<ContractPage> {
  final DecentralisedIDService _decentralisedIDService =
      DecentralisedIDService();

  Future<void> _fetchDID() async {
    String userAddress =
        "0x4222d04fb9Cd0A0d48FC1A5A89cbe5e118c2A3f3"; // Reemplaza con la dirección del usuario en hexadecimal
    await _decentralisedIDService.getDID(userAddress);
  }

  Future<void> _createDID() async {
    String privateKey =
        "fda6a6248f0f8e35bb7aed1691dbf3ded825c8b3518f0a794ea3d5c92c1f6c61"; // Reemplaza con la dirección del usuario en hexadecimal
    await _decentralisedIDService.createDID(
        userName: "userName",
        firstName: "firstName",
        lastName: "lastName",
        dob: "dob",
        documentNumber: "documentNumber",
        nationality: "nationality",
        privateKey: "privateKey");
  }

  Future<void> _buyMembership() async {
    String privateKey =
        "fda6a6248f0f8e35bb7aed1691dbf3ded825c8b3518f0a794ea3d5c92c1f6c61";
    final priceEth = convertUsdToEther(1);

    String membershipType = MembershipType.Gold.toString(); // O GOLD , 1 "Silver", 2"Bronze", etc.

    await _decentralisedIDService.buyMembership(
      membershipType: membershipType,
      amountEtherMembership: priceEth,
      privateKey: privateKey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Decentralised ID"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centra los botones en el eje vertical
          children: [
            ElevatedButton(
              onPressed: _fetchDID,
              child: const Text("Fetch DID"),
            ),
            const SizedBox(height: 20), // Espacio entre los botones
            ElevatedButton(
              onPressed: _createDID,
              child: const Text("Create DID"),
            ),
            const SizedBox(height: 20), // Espacio entre los botones
            ElevatedButton(
              onPressed: _buyMembership,
              child: const Text("Buy Membership"),
            ),
            // Agrega más botones según sea necesario
          ],
        ),
      ),
    );
  }
}
