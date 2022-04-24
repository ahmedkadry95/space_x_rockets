import 'package:flutter/material.dart';
import 'package:space_x_rockets/app/splash/view_model/splash_view_model.dart';
import 'package:space_x_rockets/base_screen.dart';
import 'package:space_x_rockets/utils/extensions.dart';
import 'package:video_player/video_player.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      onModelReady: (viewModel) {
        viewModel.playVideo(context);
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          body: viewModel.controller == null
              ? Container()
              : viewModel.controller!.value.isInitialized
              ? SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: VideoPlayer(
              viewModel.controller!,
            ),
          )
              : Container().onTap(
                () {
              viewModel.controller!.value.isPlaying
                  ? viewModel.controller!.pause()
                  : viewModel.controller!.play();
            },
          ),
        );
      },
    );
  }
}
