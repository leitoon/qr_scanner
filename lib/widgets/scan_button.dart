import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#3D8BEF', 'CANCELAR', false, ScanMode.QR);
          print(barcodeScanRes);
        },
        child: Icon(
          Icons.filter_center_focus,
          color: Colors.white,
        ));
  }
}
