import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// {@template PageLottieAnimation}
/// Page with lottie animations.
/// {@endtemplate}

class PageLottieAnimation extends StatefulWidget {
  /// {@macro PageLottieAnimation}
  const PageLottieAnimation({super.key});

  @override
  State<PageLottieAnimation> createState() => _PageLottieAnimationState();
}

class _PageLottieAnimationState extends State<PageLottieAnimation>
    with SingleTickerProviderStateMixin {
  /// Controller for lottie animation.
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  /// initial animation.
  bool bookMarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[200],
      appBar: AppBar(
        title: const Text(
          'Lottie Animations',
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
      body: Column(
        children: [
          const SizedBox(height: 30),
          InkWell(
            onTap: () {
              if (bookMarked == false) {
                bookMarked = true;
                _controller.forward();
              } else {
                bookMarked = false;
                _controller.reverse();
              }
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Click on animation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 100),
          Center(
            child: SizedBox(
              child: GestureDetector(
                onTap: () {
                  if (bookMarked == false) {
                    bookMarked = true;
                    _controller.forward();
                  } else {
                    bookMarked = false;
                    _controller.reverse();
                  }
                },
                child: Lottie.network(
                  'https://lottie.host/9f253e40-ac29-4160-b0d3-5f840aec8558/PhRHFSSxKk.json',
                  controller: _controller,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
