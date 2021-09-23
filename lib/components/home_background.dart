import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class HomeBackground extends StatelessWidget {
  final Widget child;

  const HomeBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -90,
            right: 0,
            width: MediaQuery.of(context).size.width,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: SvgPicture.asset(
                'assets/images/home_background.svg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: -90,
            right: -20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(90),
                border: Border.all(
                  color: Colors.white,
                  width: 10,
                ),
              ),
              child: Image.asset(
                'assets/images/pizza.png',
                width: 180,
              ),
            ),
          ),
          SafeArea(child: child)
        ],
      ),
    );
  }
}
