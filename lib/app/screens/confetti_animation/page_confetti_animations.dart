import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

/// {@template PageConfetiAnimation}
/// Page with confetti animations.
/// {@endtemplate}

class PageConfetiAnimation extends StatefulWidget {
  /// {@macro PageConfetiAnimation}
  const PageConfetiAnimation({super.key});

  @override
  State<PageConfetiAnimation> createState() => _PageConfetiAnimationState();
}

class _PageConfetiAnimationState extends State<PageConfetiAnimation> {
  /// Controller for confetti animation.
  final _controller = ConfettiController();

  /// initial animation.
  bool isPlaying = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          backgroundColor: Colors.deepOrange[300],
          appBar: AppBar(
            title: const Text(
              'Confetti Animations',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            iconTheme: const IconThemeData(
              color: Colors.white,
              size: 30,
            ),
          ),
          body: Center(
            child: MaterialButton(
              onPressed: () {
                if (isPlaying) {
                  _controller.stop();
                } else {
                  _controller.play();
                }
                isPlaying = !isPlaying;
              },
              color: Colors.white,
              child: const Text('Confetti'),
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: _controller,
          blastDirection: pi / 2,
          colors: const [
            Colors.deepOrange,
            Colors.yellowAccent,
          ],
          gravity: 0.01,
          emissionFrequency: 0.1,
        ),
      ],
    );
  }
}
