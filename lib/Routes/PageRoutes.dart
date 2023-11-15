import 'package:get/get.dart';
import 'package:pas_kelas11/Onboarding/onbording.dart';
import 'package:pas_kelas11/pages/home_page.dart';
import 'package:pas_kelas11/pages/register.dart';
import 'package:pas_kelas11/pages/login.dart';
import 'package:pas_kelas11/pages/splashscreen.dart';



List<GetPage> routes = [
GetPage(name: '/', page: () =>  Splash()),
GetPage(name: '/onboard', page: () =>  Onboarding()),
GetPage(name: '/register', page: () =>  Register()),
GetPage(name: '/login', page: () =>  loginpage()),
GetPage(name: '/homepage', page: () =>  HomePage()),

];