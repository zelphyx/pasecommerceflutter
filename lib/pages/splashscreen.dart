import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_kelas11/pages/register.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        opacity = 1.0;
      });

      Future.delayed(Duration(seconds: 2), () {

        Get.offNamed("/onboard");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: Duration(seconds: 1), // Adjust the duration as needed
              opacity: opacity, // Use the opacity value
              child: Row(
                children: [
                  Image.asset("asset/logozzz.png", width: 60, height: 60),
                  SizedBox(width: 12,),
                  Text(
                    "Shopzo",
                    style: TextStyle(
                      fontFamily: 'LibreCaslonText',
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
