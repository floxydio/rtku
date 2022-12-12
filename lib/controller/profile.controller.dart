import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constant/pref.constant.dart';

class ProfileController extends GetxController {
  String? displayName;
  String? displayEmail;
  String? displayPhoto;

final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void onInit() {
    getUserNameSignIn();
    super.onInit();
  }

  void getUserNameSignIn() {
     FirebaseAuth.instance.authStateChanges().listen((event) {
        displayName = event?.displayName;
        displayEmail = event?.email;
        displayPhoto = event?.photoURL;
    });
  }

  void logout() async {

  await SharedPref().removeAccessToken();
  await _googleSignIn.signOut();
  Get.snackbar("Notification", "Berhasil Keluar");
  Get.offAndToNamed("/sign-in");

  }

}
