import 'package:get/get.dart';
import 'package:rtku/main.dart';
import 'package:rtku/navigation/navigation.dart';
import 'package:rtku/view/auth/sign_in/sign_in.screen.dart';
import 'package:rtku/view/auth/sign_up/sign_up.screen.dart';
import 'package:rtku/view/calendar/calendar.screen.dart';
import 'package:rtku/view/event/event.screen.dart';
import 'package:rtku/view/home/home.screen.dart';
import 'package:rtku/view/news/news.screen.dart';
import 'package:rtku/view/penduduk/data_penduduk.screen.dart';
import 'package:rtku/view/profile/profile.screen.dart';
import '../view/keuangan/keuangan.screen.dart';

class RouteList {
  static List<GetPage<dynamic>> listRoutePage = [
      GetPage(name: "/splash", page:() => const SplashScreen()),
      GetPage(name: "/sign-in", page: () => const SignInPage()),
      GetPage(name: "/sign-up", page: () => const SignUpPage()),
      GetPage(name: "/home", page: () => const HomePage()),
      GetPage(name: "/news", page: () => const NewsPage()),
      GetPage(name: "/navigation", page: () => const MenuNavigation()),
      GetPage(name: "/profile", page: () => const ProfilePage()),
      GetPage(name: "/calendar", page: () => const CalendarPage()),
      GetPage(name: "/acara", page: () => const EventPage()),
      GetPage(name: "/keuangan", page: () => const KeuanganPage()),
      GetPage(name: "/data-penduduk", page: () => const DataPendudukPage())
  ];
}
