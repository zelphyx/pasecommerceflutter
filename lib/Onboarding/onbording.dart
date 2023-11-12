import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_kelas11/Onboarding/Onboardingmodel.dart';
import 'package:pas_kelas11/pages/home_page.dart';
import 'package:pas_kelas11/Onboarding/onboarding_controller.dart';

class Constants {
  static const Color kblue = Color(0xFF4756DF);
  static const Color kwhite = Color(0xFFFFFFFF);
  static const Color kblack = Color(0xFF000000);
  static const Color kbrown300 = Color(0xFF8D6E63);
  static const Color kbrown = Color(0xFF795548);
  static const Color kgrey = Color(0xFFC0C0C0);
}

class Onboarding extends StatelessWidget {
  final OnboardingController _controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    var contents = [
      Onboardingmodel(
        title: 'Welcome to Grandeur',
        image: 'assets/images/onboarding1.png',
        discription: "The latest fashion application to help you find the right style."
            "Explore the world of fashion easily and find the latest style inspiration every day.",
      ),
      Onboardingmodel(
        title: 'Style Exploration',
        image: 'assets/images/onboarding0.png',
        discription: "You can find the latest collections from your favorite brands."
                     "Enjoy an engaging shopping experience with easy access to the latest trends in the world of fashion.",
      ),
      Onboardingmodel(
        title: 'Shopping Experience ',
        image: 'assets/images/onboarding2.png',
        discription: "Create your personal profile and enjoy personalized product recommendations. Trendify, a shopping experience that suits you.",
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: PageController(initialPage: 0),
              itemCount: contents.length,
              onPageChanged: (int index) {
                _controller.changePage(index);
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Image.asset(
                        contents[i].image,
                        height: 300,
                      ),
                      Text(
                        contents[i].title,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Constants.kblack,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        contents[i].discription,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          color: Constants.kgrey,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                    (index) => buildDot(index, context),
              ),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.all(40),
            width: double.infinity,
            child: Obx(() => TextButton(
              child: Text(_controller.currentIndex.value == contents.length - 1 ? "Continue" : "Next"),
              onPressed: () {
                if (_controller.currentIndex.value == contents.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomePage(),
                    ),
                  );
                }
                _controller.nextPage();
              },
              style: TextButton.styleFrom(
                backgroundColor: Constants.kblack,
                primary: Constants.kwhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: _controller.currentIndex.value == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Constants.kblue,
      ),
    );
  }
}
