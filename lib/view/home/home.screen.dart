import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtku/controller/data_penduduk.controller.dart';
import 'package:rtku/controller/home.controller.dart';
import 'package:rtku/controller/keuangan.controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllerFamily = Get.put(DataPendudukController());
    final controllerHome = Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "RT-KU",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                            shape: const CircleBorder()),
                        onPressed: () {
                          Get.toNamed("/data-penduduk");
                        },
                        child: const Icon(Icons.person_add)),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Data Penduduk"),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                            shape: const CircleBorder()),
                        onPressed: () {
                          Get.toNamed("/keuangan");
                        },
                        child: const Icon(Icons.monetization_on)),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Keuangan"),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                            shape: const CircleBorder()),
                        onPressed: () {
                          Get.toNamed("/acara");
                        },
                        child: const Icon(Icons.event)),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Acara"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30,),
            GetX<HomeController>(builder: (controller) {
              return Card(
                color: const Color.fromARGB(255, 69, 160, 116),
                child: ListTile(
                  leading: const Icon(Icons.money_sharp, size: 40, color: Colors.white),
                  title: const Text("Jumlah Keuangan", style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white))
              ,subtitle: Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text("Rp${controllerHome.sumData.toString()}",style: const TextStyle(fontSize:18, color: Colors.white),),
              )
),);
            },),
            GetX<DataPendudukController>(builder: (controllerFamily) {
              return Card(
                color: Colors.redAccent,
                child: ListTile(
                  leading: const Icon(Icons.family_restroom, size: 40, color: Colors.white),
                  title: const Text("Jumlah Keluarga", style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white))
              ,subtitle: Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text("Total: ${controllerFamily.sumDataJK.toString()}",style: const TextStyle(fontSize:18, color: Colors.white),),
              )
),);
            },)


          ]),
        ),
      )),
    );
  }
}
