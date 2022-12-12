import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:rtku/constant/navigation.constant.dart';
import 'package:rtku/controller/event.controller.dart';
import 'package:rtku/controller/profile.controller.dart';
import 'package:rtku/view/home/home.screen.dart';
import 'package:rtku/view/news/news.screen.dart';


class MenuNavigation extends StatefulWidget {
  const MenuNavigation({Key? key}) : super(key: key);

  @override
  State<MenuNavigation> createState() => _MenuNavigationState();
}

class _MenuNavigationState extends State<MenuNavigation> {

  PersistentTabController? controller;
   final controllerProfile = Get.put(ProfileController());
    final controllerEvent = Get.put(EventFirebase());

  @override
  void initState() {
    super.initState();
        controller = PersistentTabController(initialIndex: 0);
  }


  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PersistentTabView(context, screens: NavigationConstant.pagesScreen, controller: controller, items: NavigationConstant.navbarIcons, confineInSafeArea: true,

          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration:  Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style3, // Choose the nav bar style with this property.
      ),
    );
  }
}
