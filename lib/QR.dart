import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:registration_page/scanner.dart';
class QR extends StatefulWidget {
  const QR({Key? key}) : super(key: key);

  @override
  State<QR> createState() => _QRState();
}

class _QRState extends State<QR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.account_circle_rounded,
                color: Colors.white,
                size: 130,
              ),
            ),
        QrImageView(
          data: '1234567890',
          version: QrVersions.auto,
          size: 200.0,
        ),

            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Scan(),));},
              child: Text(
                'Scan me',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[700],
                side: const BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
