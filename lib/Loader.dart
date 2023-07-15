import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  const Loader({super.key});

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(minutes: 1), vsync: this);

    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation.addListener(() {
      this.setState(() {});
    });
    animation.addStatusListener((AnimationStatus status) {});

    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.greenAccent,
          height: 100,
          width: animation.value * 50.0,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 5.0),
        ),
        Container(
          color: Colors.white,
          height: 20,
          width: animation.value * 50.0,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 30.0),
        ),
        Container(
          color: Colors.white,
          height: 20,
          width: animation.value * 50.0,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 5.0),
        ),
        Container(
          color: Colors.black,
          height: 20,
          width: animation.value * 50.0,
        ),
      ],
    );
  }
}
