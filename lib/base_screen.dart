import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x_rockets/base_view_model.dart';
import 'package:space_x_rockets/locator.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child)? builder;
  final Function(T, Function(int), List<AnimationController>)? initController;
  final Function(T)? onModelReady;
  final Function(T)? onFinish;

  const BaseView(
      {this.builder, this.onModelReady, this.onFinish, this.initController});

  @override
  _BaseScreenState<T> createState() => _BaseScreenState<T>();
}

class _BaseScreenState<T extends BaseViewModel> extends State<BaseView<T>>
    with TickerProviderStateMixin {
  T model = locator<T>();
  final List<AnimationController> _controllers = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      widget.onModelReady?.call(model);
    });
    widget.initController?.call(model, newController, _controllers);
  }

  @override
  void dispose() {
    widget.onFinish?.call(model);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(builder: widget.builder!),
    );
  }

  AnimationController newController(int duration) {
    var cont = AnimationController(
      vsync: this,
      duration: Duration(seconds: duration), // <-- Set your duration here.
    );
    _controllers.add(cont);
    return cont;
  }
}
