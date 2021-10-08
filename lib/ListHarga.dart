import 'package:meta/meta.dart';
import 'dart:convert';

ListHarga listHargaFromJson(String str) => ListHarga.fromJson(json.decode(str));

String listHargaToJson(ListHarga data) => json.encode(data.toJson());

class ListHarga {
  ListHarga({
     this.status,
     this.pesan,
     this.data,
  });

  String? status;
  String? pesan;
  List<Datum>? data;

  ListHarga copyWith({
     String? status,
     String? pesan,
     List<Datum>? data,
  }) =>
      ListHarga(
        status: this.status,
        pesan:  this.pesan,
        data:  this.data,
      );

  factory ListHarga.fromJson(Map<String, dynamic> json) => ListHarga(
    status: json["status"],
    pesan: json["pesan"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "pesan": pesan,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
     this.kodeKelompok,
     this.namaKelompok,
     this.position,
     this.jenisKelompok,
  });

  String? kodeKelompok;
  String? namaKelompok;
  int? position;
  List<JenisKelompok>? jenisKelompok;

  Datum copyWith({
     String? kodeKelompok,
     String? namaKelompok,
     int? position,
     List<JenisKelompok>? jenisKelompok,
  }) =>
      Datum(
        kodeKelompok:  this.kodeKelompok,
        namaKelompok:  this.namaKelompok,
        position:  this.position,
        jenisKelompok: this.jenisKelompok,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    kodeKelompok: json["kode_kelompok"],
    namaKelompok: json["nama_kelompok"],
    position: json["position"],
    jenisKelompok: List<JenisKelompok>.from(json["jenis_kelompok"].map((x) => JenisKelompok.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "kode_kelompok": kodeKelompok,
    "nama_kelompok": namaKelompok,
    "position": position,
    "jenis_kelompok": List<dynamic>.from(jenisKelompok!.map((x) => x.toJson())),
  };
}

class JenisKelompok {
  JenisKelompok({
     this.kodeJenis,
     this.namaJenis,
     this.harga,
      this.edit_date
  });

  String? kodeJenis;
  String? namaJenis;
  int? harga;
  DateTime? edit_date;

  JenisKelompok copyWith({
     String? kodeJenis,
     String? namaJenis,
     int? harga,
    DateTime? edit_date
  }) =>
      JenisKelompok(
        kodeJenis: this.kodeJenis,
        namaJenis:  this.namaJenis,
        harga: this.harga,
        edit_date: this.edit_date
      );

  factory JenisKelompok.fromJson(Map<String, dynamic> json) => JenisKelompok(
    kodeJenis: json["kode_jenis"],
    namaJenis: json["nama_jenis"],
    harga: json["harga"],
    edit_date: DateTime.parse(json['edit_date'])
  );

  Map<String, dynamic> toJson() => {
    "kode_jenis": kodeJenis,
    "nama_jenis": namaJenis,
    "harga": harga,
    "edit_date": edit_date
  };
}