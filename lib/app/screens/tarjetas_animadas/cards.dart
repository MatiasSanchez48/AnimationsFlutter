/// {@template Card3D}
/// Model for a 3D card.
/// {@endtemplate}
class Card3D {
  /// {@macro Card3D}
  const Card3D({
    required this.title,
    required this.author,
    required this.image,
  });

  /// The title of the card.
  final String title;

  /// The author of the card.
  final String author;

  /// The image of the card.
  final String image;
}

/// List of cards hardcoded.
List<Card3D> cards = [
  const Card3D(
    title: 'Blue neighbourhood',
    author: 'Troye Sivan',
    image: 'https://picsum.photos/401/300',
  ),
  const Card3D(
    title: 'The Scape',
    author: 'Staxxx',
    image: 'https://picsum.photos/402/300',
  ),
  const Card3D(
    title: 'Perfect',
    author: 'Ed Sheran',
    image: 'https://picsum.photos/403/300',
  ),
  const Card3D(
    title: 'Pain',
    author: 'Ryan jones',
    image: 'https://picsum.photos/404/300',
  ),
  const Card3D(
    title: 'Bohemian Rhapsodyy',
    author: 'Queen',
    image: 'https://picsum.photos/400/300',
  ),
];
