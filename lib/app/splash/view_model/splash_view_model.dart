import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:space_x_rockets/app/home/view/home_view.dart';
import 'package:space_x_rockets/base_view_model.dart';
import 'package:space_x_rockets/enums/screen_state.dart';
import 'package:space_x_rockets/locator.dart';
import 'package:space_x_rockets/services/navigation_service.dart';
import 'package:video_player/video_player.dart';

class SplashViewModel extends BaseViewModel {
  var navigation = locator<NavigationService>();
  VideoPlayerController? controller;

  playVideo(context) {
    controller = VideoPlayerController.asset('assets/videos/splash.MP4')
      ..initialize().then(
        (_) {
          setState(ViewState.Idle);
          controller!.play();
          Timer(
            const Duration(seconds: 5),
            () {
              goScreenAnimated(
                context,
                const HomeView(),
              );
            },
          );
        },
      );
  }

  void goScreenAnimated(
    context,
    screen,
  ) {
    Navigator.push(
      context,
      PageTransition(
        child: screen,
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 1000),
        alignment: Alignment.center,
      ),
    );
  }
}
