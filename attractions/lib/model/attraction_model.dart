class AttractionModel {
  final int id;
  final String placeName;
  final String description;
  final String category;
  final String city;
  final int price;
  final double lattitude;
  final double longtitude;
  final String openHour;
  final String closeHour;
  final double placeRating;
  final String fasilities;
  final String contactPerson;
  final String picture;

  AttractionModel({
    required this.id,
    required this.placeName,
    required this.description,
    required this.category,
    required this.city,
    required this.price,
    required this.lattitude,
    required this.longtitude,
    required this.openHour,
    required this.closeHour,
    required this.placeRating,
    required this.fasilities,
    required this.contactPerson,
    required this.picture,
  });
}