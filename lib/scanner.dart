import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:registration_page/profile.dart';

class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      body: Center(
        child: Column(
          children: [
            MobileScanner(
              // fit: BoxFit.contain,
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                for (final barcode in barcodes) {
                  debugPrint('Barcode found! ${barcode.rawValue}');
                }
              },
            ),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(),));},
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.teal[700],
                      side: const BorderSide(
                        color: Colors.white,
                      ),),
                child: Text('Profile',
                    style: TextStyle(fontSize: 20, color: Colors.white))),
          ],
        ),
      ),
    );
  }
}
