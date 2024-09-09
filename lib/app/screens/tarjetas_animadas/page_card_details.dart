import 'package:animations_flutter/app/screens/tarjetas_animadas/cards.dart';
import 'package:animations_flutter/app/screens/tarjetas_animadas/page_card_animation.dart';
import 'package:flutter/material.dart';

/// {@template PageCardDetails}
/// Page with details of a card.
/// {@endtemplate}
class PageCardDetails extends StatelessWidget {
  /// {@macro PageCardDetails}
  const PageCardDetails({
    required this.card,
    super.key,
  });

  /// The card with details.
  final Card3D card;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.deepOrange[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(height: size.height * 0.1),
              SizedBox(
                height: 150,
                child: Hero(
                  tag: card.title,
                  child: Card3DWidget(card: card),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                card.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                card.author,
                style: const TextStyle(
                  color: Colors.white30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
