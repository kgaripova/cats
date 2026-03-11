import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'Cat Breeds'**
  String get appTitle;

  /// Bottom nav: breeds tab
  ///
  /// In en, this message translates to:
  /// **'Breeds'**
  String get navBreeds;

  /// Bottom nav: Favorites tab
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get navFavorites;

  /// Breed detail: origin label
  ///
  /// In en, this message translates to:
  /// **'Origin'**
  String get breedOrigin;

  /// Breed detail: temperament label
  ///
  /// In en, this message translates to:
  /// **'Temperament'**
  String get breedTemperament;

  /// Breed detail: life span label
  ///
  /// In en, this message translates to:
  /// **'Life span'**
  String get breedLifeSpan;

  /// Breed detail: weight label
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get breedWeight;

  /// Weight unit toggle: imperial
  ///
  /// In en, this message translates to:
  /// **'lbs'**
  String get breedWeightImperial;

  /// Weight unit toggle: metric
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get breedWeightMetric;

  /// Breed trait: adaptability
  ///
  /// In en, this message translates to:
  /// **'Adaptability'**
  String get breedAdaptability;

  /// Breed trait: affection level
  ///
  /// In en, this message translates to:
  /// **'Affection level'**
  String get breedAffectionLevel;

  /// Breed trait: energy level
  ///
  /// In en, this message translates to:
  /// **'Energy level'**
  String get breedEnergyLevel;

  /// Breed trait: intelligence
  ///
  /// In en, this message translates to:
  /// **'Intelligence'**
  String get breedIntelligence;

  /// Breed trait: social needs
  ///
  /// In en, this message translates to:
  /// **'Social needs'**
  String get breedSocialNeeds;

  /// Breed trait: child friendly
  ///
  /// In en, this message translates to:
  /// **'Child friendly'**
  String get breedChildFriendly;

  /// Breed trait: dog friendly
  ///
  /// In en, this message translates to:
  /// **'Dog friendly'**
  String get breedDogFriendly;

  /// Breed trait: stranger friendly
  ///
  /// In en, this message translates to:
  /// **'Stranger friendly'**
  String get breedStrangerFriendly;

  /// Add to Favorites tooltip
  ///
  /// In en, this message translates to:
  /// **'Add to favorites'**
  String get addToFavorites;

  /// Remove from Favorites tooltip
  ///
  /// In en, this message translates to:
  /// **'Remove from favorites'**
  String get removeFromFavorites;

  /// Empty Favorites screen message
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get favoritesEmpty;

  /// Empty Favorites screen hint
  ///
  /// In en, this message translates to:
  /// **'Tap the heart icon on any breed to save it here.'**
  String get favoritesEmptyHint;

  /// Error message when breeds fail to load
  ///
  /// In en, this message translates to:
  /// **'Failed to load breeds'**
  String get errorLoadingBreeds;

  /// Generic error message
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorGeneric;

  /// Retry button label
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Banner shown when app is offline
  ///
  /// In en, this message translates to:
  /// **'Offline – showing cached data'**
  String get offlineBanner;

  /// Message when add/remove Favorites is disabled offline
  ///
  /// In en, this message translates to:
  /// **'Sorry, favorites are unavailable in offline mode.'**
  String get offlineFavoritesUnavailable;

  /// Life span formatted with years unit
  ///
  /// In en, this message translates to:
  /// **'{years} years'**
  String lifeSpanYears(String years);

  /// Weight value with unit
  ///
  /// In en, this message translates to:
  /// **'{value} {unit}'**
  String weightValue(String value, String unit);

  /// Link to Wikipedia or breed website
  ///
  /// In en, this message translates to:
  /// **'Learn more'**
  String get learnMore;

  /// Hypoallergenic badge label
  ///
  /// In en, this message translates to:
  /// **'Hypoallergenic'**
  String get hypoallergenic;

  /// Rare breed badge label
  ///
  /// In en, this message translates to:
  /// **'Rare'**
  String get rare;

  /// Snackbar after successful vote
  ///
  /// In en, this message translates to:
  /// **'Vote recorded!'**
  String get voteSuccess;

  /// Snackbar after failed vote
  ///
  /// In en, this message translates to:
  /// **'Could not submit vote'**
  String get voteFailed;

  /// Placeholder when breed has no image
  ///
  /// In en, this message translates to:
  /// **'No image available'**
  String get noImageAvailable;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
