import 'package:flutter/material.dart';
import 'package:qr_scanner/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';
  nuevoScan(String valor) async {
    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBprovider.db.nuevoScan(nuevoScan);
    //asignar el id de la base de datos del modelo
    nuevoScan.id = id;
    if (this.tipoSeleccionado == nuevoScan.tipo) {
      this.scans.add(nuevoScan);
      notifyListeners();
    }
  }
  cargarScans() async {
    final scans= await DBprovider.db.getTodosScan();
    this.scans=[...scans];
    notifyListeners();
  }
  cargarScansportipo(String tipo){
  
  }
  borrarTodos(){

  }
}
