import 'package:animations_flutter/app/screens/animation_container/page_animations_containers.dart';
import 'package:animations_flutter/app/screens/confetti_animation/page_confetti_animations.dart';
import 'package:animations_flutter/app/screens/lottie_animations/page_lottie.dart';
import 'package:animations_flutter/app/screens/rive/page_animations_river.dart';
import 'package:animations_flutter/app/screens/tarjetas_animadas/page_card_animation.dart';
import 'package:animations_flutter/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// {@template App}
/// App Principal with Material App.
/// {@endtemplate}

class App extends StatelessWidget {
  /// {@macro App}
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Animations Flutter',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: PagePrincipal(),
    );
  }
}

/// {@template PagePrincipal}
/// Page Principal with Menu to go to other pages.
/// {@endtemplate}

class PagePrincipal extends StatelessWidget {
  /// {@macro PagePrincipal}
  const PagePrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[300],
      appBar: AppBar(
        title: const Text(
          'Animations Flutter',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    _Item(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const PageAnimatedContainer(),
                          ),
                        );
                      },
                      text: 'Containers Animated',
                    ),
                    const SizedBox(height: 10),
                    _Item(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const PageConfetiAnimation(),
                          ),
                        );
                      },
                      text: 'Confeti Animations',
                    ),
                    const SizedBox(height: 10),
                    _Item(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const PageLottieAnimation(),
                          ),
                        );
                      },
                      text: 'Lottie Animations',
                    ),
                    const SizedBox(height: 10),
                    _Item(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const PageAnimationRive(),
                          ),
                        );
                      },
                      text: 'Rive Animations',
                    ),
                    const SizedBox(height: 10),
                    _Item(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const PageCardAnimations(),
                          ),
                        );
                      },
                      text: 'Cards Animations',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.onPressed,
    required this.text,
  });

  ///
  final VoidCallback onPressed;

  ///
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          const Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
