import 'package:flutter/material.dart';

class DetailController {
  PageController pageController = PageController();
  int currentPage = 0;

  void init() {
    pageController.addListener(() {
      currentPage = pageController.page?.round() ?? 0;
    });
  }

  void dispose() {
    pageController.dispose();
  }
}