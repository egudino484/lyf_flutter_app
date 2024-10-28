import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:flutter/services.dart' show rootBundle;

class MarketplaceService {
  late Web3Client _client;
  final String _rpcUrl = "https://sepolia.infura.io/v3/e509ec83d39e46d5a2e11d25427b19e4"; // Cambia esto a tu nodo de Ethereum
  final String _contractAddress = "0x71E5Fc6EFb382712EbEc61cb75959CFa229468Fe"; // Reemplaza con la dirección del contrato

  MarketplaceService() {
    _client = Web3Client(_rpcUrl, Client());
  }

  Future<void> createConsultant(String fullName, String description, int monthlyRate, String privateKey) async {
    try {
      String abi = await rootBundle.loadString("assets/marketplace_abi.json");
      final contract = DeployedContract(
        ContractAbi.fromJson(abi, "Marketplace"),
        EthereumAddress.fromHex(_contractAddress),
      );

      final createConsultantFunction = contract.function("createConsultant");

      // Crea las credenciales del usuario
      final credentials = EthPrivateKey.fromHex(privateKey);
      
      final response = await _client.sendTransaction(
        credentials,
        Transaction.callContract(
          contract: contract,
          function: createConsultantFunction,
          parameters: [fullName, description, monthlyRate],
        ),
      );

      print("Consultant created: $response");
    } catch (e) {
      print("Error al crear el consultor: $e");
    }
  }

  Future<void> getConsultant(String userAddress) async {
    try {
      String abi = await rootBundle.loadString("assets/marketplace_abi.json");
      final contract = DeployedContract(
        ContractAbi.fromJson(abi, "Marketplace"),
        EthereumAddress.fromHex(_contractAddress),
      );

      final getConsultantFunction = contract.function("getConsultant");

      final response = await _client.call(
        contract: contract,
        function: getConsultantFunction,
        params: [EthereumAddress.fromHex(userAddress)],
      );

      final consultant = response[0];
      print("Consultant details:");
      print("ID: ${consultant.id}");
      print("Full Name: ${consultant.full_name}");
      print("Description: ${consultant.description}");
      print("User Address: ${consultant.user_addy}");
      print("Monthly Rate: ${consultant.monthly_rate}");
      print("Available: ${consultant.available}");
    } catch (e) {
      print("Error al obtener el consultor: $e");
    }
  }

  Future<void> toggleAvailability(String privateKey) async {
    try {
      String abi = await rootBundle.loadString("assets/marketplace_abi.json");
      final contract = DeployedContract(
        ContractAbi.fromJson(abi, "Marketplace"),
        EthereumAddress.fromHex(_contractAddress),
      );

      final toggleFunction = contract.function("toggleAviability");

      // Crea las credenciales del usuario
      final credentials = EthPrivateKey.fromHex(privateKey);

      final response = await _client.sendTransaction(
        credentials,
        Transaction.callContract(
          contract: contract,
          function: toggleFunction,
          parameters: [],
        ),
      );

      print("Availability toggled: $response");
    } catch (e) {
      print("Error al cambiar disponibilidad: $e");
    }
  }

  Future<void> payConsultant(int consultantId, double paymentAmount, String privateKey) async {
    try {
      String abi = await rootBundle.loadString("assets/marketplace_abi.json");
      final contract = DeployedContract(
        ContractAbi.fromJson(abi, "Marketplace"),
        EthereumAddress.fromHex(_contractAddress),
      );

      final payFunction = contract.function("payConsultant");

      // Crea las credenciales del usuario
      final credentials = EthPrivateKey.fromHex(privateKey);

      final response = await _client.sendTransaction(
        credentials,
        Transaction.callContract(
          contract: contract,
          function: payFunction,
          parameters: [consultantId],
          value: EtherAmount.fromUnitAndValue(EtherUnit.ether, paymentAmount),
        ),
      );
      

      print("Consultant paid: $response");
    } catch (e) {
      print("Error al pagar al consultor: $e");
    }
  }
}
