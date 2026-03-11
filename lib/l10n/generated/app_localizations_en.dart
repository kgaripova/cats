// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Cat Breeds';

  @override
  String get navBreeds => 'Breeds';

  @override
  String get navFavorites => 'Favorites';

  @override
  String get breedOrigin => 'Origin';

  @override
  String get breedTemperament => 'Temperament';

  @override
  String get breedLifeSpan => 'Life span';

  @override
  String get breedWeight => 'Weight';

  @override
  String get breedWeightImperial => 'lbs';

  @override
  String get breedWeightMetric => 'kg';

  @override
  String get breedAdaptability => 'Adaptability';

  @override
  String get breedAffectionLevel => 'Affection level';

  @override
  String get breedEnergyLevel => 'Energy level';

  @override
  String get breedIntelligence => 'Intelligence';

  @override
  String get breedSocialNeeds => 'Social needs';

  @override
  String get breedChildFriendly => 'Child friendly';

  @override
  String get breedDogFriendly => 'Dog friendly';

  @override
  String get breedStrangerFriendly => 'Stranger friendly';

  @override
  String get addToFavorites => 'Add to favorites';

  @override
  String get removeFromFavorites => 'Remove from favorites';

  @override
  String get favoritesEmpty => 'No favorites yet';

  @override
  String get favoritesEmptyHint =>
      'Tap the heart icon on any breed to save it here.';

  @override
  String get errorLoadingBreeds => 'Failed to load breeds';

  @override
  String get errorGeneric => 'Something went wrong';

  @override
  String get retry => 'Retry';

  @override
  String get offlineBanner => 'Offline – showing cached data';

  @override
  String get offlineFavoritesUnavailable =>
      'Sorry, favorites are unavailable in offline mode.';

  @override
  String lifeSpanYears(String years) {
    return '$years years';
  }

  @override
  String weightValue(String value, String unit) {
    return '$value $unit';
  }

  @override
  String get learnMore => 'Learn more';

  @override
  String get hypoallergenic => 'Hypoallergenic';

  @override
  String get rare => 'Rare';

  @override
  String get voteSuccess => 'Vote recorded!';

  @override
  String get voteFailed => 'Could not submit vote';

  @override
  String get noImageAvailable => 'No image available';
}
