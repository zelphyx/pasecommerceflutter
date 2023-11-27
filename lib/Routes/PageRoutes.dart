import 'package:get/get.dart';
import 'package:pas_kelas11/Cart/cart_view.dart';
import 'package:pas_kelas11/Dashboard/DashboardView.dart';

import 'package:pas_kelas11/Onboarding/onbording.dart';
import 'package:pas_kelas11/Payment/PaymentPage.dart';

import 'package:pas_kelas11/pages/allproducts.dart';
import 'package:pas_kelas11/pages/home_page.dart';
import 'package:pas_kelas11/pages/landing.dart';
import 'package:pas_kelas11/Profile/profile.dart';
import 'package:pas_kelas11/pages/register.dart';
import 'package:pas_kelas11/pages/login.dart';
import 'package:pas_kelas11/pages/splashscreen.dart';
import 'package:pas_kelas11/Wishlist/wishlist.dart';



List<GetPage> routes = [
GetPage(name: '/', page: () =>  Splash()),
GetPage(name: '/onboard', page: () =>  OnBoard()),
GetPage(name: '/register', page: () =>  Register()),
GetPage(name: '/login', page: () =>  loginpage()),
GetPage(name: '/homepage', page: () =>  DashboardScreen()),
GetPage(name: '/cart', page: () =>  Cart()),
GetPage(name: '/allproduct', page: () =>  allproducts()),
GetPage(name: '/landing', page: () =>  landing()),
GetPage(name: '/profile', page: () =>  Profile()),
GetPage(name: '/payment', page: () =>  paymentoption()),


];