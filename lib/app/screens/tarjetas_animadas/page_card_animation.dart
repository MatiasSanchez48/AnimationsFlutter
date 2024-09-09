import 'dart:math';
import 'dart:ui';

import 'package:animations_flutter/app/screens/tarjetas_animadas/cards.dart';
import 'package:animations_flutter/app/screens/tarjetas_animadas/page_card_details.dart';
import 'package:flutter/material.dart';

/// {@template PageCardAnimations}
/// Page with cards animations.
/// {@endtemplate}

class PageCardAnimations extends StatelessWidget {
  /// {@macro PageCardAnimations}
  const PageCardAnimations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[300],
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Card Animations',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Expanded(
            flex: 3,
            child: CardsStacked(),
          ),
          Expanded(
            flex: 2,
            child: ListOfCard(),
          ),
        ],
      ),
    );
  }
}

/// {@template CardsStacked}
/// Cards Stacked with animations and go to details of card.
/// {@endtemplate}

class CardsStacked extends StatefulWidget {
  /// {@macro CardsStacked}
  const CardsStacked({super.key});

  @override
  State<CardsStacked> createState() => _CardsStackedState();
}

class _CardsStackedState extends State<CardsStacked>
    with TickerProviderStateMixin {
  /// animation in stacked cards.
  bool _selectMode = true;

  /// index of selected card.
  int _selectedIndex = 0;

  /// animation to Section in stacked cards.
  late AnimationController _animationControllerSelection;

  /// animation to Movement in stacked cards.
  late AnimationController _animationControllerMovement;

  /// Funtion of go to details of card in stacked cards.
  Future<void> _onCardSelected(Card3D card, int index) async {
    setState(() {
      _selectedIndex = index;
    });
    const duration = Duration(milliseconds: 750);
    _animationControllerSelection.forward();
    await Navigator.of(context).push(
      PageRouteBuilder<void>(
        transitionDuration: duration,
        reverseTransitionDuration: duration,
        pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
          opacity: animation,
          child: PageCardDetails(
            card: card,
          ),
        ),
      ),
    );
    _animationControllerSelection.reverse(from: 1);
  }

  /// function to get current factor of movement in stacked cards.
  int _getCurrentFactor(int index) {
    if (_selectedIndex == index) {
      return 0;
    } else if (_selectedIndex > index) {
      return -1;
    } else {
      return 1;
    }
  }

  @override
  void initState() {
    _animationControllerSelection = AnimationController(
      vsync: this,
      lowerBound: 0.15,
      upperBound: 0.5,
      duration: const Duration(milliseconds: 500),
    );
    _animationControllerMovement = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 880),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationControllerSelection.dispose();
    _animationControllerMovement.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => AnimatedBuilder(
        animation: _animationControllerSelection,
        builder: (context, _) {
          final selectionValue = _animationControllerSelection.value;

          return GestureDetector(
            onTap: () {
              if (!_selectMode) {
                _animationControllerSelection.forward().whenComplete(() {
                  setState(() => _selectMode = true);
                });
              } else {
                _animationControllerSelection.reverse().whenComplete(() {
                  setState(() => _selectMode = false);
                });
              }
            },
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(selectionValue),
              child: AbsorbPointer(
                absorbing: !_selectMode,
                child: Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth * 0.45,
                  color: Colors.transparent,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ...List.generate(
                        4,
                        (index) => Card3DItem(
                          height: constraints.maxHeight / 2.4,
                          card: cards[index],
                          percent: selectionValue,
                          depth: index,
                          verticalFactor: _getCurrentFactor(index),
                          animation: _animationControllerMovement,
                          onCardSelected: (card) async {
                            await _onCardSelected(card, index);
                          },
                        ),
                      ).reversed,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// {@template Card3DItem}
/// Card3D Item for animation.
/// {@endtemplate}

class Card3DItem extends AnimatedWidget {
  /// {@macro Card3DItem}
  const Card3DItem({
    required Animation<double> animation,
    required this.onCardSelected,
    required this.percent,
    required this.height,
    required this.depth,
    required this.card,
    this.verticalFactor = 0,
    super.key,
  }) : super(listenable: animation);

  /// Card3D item.
  final Card3D card;

  /// Percent of the animation.
  final double percent;

  /// Height of the card.
  final double height;

  /// Depth of the animation.
  final int depth;

  /// Vertical factor of the animation.
  final int verticalFactor;

  /// Callback when the card is selected.
  final ValueChanged<Card3D> onCardSelected;

  /// Getter for the animation.
  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    const depthFactor = 50.0;
    final bottomMArgin = height / 4.0;

    return Positioned(
      left: 0,
      right: 0,
      top: height + -depth * height / 2.0 * percent - bottomMArgin + 50,
      child: Opacity(
        opacity: verticalFactor == 0 ? 1 : 1 - animation.value,
        child: Hero(
          tag: card.title,
          flightShuttleBuilder: (
            flightContext,
            animation,
            flightDirection,
            fromHeroContext,
            toHeroContext,
          ) {
            Widget current;

            if (flightDirection == HeroFlightDirection.push) {
              current = toHeroContext.widget;
            } else {
              current = fromHeroContext.widget;
            }

            return AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                final newValue =
                    lerpDouble(0.0, 2 * pi, animation.value) ?? 0.0;

                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(newValue),
                  alignment: Alignment.center,
                  child: current,
                );
              },
            );
          },
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..translate(
                0.0,
                verticalFactor *
                    animation.value *
                    MediaQuery.sizeOf(context).height,
                depth * depthFactor,
              ),
            child: GestureDetector(
              onTap: () => onCardSelected(card),
              child: SizedBox(
                height: height,
                child: Card3DWidget(card: card),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// {@template ListOfCard}
/// List of cards in horizontal with title.
/// {@endtemplate}
class ListOfCard extends StatelessWidget {
  /// {@macro ListOfCard}
  const ListOfCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.all(12),
          child: Text(
            'Recentrly Played',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cards.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
              child: Card3DWidget(
                card: cards[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// {@template Card3DWidget}
/// Card 3D Widget.
/// {@endtemplate}

class Card3DWidget extends StatelessWidget {
  /// {@macro Card3DWidget}
  const Card3DWidget({
    required this.card,
    super.key,
  });

  /// The card with details.
  final Card3D card;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PhysicalModel(
        color: Colors.white,
        elevation: 10,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            card.image,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
