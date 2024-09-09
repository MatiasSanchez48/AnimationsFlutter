import 'package:flutter/material.dart';

/// {@template PageAnimatedContainer}
/// Page with animated container.
/// {@endtemplate}

class PageAnimatedContainer extends StatefulWidget {
  /// {@macro PageAnimatedContainer}
  const PageAnimatedContainer({super.key});

  @override
  State<PageAnimatedContainer> createState() => _PageAnimatedContainerState();
}

class _PageAnimatedContainerState extends State<PageAnimatedContainer>
    with TickerProviderStateMixin {
  /// animation controller.
  late AnimationController _controller;

  /// rotation animation controller.
  late Animation<double> _rotationAnimation;

  /// radius animation controller.
  late Animation<double> _radiusAnimation;

  @override
  void initState() {
    super.initState();
    // animation controller.
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    // rotation controller
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    // radius controller
    _radiusAnimation = Tween<double>(
      begin: 450,
      end: 10,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller
      ..addListener(() => setState(() {}))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[300],
      appBar: AppBar(
        title: const Text('Animations Flutter'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle: _rotationAnimation.value,
              child: Container(
                width: 225,
                height: 225,
                decoration: BoxDecoration(
                  color: Colors.deepOrange[400],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 255, 91, 41)
                          .withOpacity(0.8),
                      offset: const Offset(6, 6),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(6, 6),
                    ),
                  ],
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 0.1,
              child: Container(
                width: 205,
                height: 205,
                decoration: BoxDecoration(
                  color: Colors.deepOrange[400],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 255, 112, 67)
                          .withOpacity(0.8),
                      offset: const Offset(6, 6),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(6, 6),
                    ),
                  ],
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 0.2,
              child: Container(
                width: 185,
                height: 185,
                decoration: BoxDecoration(
                  color: Colors.deepOrange[500],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 255, 87, 34)
                          .withOpacity(0.8),
                      offset: const Offset(6, 6),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(6, 6),
                    ),
                  ],
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 0.3,
              child: Container(
                width: 155,
                height: 155,
                decoration: BoxDecoration(
                  color: Colors.deepOrange[500],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 255, 95, 47)
                          .withOpacity(0.8),
                      offset: const Offset(6, 6),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(6, 6),
                    ),
                  ],
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 0.4,
              child: Container(
                width: 125,
                height: 125,
                decoration: BoxDecoration(
                  color: Colors.deepOrange[200],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 255, 171, 145)
                          .withOpacity(0.8),
                      offset: const Offset(6, 6),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(6, 6),
                    ),
                  ],
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 0.5,
              child: Container(
                width: 105,
                height: 105,
                decoration: BoxDecoration(
                  color: Colors.deepOrange[200],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 254, 188, 167)
                          .withOpacity(0.8),
                      offset: const Offset(6, 6),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(6, 6),
                    ),
                  ],
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 0.6,
              child: Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  color: Colors.deepOrange[100],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 194, 149, 135)
                          .withOpacity(0.8),
                      offset: const Offset(6, 6),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(6, 6),
                    ),
                  ],
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 0.7,
              child: Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.deepOrange[100],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 255, 204, 188)
                          .withOpacity(0.8),
                      offset: const Offset(6, 6),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(6, 6),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
