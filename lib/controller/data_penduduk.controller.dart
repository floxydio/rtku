import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DataPendudukController extends GetxController {
  RxInt sumDataLk = 0.obs;
  RxInt sumDataPr = 0.obs;
  RxInt sumDataJK = 0.obs;
  var data = [];

  @override
  void onInit() {
    sumAllData();
    super.onInit();
  }

  void sumAllData() async {
      CollectionReference collectionRef =
    FirebaseFirestore.instance.collection('data_penduduk');
    QuerySnapshot querySnapshot = await collectionRef.get();
        final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    data.addAll(allData);

   data.forEach((element) {
    sumDataLk += int.parse(element["jml_laki"]);
    sumDataPr += int.parse(element["jml_perempuan"]);
    sumDataJK += int.parse(element["jml_keluarga"]);

   });

  }
}
