import 'package:flutter/material.dart';
import 'package:pas_kelas11/main.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _SplashLogo(),
      ),
    );
  }
}

class _SplashLogo extends StatefulWidget {
  @override
  _SplashLogoState createState() => _SplashLogoState();
}

class _SplashLogoState extends State<_SplashLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityTween;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _opacityTween = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();

    Future.delayed(Duration(seconds: 2), () {
      if (isviewed != 0) {
        Get.offNamed('/onboard');
      } else {
        Get.offNamed('/landing');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacityTween,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityTween.value,
          child: Visibility(
            visible: _opacityTween.value > 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("asset/logozzz.png", width: 60, height: 60),
                SizedBox(width: 12),
                Text(
                  "Shopzo",
                  style: TextStyle(
                    fontFamily: 'LibreCaslonText',
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
