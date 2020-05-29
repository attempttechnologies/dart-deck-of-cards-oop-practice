void main() {
  Deck deck = new Deck();
  print(deck);
  deck.removeCard('Diamonds', 'Two');
  print(deck);
}

class Deck {
  List<Card> cards = [];

  Deck() {
    List<String> suits = ['Diamonds', 'Hearts', 'Clubs', 'Spades'];
    List<String> ranks = ['Ace', 'Two', 'Three', 'Four', 'Five'];

    for (String suit in suits) {
      for (String rank in ranks) {
        Card card = new Card(suit: suit, rank: rank);
        this.cards.add(card);
      }
    }
  }

  toString() {
    return this.cards.toString();
  }

  shuffle() {
    return this.cards.shuffle();
  }

  cardsWithSuit(String suit) {
    return this.cards.where((card) => card.suit == suit);
  }

  deal(int handSize) {
    var hand = this.cards.sublist(0, handSize);
    this.cards = this.cards.sublist(handSize);
    return hand;
  }

  removeCard(String suit, String rank) {
    this
        .cards
        .removeWhere((card) => (card.suit == suit) && (card.rank == rank));
  }
}

class Card {
  Card({this.suit, this.rank});

  String suit;
  String rank;

  toString() {
    return '${this.rank} of ${this.suit}';
  }
}
