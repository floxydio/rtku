import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtku/controller/profile.controller.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final controller = Get.put(ProfileController());
     return SingleChildScrollView(child: Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          const Text("Pengaturan", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
         const SizedBox(height: 20,),
         ListTile(
              contentPadding: EdgeInsets.zero,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(controller.displayPhoto.toString(), fit: BoxFit.contain)),
              title: Text(controller.displayName.toString()),
              subtitle: Text(controller.displayEmail.toString()),
            ),
         const SizedBox(height: 60,),
        InkWell(
          onTap: () {
            controller.logout();
          },
          child: Row(
            children: const [
            Icon(Icons.logout),
            SizedBox(width: 30,),
            Text("Keluar", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)
          ],),
        )
      ]),
    ),);

  }
}
