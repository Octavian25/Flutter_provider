
import 'package:dio/dio.dart';
import 'package:hidup_banjaran/ListHarga.dart';

class Service{
  Future<ListHarga> getListHarga() async{
    var url = "https://mocki.io/v1/be917add-3f86-41c6-8cc2-a095205f8ea1";
    var response = await Dio().get(url);
    if(response.statusCode == 200){
      var data = response.data;
      ListHarga listHarga = ListHarga.fromJson(data);
      return listHarga;
    } else {
      throw Exception('Gagal Login');
    }
  }
}