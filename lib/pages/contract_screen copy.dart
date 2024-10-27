import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';

class MyContractPage extends StatefulWidget {
  const MyContractPage({super.key});

  @override
  _MyContractPageState createState() => _MyContractPageState();
}

class _MyContractPageState extends State<MyContractPage> {
  late Web3Client _client;
  final String _rpcUrl = "https://avalanche-fuji.infura.io/v3/e509ec83d39e46d5a2e11d25427b19e4"; // Cambia esto a tu nodo de Ethereum
  final String _decentralisedIDAddress = "0x81d630d449f89a4a54c9e3ea8f70365a9c817c69"; // Dirección del contrato DecentralisedID
  final String _marketplaceAddress = "0x08c6daa7f1ba13e5161e3c9c2a5237d994ff239d"; // Dirección del contrato Marketplace
  final String _privateKey = "cd0992fd5580d0df845ab28f8f46af0c61516df0338bdbe89614460ef1aa695e"; // Tu clave privada

  @override
  void initState() {
    super.initState();
    _client = Web3Client(_rpcUrl, http.Client());
  }

  Future<void> createDID(String username, String firstName, String lastName, String dob, String documentNumber, String nationality) async {
    // ABI del contrato DecentralisedID
    String abi = await rootBundle.loadString("assets/descentralized_id_abi.json");
    
    final contract = DeployedContract(
      ContractAbi.fromJson(abi, "DecentralisedID"),
      EthereumAddress.fromHex(_decentralisedIDAddress),
    );

    final credentials = EthPrivateKey.fromHex(_privateKey);


    final createDIDFunction = contract.function("createDID");
    final result = await _client.sendTransaction(
      // Asegúrate de reemplazar esto con la billetera de tu usuario
      // y configurar correctamente las credenciales (clave privada o proveedor)
      credentials,
      Transaction.callContract(
        contract: contract,
        function: createDIDFunction,
        parameters: [
          username,
          firstName,
          lastName,
          dob,
          documentNumber,
          nationality
        ],
      ),
    );

    print("Transaction hash: $result");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Decentralized ID App")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Aquí puedes llamar a createDID con los parámetros adecuados
            createDID("user123", "John", "Doe", "1990-01-01", "DOC12345", "Nationality");
          },
          child: const Text("Create DID"),
        ),
      ),
    );
  }
}