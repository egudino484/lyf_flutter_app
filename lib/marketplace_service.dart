import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:flutter/services.dart' show rootBundle;

class MarketplaceService {
  late Web3Client _client;
  final String _rpcUrl = "https://sepolia.infura.io/v3/e509ec83d39e46d5a2e11d25427b19e4"; // Cambia esto a tu nodo de Ethereum
  final String _contractAddress = "0xe25573c547fff805bb942bff8eb59e6fa2f52388"; // Reemplaza con la dirección del contrato

  MarketplaceService() {
    _client = Web3Client(_rpcUrl, Client());
  }

  Future<void> createConsultant(String fullName, String description, int monthlyRate, String privateKey) async {
    try {
      String abi = await rootBundle.loadString("assets/marketplace_id_abi.json");
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


  Future<void> payConsultant(int consultantId, int gweiPaymentAmount, String privateKey) async {
    try {
      String abi = await rootBundle.loadString("assets/marketplace_id_abi.json");
      final contract = DeployedContract(
        ContractAbi.fromJson(abi, "Marketplace"),
        EthereumAddress.fromHex(_contractAddress),
      );

      final payFunction = contract.function("payConsultant");

      // Crea las credenciales del usuario
      final credentials = EthPrivateKey.fromHex(privateKey);
  final gweiAmountBigInt = BigInt.from(1200);

      final response =await _client.sendTransaction(
        credentials,
        Transaction.callContract(
          contract: contract,
          function: payFunction,
          parameters: [BigInt.from(2)],
        value: EtherAmount.fromInt(
              EtherUnit.gwei, 400000)
 // Ejemplo: 1200 Gwei
        ),
        chainId: 11155111, // correct chainid
      );


      print("Consultant paid: $response");
    } catch (e) {
      print("Error paying consultant: $e");
    }
  }


}
