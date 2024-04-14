class Attraction {
  final String name;
  final String imageUrl;
  final String address;
  final String visitingHours;
  final String directions;
  final double latitude;
  final double longitude;
  final String placeId;
  String description; // Make this non-final if it needs to be updated

  Attraction({
    required this.name,
    this.description = 'Loading description...',
    required this.imageUrl,
    required this.address,
    required this.visitingHours,
    required this.directions,
    required this.latitude,
    required this.longitude,
    required this.placeId,
  });
}
