import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtku/controller/auth.controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      body: Center(child: ElevatedButton(onPressed: () async {
       controller.signInWithGoogle();
      }, child: const Text("Sign In With Google"),)),
    );
  }
}
