import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Observed variable for selected index
  var selectedIndex = 0.obs;

  // Function to change the current page
  void changePage(int index) {
    selectedIndex.value = index;
  }

  final ScrollController scrollController = ScrollController();
  Timer? autoScrollTimer;

  @override
  void onInit() {
    super.onInit();
    // Set up the auto-scroll timer with periodic execution every 3 seconds
    autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (scrollController.hasClients) {
        double maxScrollExtent = scrollController.position.maxScrollExtent;
        double currentPosition = scrollController.position.pixels;
        double nextPosition = currentPosition + 200; // Adjust the scroll amount

        // If next position exceeds the max scroll extent, go back to the start
        if (nextPosition >= maxScrollExtent) {
          nextPosition = 0;
        }

        // Perform the scroll animation
        scrollController.animateTo(
          nextPosition,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void onClose() {
    // Cancel the timer when the controller is closed
    autoScrollTimer?.cancel();
    // Dispose the scroll controller
    scrollController.dispose();
    super.onClose();
  }
}
