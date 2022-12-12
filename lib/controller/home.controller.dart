import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HomeController extends GetxController {
  RxInt sumData = 0.obs;
  var data = [];

  @override
  void onInit() {
    sumAllData();
    super.onInit();
  }

  void sumAllData() async {
      CollectionReference collectionRef =
    FirebaseFirestore.instance.collection('keuangan');
    QuerySnapshot querySnapshot = await collectionRef.get();
        final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    data.addAll(allData);

   data.forEach((element) {
    sumData += int.parse(element["price"]);

   });

  }
}
