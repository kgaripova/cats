import 'package:cats/data/models/breed_model.dart';

class FavoriteBreedItem {
  const FavoriteBreedItem({
    required this.favoriteId,
    required this.imageId,
    required this.breed,
  });

  final int favoriteId;
  final String imageId;
  final BreedModel breed;

  Map<String, dynamic> toJson() {
    return {
      'favoriteId': favoriteId,
      'imageId': imageId,
      'breed': breed.toJson(),
    };
  }

  factory FavoriteBreedItem.fromJson(Map<String, dynamic> json) {
    return FavoriteBreedItem(
      favoriteId: (json['favoriteId'] ?? json['favouriteId']) as int,
      imageId: json['imageId'] as String,
      breed: BreedModel.fromJson(json['breed'] as Map<String, dynamic>),
    );
  }
}
