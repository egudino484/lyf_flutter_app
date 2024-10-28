import 'package:http/http.dart';
import 'package:lyf_flutter_app/utils.dart';
import 'package:web3dart/web3dart.dart';
import 'package:flutter/services.dart' show rootBundle;

class DecentralisedIDService {
  late Web3Client _client;
  final String _rpcUrl =
      "https://sepolia.infura.io/v3/e509ec83d39e46d5a2e11d25427b19e4"; // Cambia esto a tu nodo de Ethereum
  final String _contractAddress =
      "0x5fb5e8710d60bdb37a5b8b75e4cd9e3948462165"; // Reemplaza con la dirección del contrato

  DecentralisedIDService() {
    _client = Web3Client(_rpcUrl, Client());
  }

  Future<void> getDID(String userAddress) async {
    try {
      // Cargar el ABI desde los assets
      print("Cargando ABI desde assets/descentralized_id_abi.json");
      String abi =
          await rootBundle.loadString("assets/descentralized_id_abi.json");
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
      final membership = responseDID[8];

      print("Datos del DID:");
      print("ID: $id");
      print("Username: $userName");
      print("First Name: $firstName");
      print("Last Name: $lastName");
      print("Date of Birth: $dob");
      print("Document Number: $documentNumber");
      print("Nationality: $nationality");
      print("Membership Stage: $membershipStage");
      print("Membership : $membership");
    } catch (e) {
      print("Error al obtener el DID: $e");
    }
  }

  Future<void> createDID({
    required String userName,
    required String firstName,
    required String lastName,
    required String dob,
    required String documentNumber,
    required String nationality,
    required String
        privateKey, // Necesitarás la clave privada para firmar la transacción
  }) async {
    try {
      // Cargar el ABI
      String abi =
          await rootBundle.loadString("assets/descentralized_id_abi.json");
      final contract = DeployedContract(
        ContractAbi.fromJson(abi, "DecentralisedID"),
        EthereumAddress.fromHex(_contractAddress),
      );

      // Selecciona la función `createDID`
      final createDIDFunction = contract.function("createDID");

      // Crear una cuenta a partir de la clave privada
      final credentials = await _client.credentialsFromPrivateKey(privateKey);

      // Llamada a la función
      print("Llamando a la función createDID...");
      await _client.sendTransaction(
        credentials,
        Transaction.callContract(
          contract: contract,
          function: createDIDFunction,
          parameters: [
            userName,
            firstName,
            lastName,
            dob,
            documentNumber,
            nationality
          ],
        ),
      );

      print("DID creado exitosamente.");
    } catch (e) {
      print("Error al crear el DID: $e");
    }
  }

  Future<void> buyMembership({
    required String membershipType,
    required double amountEtherMembership,
    required String
        privateKey, // Necesitarás la clave privada para firmar la transacción,
  }) async {
    try {
      // Cargar el ABI
      String abi =
          await rootBundle.loadString("assets/descentralized_id_abi.json");
      final contract = DeployedContract(
        ContractAbi.fromJson(abi, "DecentralisedID"),
        EthereumAddress.fromHex(_contractAddress),
      );

      // Selecciona la función `buyMembership`
      final buyMembershipFunction = contract.function("buyMemebership");

      // Crear una cuenta a partir de la clave privada
      final credentials = EthPrivateKey.fromHex(privateKey);

      // Convertir el tipo de membresía a la representación del contrato
      MembershipType newMembership;

 
      final BigInt paymentAmount = BigInt.from(1000); // 10,000 Gwei en Wei

      var membershipCode = 0;
      if (membershipType == MembershipType.Gold.toString()) {
        membershipCode = 0;
      } else if (membershipType == MembershipType.Silver.toString()) {
        membershipCode = 1;
      }

           // Llamada a la función
      print("Llamando a la función buyMembership... code: $membershipCode");


      await _client.sendTransaction(
        credentials,
        Transaction.callContract(
          contract: contract,
          function: buyMembershipFunction,
          parameters: [BigInt.from(membershipCode)],
          value: EtherAmount.fromInt(
              EtherUnit.gwei, 10000), // Ejemplo: 10,000 Gwei
        ),
        chainId: 11155111, // Asegúrate de poner el chainId correcto
      );

      print("Membresía comprada exitosamente.");
    } catch (e) {
      print("Error al comprar la membresía: $e");
    }
  }
}
