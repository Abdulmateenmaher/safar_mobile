import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_ps.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fa'),
    Locale('ps'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Safar'**
  String get appTitle;

  /// Welcome screen title
  ///
  /// In en, this message translates to:
  /// **'Welcome to Safar'**
  String get welcomeTitle;

  /// Welcome screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Discover the beauty of Afghanistan'**
  String get welcomeSubtitle;

  /// Get started button
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// Login button
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Register button
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// Email field label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Password field label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Confirm password field label
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// Forgot password link
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// Don't have account text
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// Already have account text
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// Or continue with text
  ///
  /// In en, this message translates to:
  /// **'Or continue with'**
  String get orContinueWith;

  /// Google sign in button
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get googleSignIn;

  /// Home tab label
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Search tab label
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Favorites tab label
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// Profile tab label
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Welcome back text
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// Explorer title
  ///
  /// In en, this message translates to:
  /// **'Explorer'**
  String get explorer;

  /// Popular places section title
  ///
  /// In en, this message translates to:
  /// **'Popular Places'**
  String get popularPlaces;

  /// All places section title
  ///
  /// In en, this message translates to:
  /// **'All Places'**
  String get allPlaces;

  /// See all button
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// Services section title
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// Hotels service
  ///
  /// In en, this message translates to:
  /// **'Hotels'**
  String get hotels;

  /// Restaurants service
  ///
  /// In en, this message translates to:
  /// **'Restaurants'**
  String get restaurants;

  /// ATMs service
  ///
  /// In en, this message translates to:
  /// **'ATMs'**
  String get atms;

  /// Medical service
  ///
  /// In en, this message translates to:
  /// **'Medical'**
  String get medical;

  /// Transport service
  ///
  /// In en, this message translates to:
  /// **'Transport'**
  String get transport;

  /// Banks service
  ///
  /// In en, this message translates to:
  /// **'Banks'**
  String get banks;

  /// Travel service
  ///
  /// In en, this message translates to:
  /// **'Travel'**
  String get travel;

  /// More services
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// Nearby services section
  ///
  /// In en, this message translates to:
  /// **'Nearby Services'**
  String get nearbyServices;

  /// Location label
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// Directions button
  ///
  /// In en, this message translates to:
  /// **'Directions'**
  String get directions;

  /// Reviews section title
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// Write review button
  ///
  /// In en, this message translates to:
  /// **'Write a Review'**
  String get writeReview;

  /// Review placeholder
  ///
  /// In en, this message translates to:
  /// **'Share your experience...'**
  String get shareYourExperience;

  /// Submit review button
  ///
  /// In en, this message translates to:
  /// **'Submit Review'**
  String get submitReview;

  /// Review submitted message
  ///
  /// In en, this message translates to:
  /// **'Review submitted!'**
  String get reviewSubmitted;

  /// About section title
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// Amenities section title
  ///
  /// In en, this message translates to:
  /// **'Amenities'**
  String get amenities;

  /// Menu section title
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// Rooms section title
  ///
  /// In en, this message translates to:
  /// **'Rooms'**
  String get rooms;

  /// Book now button
  ///
  /// In en, this message translates to:
  /// **'Book Now'**
  String get bookNow;

  /// Available status
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available;

  /// Unavailable status
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get unavailable;

  /// Open status
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// Closed status
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get closed;

  /// Featured badge
  ///
  /// In en, this message translates to:
  /// **'Featured'**
  String get featured;

  /// Price label
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// Contact section title
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// Settings title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Language setting
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Theme setting
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// Dark mode option
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// Light mode option
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// System mode option
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemMode;

  /// Notifications setting
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Privacy policy link
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// Terms of service link
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// Logout button
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Edit profile button
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// Save changes button
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// Search places placeholder
  ///
  /// In en, this message translates to:
  /// **'Search places...'**
  String get searchPlaces;

  /// Advanced filters title
  ///
  /// In en, this message translates to:
  /// **'Advanced Filters'**
  String get advancedFilters;

  /// Category filter
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// Distance filter
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get distance;

  /// Rating filter
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rating;

  /// Apply button
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// Clear button
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No results message
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResults;

  /// Suggested places section
  ///
  /// In en, this message translates to:
  /// **'Suggested Places'**
  String get suggestedPlaces;

  /// Recent searches section
  ///
  /// In en, this message translates to:
  /// **'Recent Searches'**
  String get recentSearches;

  /// Trending section
  ///
  /// In en, this message translates to:
  /// **'Trending'**
  String get trending;

  /// Views label
  ///
  /// In en, this message translates to:
  /// **'Views'**
  String get views;

  /// Saved label
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get saved;

  /// Shared label
  ///
  /// In en, this message translates to:
  /// **'Shared'**
  String get shared;

  /// Best time label
  ///
  /// In en, this message translates to:
  /// **'Best Time'**
  String get bestTime;

  /// WiFi amenity
  ///
  /// In en, this message translates to:
  /// **'WiFi'**
  String get wifi;

  /// Parking amenity
  ///
  /// In en, this message translates to:
  /// **'Parking'**
  String get parking;

  /// Pool amenity
  ///
  /// In en, this message translates to:
  /// **'Pool'**
  String get pool;

  /// Gym amenity
  ///
  /// In en, this message translates to:
  /// **'Gym'**
  String get gym;

  /// Spa amenity
  ///
  /// In en, this message translates to:
  /// **'Spa'**
  String get spa;

  /// Room service amenity
  ///
  /// In en, this message translates to:
  /// **'Room Service'**
  String get roomService;

  /// Air conditioning amenity
  ///
  /// In en, this message translates to:
  /// **'A/C'**
  String get airConditioning;

  /// Bar amenity
  ///
  /// In en, this message translates to:
  /// **'Bar'**
  String get bar;

  /// Laundry amenity
  ///
  /// In en, this message translates to:
  /// **'Laundry'**
  String get laundry;

  /// Per night label
  ///
  /// In en, this message translates to:
  /// **'/night'**
  String get perNight;

  /// Guests label
  ///
  /// In en, this message translates to:
  /// **'guests'**
  String get guests;
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
      <String>['en', 'fa', 'ps'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fa':
      return AppLocalizationsFa();
    case 'ps':
      return AppLocalizationsPs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
