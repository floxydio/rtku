import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class KeuanganController extends GetxController {
  var dataKeuangan = <dynamic>[].obs;

  @override
  void onInit() {
    getKeuanganCollection();
    super.onInit();
  }


  void getKeuanganCollection() async {
    dataKeuangan.clear();
    CollectionReference collectionRef =
    FirebaseFirestore.instance.collection('keuangan');
    QuerySnapshot querySnapshot = await collectionRef.get();
        final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    dataKeuangan.addAll(allData.toList());
  }
}
