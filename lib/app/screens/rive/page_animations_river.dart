import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

/// {@template PageAnimationRive}
/// Page with rive animations.
/// {@endtemplate}

class PageAnimationRive extends StatelessWidget {
  /// {@macro PageAnimationRive}
  const PageAnimationRive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[300],
      appBar: AppBar(
        title: const Text(
          'Rive Animations',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
      ),
      body: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SizedBox(
              child: RiveAnimation.asset(
                'assets/stasher_character.riv',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
