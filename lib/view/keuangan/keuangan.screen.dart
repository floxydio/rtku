import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtku/constant/rupiah.constant.dart';
import 'package:rtku/controller/keuangan.controller.dart';

class KeuanganPage extends StatefulWidget {
  const KeuanganPage({Key? key}) : super(key: key);

  @override
  State<KeuanganPage> createState() => _KeuanganPageState();
}

class _KeuanganPageState extends State<KeuanganPage> {
  final namaController = TextEditingController();
  final tanggalController = TextEditingController();
  final categoryController = TextEditingController();
  final jumlahController = TextEditingController();
  final controllerKeuangan = Get.put(KeuanganController());

  CollectionReference keuangan =
      FirebaseFirestore.instance.collection("keuangan");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Keuangan")),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 20,
              ),
              const Center(child: Text("Data Keuangan",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold) ,)),
              const SizedBox(height: 40,),
              Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        Get.dialog(AlertDialog(
                            content: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Nama",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: namaController,
                                  decoration: const InputDecoration(
                                      hintText: "Nama...",
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Tanggal",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: tanggalController,
                                  decoration: const InputDecoration(
                                      hintText: "Tanggal...",
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Kategori",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: categoryController,
                                  decoration: const InputDecoration(
                                      hintText: "Kategori...",
                                      helperText:
                                          "Contoh: Sumbangan Kebersihan",
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Jumlah",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: jumlahController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      hintText: "Jumlah yang diberikan...",
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  width: Get.width,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        keuangan.add({
                                          "name": namaController.text,
                                          "date": tanggalController.text,
                                          "category": categoryController.text,
                                          "price": jumlahController.text,
                                        }).then((value) => {
                                              Navigator.pop(context),

                                              controllerKeuangan
                                                  .getKeuanganCollection()
                                            });
                                      },
                                      child: const Text("Submit")),
                                ),
                              ]),
                        )));
                      },
                      icon: Icon(Icons.add),
                      label: const Text("Tambah Data"))),
                     const SizedBox(height: 30,),
              GetX<KeuanganController>(
                builder: ((controller) {
                  return DataTable(
                    border: TableBorder.all(),
                     columnSpacing: 15.0,
                      columns: const [
                        DataColumn(label: Text("Nama")),
                        DataColumn(label: Text("Jumlah\nRupiah")),
                        DataColumn(label: Text("Kategori")),
                        DataColumn(label: Text("Tanggal")),
                      ],
                      rows: controllerKeuangan.dataKeuangan.map((element) {
                        return DataRow(
                          cells: [
                            DataCell(Text(element['name'])),
                            DataCell(Text(RupiahConverter.rupiah(value: int.parse(element["price"]), withRp: true))),
                            DataCell(Text(element['category'].toString())),
                            DataCell(Text(element['date'].toString())),
                          ],
                        );
                      }).toList());
                }),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
