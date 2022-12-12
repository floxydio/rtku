import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtku/controller/event.controller.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final controllerEvent = Get.put(EventFirebase());
  CollectionReference event = FirebaseFirestore.instance.collection("event");

  final namaKegiatan = TextEditingController();
  final tempatKegiatan = TextEditingController();
  final tanggalKegiatan = TextEditingController();
  final pelaksanaKegiatan = TextEditingController();
  final jamKegiatan = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    namaKegiatan.dispose();
    tempatKegiatan.dispose();
    tanggalKegiatan.dispose();
    pelaksanaKegiatan.dispose();
    jamKegiatan.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
            child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Kegiatan Acara",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.dialog(AlertDialog(
                            content: SingleChildScrollView(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Form Pengisian",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: const Icon(Icons.close))
                                  ],
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                const Text("Nama Kegiatan",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: namaKegiatan,
                                  decoration: const InputDecoration(
                                      hintText: "Nama Kegiatan...",
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Tempat Kegiatan",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: tempatKegiatan,
                                  decoration: const InputDecoration(
                                      hintText: "Tempat Kegiatan...",
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Tanggal Kegiatan",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: tanggalKegiatan,
                                  decoration: const InputDecoration(
                                      hintText: "Tanggal Kegiatan...",
                                      helperText:
                                          "Contoh: Sabtu, 17 Desember 2022",
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Jam Kegiatan",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: jamKegiatan,
                                  decoration: const InputDecoration(
                                      hintText: "Jam Kegiatan...",
                                      helperText: "Contoh: 12.00 - 15.00",
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Pelaksana Kegiatan",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: pelaksanaKegiatan,
                                  decoration: const InputDecoration(
                                      hintText: "Pelaksana Kegiatan...",
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  width: Get.width,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        event.add({
                                          "name": namaKegiatan.text,
                                          "place": tempatKegiatan.text,
                                          "date": tanggalKegiatan.text,
                                          "time": jamKegiatan.text,
                                          "created": pelaksanaKegiatan.text,
                                        }).then((value) => {
                                              Navigator.pop(context),
                                              Get.showSnackbar(
                                                  const GetSnackBar(
                                                title: "Berhasil diinput",
                                                backgroundColor:
                                                    Colors.greenAccent,
                                                duration: Duration(seconds: 1),
                                              )),
                                              controllerEvent
                                                  .getEventCollection()
                                            });
                                      },
                                      child: const Text("Submit")),
                                ),
                              ],
                            )),
                          ));
                        },
                        child: const Text("Tambah Kegiatan"),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            GetX<EventFirebase>(
              builder: (controllerEvent) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controllerEvent.dataEvent.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 0.7,
                        child: ListTile(
                          title: Text(
                            (controllerEvent.dataEvent[index]["name"]),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                controllerEvent.dataEvent[index]["date"],
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                controllerEvent.dataEvent[index]["place"],
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Jam : ${controllerEvent.dataEvent[index]["time"]}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Pelaksana : ${controllerEvent.dataEvent[index]["created"]}",
                                  style: const TextStyle(fontSize: 16),
                                )
                              ]),
                        ),
                      );
                    });
              },
            )
          ]),
        )),
      ),
    );
  }
}
