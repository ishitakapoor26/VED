class Place{
  String title;
  String imageUrl;
  double height;

  Place(this.title, this.imageUrl, this.height);

  static List<Place> generatePlaces() {
    return [
      Place('Concepts & Explanations', 'assets/concept2-removebg-preview.png', 280),
      Place('Study Material','assets/read-removebg-preview.png',260),
      Place('Practice', 'assets/practice3-removebg-preview.png', 230),
      Place('Test Yourself', 'assets/test yourself.png', 240),
    ];
  }
}