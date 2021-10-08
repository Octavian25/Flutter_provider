import 'package:flutter/material.dart';
import 'package:hidup_banjaran/ListHarga.dart';
import 'package:hidup_banjaran/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListHargaProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<JenisKelompok> jenisKelompok = [
    JenisKelompok(namaJenis: "PERHIASAN 1", kodeJenis: "KD-1", harga: 10000, edit_date: DateTime.parse("2021-09-21T07:47:54.000Z"))
  ];
  @override
  void initState() {

    getInit();
    super.initState();

  }

  getInit() async {
    await Provider.of<ListHargaProvider>(context, listen: false).getListHarga();
    ListHargaProvider projectProvider = Provider.of<ListHargaProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    ListHargaProvider projectProvider = Provider.of<ListHargaProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: projectProvider.listHarga!.data!.map((e) => Container(
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            jenisKelompok = e.jenisKelompok!;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey
                          ),
                          child: Text(e.namaKelompok!),
                        ),
                      ),
                    ),
                  )).toList(),
                ),
              ),
              SizedBox(
                height: 530,
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text("Jenis"),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text("Harga"),
                          ),
                          Expanded(
                              flex: 3,
                              child: Text("Waktu"))
                        ],
                      ),
                    ),
                    Container(
                      height: 500,
                      child: ListView(
                        children: jenisKelompok.map((e) =>
                            Container(
                          color: Colors.grey.withOpacity(0.2),
                          height: 50,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 48,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Text(e.namaJenis ?? "-", maxLines: 2, overflow: TextOverflow.ellipsis,),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(e.harga != null ? e.harga!.toString() : "0", maxLines: 2, overflow: TextOverflow.ellipsis,),
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: Text(FormatterWaktu(e.edit_date) != null ? FormatterWaktu(e.edit_date) : "-", maxLines: 2, overflow: TextOverflow.ellipsis,)
                                    )
                                  ],
                                ),
                              ),
                              const Divider(
                                height: 2,
                                thickness: 2,
                              ),
                            ],
                          ),
                        )).toList(),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

String FormatterWaktu(DateTime? waktu){
  String? bulan = "kosong";
  switch(waktu!.month){
    case 01:
      bulan =  "JANUARI";
      break;
    case 02 :
      bulan = "FEBRUARI";
      break;
    case 03:
      bulan = "MARET";
      break;
    case 04:
      bulan = "APRIL";
      break;
    case 05:
      bulan = "MEI";
      break;
    case 06:
      bulan = "JUNI";
      break;
    case 07:
      bulan = "JULI";
      break;
    case 08:
      bulan = "AGUSTUS";
      break;
    case 09:
      bulan = "SEPTEMBER";
      break;
    case 10:
      bulan = "OKTOBER";
      break;
    case 11:
      bulan = "NOVEMBER";
      break;
    case 12:
      bulan = "DESEMBER";
      break;
  }
  return '${waktu.day} $bulan ${waktu.year}, ${waktu.hour}:${waktu.minute}';
}
