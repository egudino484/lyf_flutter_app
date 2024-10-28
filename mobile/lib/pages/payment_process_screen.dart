import 'package:flutter/material.dart';

import '../marketplace_service.dart';

class PaymentProcessingScreen extends StatefulWidget {
  @override
  _PaymentProcessingScreenState createState() => _PaymentProcessingScreenState();
}

class _PaymentProcessingScreenState extends State<PaymentProcessingScreen> {
  bool paymentApproved = false;


 Future<void> _payConsultant() async {
    String privateKey =
        "fda6a6248f0f8e35bb7aed1691dbf3ded825c8b3518f0a794ea3d5c92c1f6c61";
    final consultantId = 2;//szymon
    final int gweiPaymentAmount = 1200;//10 usd

  final MarketplaceService _marketplaceService =
      MarketplaceService();

    await _marketplaceService.payConsultant(
      consultantId,
     gweiPaymentAmount,
     privateKey,
    );

  }

  @override
  void initState() {
    super.initState();
    _simulatePaymentProcess();
    _payConsultant();
  }

  // Simula el procesamiento de pago con un retraso de 3 segundos
  void _simulatePaymentProcess() async {
    // process blockchain transfer funds to user , and lyf properties


    await Future.delayed(Duration(seconds: 3));
    setState(() {
      paymentApproved = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: paymentApproved
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 80),
                  SizedBox(height: 16),
                  Text(
                    'Approved Payment',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text(
                    'Processing Payment...',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
      ),
    );
  }
}
