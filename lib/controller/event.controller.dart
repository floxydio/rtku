import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class EventFirebase extends GetxController {
  var dataEvent = <dynamic>[].obs;

  @override
  void onInit() {
    getEventCollection();
    super.onInit();
  }


  void getEventCollection() async {
    dataEvent.clear();
    CollectionReference collectionRef =
    FirebaseFirestore.instance.collection('event');
    QuerySnapshot querySnapshot = await collectionRef.get();
        final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    dataEvent.addAll(allData.toList());
  }
}
