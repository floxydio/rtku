import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtku/constant/pref.constant.dart';
import 'package:rtku/routes/route_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    getPages: RouteList.listRoutePage,
    home: const SplashScreen(),
  ));
}


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timerSplash;

  @override
  void initState() {
    getLoginAccess();
    super.initState();
  }

  void getLoginAccess() async {
    var getAccessToken = await SharedPref().getAccessToken();
    timerSplash = Timer(const Duration(seconds:2), () {
      if(getAccessToken == null) {
        Get.offAllNamed("/sign-in");
      } else {
        Get.offAllNamed("/navigation");
      }
    });
  }

  @override
  void dispose() {
    timerSplash = null;
    timerSplash?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/splash.png", width: 200, height: 100,),
        SizedBox(height: 10,),
        CircularProgressIndicator()
      ],
    )),);

  }
}

