import 'package:get/get.dart';
import 'package:pas_kelas11/pages/register.dart';
import 'package:pas_kelas11/pages/login.dart';
import 'package:pas_kelas11/pages/splashscreen.dart';
import 'package:pas_kelas11/pages/homepagetest.dart';



List<GetPage> routes = [
GetPage(name: '/', page: () =>  Splash()),
GetPage(name: '/register', page: () =>  Register()),
GetPage(name: '/login', page: () =>  loginpage()),
GetPage(name: '/homepage', page: () =>  home()),

];