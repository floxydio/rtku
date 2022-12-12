import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtku/controller/data_penduduk.controller.dart';


class DataPendudukPage extends StatefulWidget {
  const DataPendudukPage({super.key});

  @override
  State<DataPendudukPage> createState() => _DataPendudukPageState();
}

class _DataPendudukPageState extends State<DataPendudukPage> {
  final namaKepalaKeluarga = TextEditingController();
  final alamatKeluarga = TextEditingController();
  final jumlahKeluarga = TextEditingController();
  final jumlahLakiLaki = TextEditingController();
  final jumlahPerempuan = TextEditingController();

  CollectionReference event = FirebaseFirestore.instance.collection("data_penduduk");
  final controllerPenduduk = Get.put(DataPendudukController());

  @override
  void dispose() {
    super.dispose();
    namaKepalaKeluarga.dispose();
    alamatKeluarga.dispose();
    jumlahKeluarga.dispose();
    jumlahLakiLaki.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: SafeArea(child: Padding(
        padding: const EdgeInsets.only(left:20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        const SizedBox(height: 20,),
          const Text("Data Penduduk", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          const SizedBox(height: 30,),
          Align(alignment: Alignment.topRight,child: ElevatedButton(onPressed: () {
            Get.dialog(AlertDialog(
              content: SingleChildScrollView(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                  const   Text("Form Pengisian Data", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Align(alignment: Alignment.topRight, child: InkWell(onTap: () {
                            Get.back();
                          }, child: const Icon(Icons.close))),

                    ],),
                    const SizedBox(
                                  height: 40,
                                ),
                                const Text("Nama Kepala Keluarga",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                const SizedBox(
                                  height: 10,
                                ),
                  TextFormField(
                                  controller: namaKepalaKeluarga,
                                  decoration: const InputDecoration(
                                      hintText: "Nama Kepala Keluarga...",
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(height: 20,),
                                   const Text("Alamat Keluarga",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                const SizedBox(
                                  height: 10,
                                ),
                  TextFormField(
                                  controller: alamatKeluarga,
                                  decoration: const InputDecoration(
                                      hintText: "Alamat Keluarga...",
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(height: 20,),
                                   const Text("Jumlah Laki-Laki",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                const SizedBox(
                                  height: 10,
                                ),
                  TextFormField(

                    keyboardType: TextInputType.number,
                                  controller: jumlahLakiLaki,
                                  decoration: const InputDecoration(
                                      hintText: "Jumlah Laki-Laki...",
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(height: 20,),
                                   const Text("Jumlah Perempuan",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                const SizedBox(
                                  height: 10,
                                ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                                  controller: jumlahPerempuan,
                                  decoration: const InputDecoration(
                                      hintText: "Jumlah Perempuan...",
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(height: 20,),
                                   const Text("Total Keluarga",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                const SizedBox(
                                  height: 10,
                                ),
                  TextFormField(

                    keyboardType: TextInputType.number,
                                  controller: jumlahKeluarga,
                                  decoration: const InputDecoration(
                                      hintText: "Jumlah Keluarga...",
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(height: 20,),
                                   SizedBox(
                                  width: Get.width,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        event.add({
                                          "nama_kepalakk": namaKepalaKeluarga.text,
                                          "jml_laki": jumlahLakiLaki.text.isEmpty ? "0" : jumlahLakiLaki.text,
                                          "jml_perempuan": jumlahPerempuan.text.isEmpty ? "0" : jumlahPerempuan.text,
                                          "alamat": alamatKeluarga.text,
                                          "jml_keluarga": jumlahKeluarga.text,
                                        }).then((value) => {
                                              Navigator.pop(context),

                                            });
                                      },
                                      child: const Text("Submit")),
                                ),

                ]),),
            ));
          }, child: const Text("Tambah Data Penduduk"))),
          const SizedBox(height: 40,),
          GetX<DataPendudukController>(builder: (controller) {
              return Column(
                children: [
                  Card(
                    color: Colors.redAccent,
                    child: ListTile(
                      leading: const Icon(Icons.family_restroom, size: 40, color: Colors.white,),
                      title: const Text("Jumlah Keluarga", style:TextStyle(fontSize: 20,color: Colors.white))
                  ,subtitle: Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Text("Total: ${controller.sumDataJK}",style: const TextStyle(color: Colors.white,fontSize:18),),
                  )
),),
SizedBox(height: 20,),
Card(
                    color: const Color.fromARGB(255, 69, 160, 116),
                    child: ListTile(
                      leading: const Icon(Icons.boy, size: 40, color: Colors.white,),
                      title: const Text("Jumlah Laki-Laki", style:TextStyle(fontSize: 20,color: Colors.white))
                  ,subtitle: Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Text("Total: ${controller.sumDataLk}",style: const TextStyle(color: Colors.white,fontSize:18),),
                  )
),),
SizedBox(height: 20,),
Card(
                    color: Colors.pinkAccent,
                    child: ListTile(
                      leading: const Icon(Icons.girl, size: 40, color: Colors.white,),
                      title: const Text("Jumlah Perempuan", style:TextStyle(fontSize: 20,color: Colors.white))
                  ,subtitle: Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Text("Total: ${controller.sumDataPr}",style: const TextStyle(color: Colors.white,fontSize:18),),
                  )
),),
                ],
              );
            },)


        ],),
      )),)
    );
  }
}
