// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:googlead/src/core/constants/assets.dart';

class AnimatedDishWidget extends StatelessWidget {
  final Duration dishPlayDuration;
  final Duration leavesDelayDuration;
  final BoxConstraints? constraints;
  final String? imageUrl;
  final Duration? dishPlayTime;

  const AnimatedDishWidget({
    Key? key,
    required this.dishPlayDuration,
    required this.leavesDelayDuration,
    this.constraints,
    this.imageUrl,
    this.dishPlayTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
              left: 30,
              child: Transform.rotate(
                angle: 2 * pi * 0.85,
                child: Image.asset(Assets.leaves, height: 200),
              ),
            )
            .animate()
            .scaleXY(
              delay: leavesDelayDuration,
              begin: 0,
              end: 1,
              duration: dishPlayDuration,
              curve: Curves.decelerate,
            )
            .slide(begin: const Offset(0.7, -0.4), end: Offset.zero),
        Positioned(
              right: -100,
              top: 30,
              child: Image.asset(Assets.blackPepper, height: 140),
            )
            .animate()
            .scaleXY(
              delay: leavesDelayDuration - 200.ms,
              begin: 0,
              end: 1,
              duration: dishPlayDuration - 300.ms,
              curve: Curves.decelerate,
            )
            .slide(begin: const Offset(0.7, -0.4), end: Offset.zero),
        Positioned(
              left: -30,
              bottom: -20,
              child: Transform.rotate(
                angle: 2 * pi * 0.85,
                child: Image.asset(Assets.leaves, height: 150),
              ),
            )
            .animate()
            .scaleXY(
              delay: leavesDelayDuration,
              begin: 0,
              end: 1,
              duration: dishPlayDuration,
              curve: Curves.decelerate,
            )
            .slide(begin: const Offset(0.7, -0.4), end: Offset.zero),
        Positioned(
              right: 0,
              child: Transform.rotate(
                angle: 2 * pi * 0.45,
                child: Image.asset(Assets.leaves, height: 150),
              ),
            )
            .animate()
            .scaleXY(
              delay: leavesDelayDuration,
              begin: 0,
              end: 1,
              duration: dishPlayDuration,
              curve: Curves.decelerate,
            )
            .slide(begin: const Offset(-0.7, 1), end: Offset.zero),
        Container(
          alignment: Alignment.topCenter,
          child: Image.asset(
            Assets.dish,
            fit: BoxFit.contain,
            height: 340,
          ).animate().scaleXY(
            begin: 0,
            end: 1,
            duration: dishPlayDuration,
            curve: Curves.easeInOutCubic,
          ),
        ),
      ],
    );
  }
}
