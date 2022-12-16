import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/direcciones.dart';
import 'package:qr_scanner/pages/maps_pages.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';
import 'package:qr_scanner/widgets/custom_navigationbar.dart';
import 'package:qr_scanner/widgets/scan_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.delete_forever_outlined))
        ],
      ),
      body: _HomeBody(),
      bottomNavigationBar: CustonNavegationbar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectMenuOpstion;
    //final timeTem = new ScanModel(valor: 'htto://google.com');
    //DBprovider.db.deleteAllScan().then(print);

    switch (currentIndex) {
      case 0:
        return MapsScreen();
      case 1:
        return DireccionesScreen();
      default:
        return MapsScreen();
    }
  }
}
