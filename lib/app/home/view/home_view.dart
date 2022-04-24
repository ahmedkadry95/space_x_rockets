import 'package:flutter/material.dart';
import 'package:space_x_rockets/app/home/controller/home_controller.dart';
import 'package:space_x_rockets/base_screen.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (viewModel) {},
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Center(
            child: Text('home'),
          ),
        );
      },
    );
  }
}
