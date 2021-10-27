class Fish {
  final String name;
  final String facts;
  String get imageUrl => 'assets/images/' + name.replaceAll(' ', '') + ".png";
  String get bigPicture =>
      'assets/images/Big' + name.replaceAll(' ', '') + ".png";

  const Fish(this.name, this.facts);
}

const List<Fish> fishes = [
  Fish('Brown Jelly Fish',
      'Brown Jellyfish are widespread in oceans and estuaries in the IndoPacific, in the tropical western Atlantic and in the eastern Pacific(2). They occur in Australian water from north Queensland through the south-east to the south-west. They occur in the Swan Canning Riverpark, but not other estuaries along the west coast. Although they are able to move by making pulsing movements, ocean currents and ship movements have a big influence on their distribution. They are thought to have been introduced into the Swan Canning Riverpark by ships that serviced the Swan River colony between 1829 and 18372. However, the southward movement of jellyfish with the Leeuwin Current is also a plausible explanation for their presence here.'),
  Fish(
      'Gold Fish',
      'The goldfish is a freshwater fish in the family Cyprinidae of order Cypriniformes. '
          'It is commonly kept as a pet in indoor aquariums, and is one of the most popular aquarium fish. '
          'Goldfish released into the wild have become an invasive pest in parts of North America. '),
  Fish('White Gold Fish',
      'Goldfish are a hardy aquatic species.They can deal with temperature fluctuations, changes in pH, cloudy water, and even low dissolved oxygen levels. released into the wild, goldfish can group up into what’s called a school. But they don’t need companions to be happy in captivity and are fine if kept separately in a tank.')
];
