import 'package:flutter/material.dart';
import 'package:scoremob/res/assets_res.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({super.key});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,

      duration: Duration(seconds: 1), // Set the duration of rotation
    )..repeat(); // Makes the rotation continuously repeat
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        Align(
            alignment: Alignment.center,
            child: RotationTransition(
              turns: _controller,
              child: Image.asset(
                AssetsRes.BALL_1,
                width: 68,
                height: 68,
              ),
            )),
        Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            color: Colors.black,
            strokeAlign: 6,
            strokeCap: StrokeCap.round,
            strokeWidth: 8,
          ),
        ),
      ]),
    );
  }
}
