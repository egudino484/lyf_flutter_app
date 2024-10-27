import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:flutter/services.dart' show rootBundle;

class DecentralisedIDService {
  late Web3Client _client;
    final String _rpcUrl = "https://sepolia.infura.io/v3/e509ec83d39e46d5a2e11d25427b19e4"; // Cambia esto a tu nodo de Ethereum
  final String _contractAddress = "0x54fA52d26675A7464e3e5D1d10125700cd374984"; // Reemplaza con la dirección del contrato
  
    //final String _rpcUrl = "https://avalanche-fuji.infura.io/v3/e509ec83d39e46d5a2e11d25427b19e4"; // Cambia esto a tu nodo de Ethereum
 // final String _decentralisedIDAddress = "0x81d630d449f89a4a54c9e3ea8f70365a9c817c69"; // Dirección del contrato DecentralisedID
  //final String _marketplaceAddress = "0x08c6daa7f1ba13e5161e3c9c2a5237d994ff239d"; // Dirección del contrato Marketplace
  //final String _privateKey = "cd0992fd5580d0df845ab28f8f46af0c61516df0338bdbe89614460ef1aa695e"; // Tu clave privada



  DecentralisedIDService() {
    _client = Web3Client(_rpcUrl, Client());
  }

  Future<void> getDID(String userAddress) async {
    try {
      // Cargar el ABI desde los assets
      print("Cargando ABI desde assets/descentralized_id_abi.json");
      String abi = await rootBundle.loadString("assets/descentralized_id_abi.json");
      print("ABI cargado exitosamente.");

      // Crear la instancia del contrato
      final contract = DeployedContract(
        ContractAbi.fromJson(abi, "DecentralisedID"),
        EthereumAddress.fromHex(_contractAddress),
      );

      // Selecciona la función `getDID`
      final getDIDFunction = contract.function("getDID");

      // Llamada de lectura al contrato
      print("Llamando a la función getDID con la dirección: $userAddress");
      final response = await _client.call(
        contract: contract,
        function: getDIDFunction,
        params: [EthereumAddress.fromHex(userAddress)],
      );

      // Procesar la respuesta
      final responseDID = response[0];
      final id = responseDID[0];
      final userName = responseDID[1];
      final firstName = responseDID[2];
      final lastName = responseDID[3];
      final dob = responseDID[4];
      final documentNumber = responseDID[5];
      final nationality = responseDID[6];
      final membershipStage = responseDID[7];

      print("Datos del DID:");
      print("ID: $id");
      print("Username: $userName");
      print("First Name: $firstName");
      print("Last Name: $lastName");
      print("Date of Birth: $dob");
      print("Document Number: $documentNumber");
      print("Nationality: $nationality");
      print("Membership Stage: $membershipStage");
      
    } catch (e) {
      print("Error al obtener el DID: $e");
    }
  }
}

//
