import 'package:flutter/cupertino.dart';
import 'package:hidup_banjaran/ListHarga.dart';
import 'package:hidup_banjaran/service.dart';

class ListHargaProvider with ChangeNotifier {
  ListHarga? _listHarga;

  ListHarga? get listHarga  => _listHarga;

  set listHarga(ListHarga? listHarga){
    _listHarga = listHarga;
    notifyListeners();
  }

  Future<void> getListHarga() async {
    try {
      ListHarga project = await Service().getListHarga();
      _listHarga = project;
    } catch (e) {
      print(e);
    }
  }
}