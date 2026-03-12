import 'package:equatable/equatable.dart';

/// Place Entity - Tourism Places
class PlaceEntity extends Equatable {
  final String id;
  final Map<String, String> name;
  final Map<String, String> slug;
  final Map<String, String> location;
  final Map<String, String> description;
  final Map<String, String> shortDescription;
  final Map<String, String> historicalBackground;
  final Map<String, String> culturalInsights;
  final List<Map<String, String>> highlights;
  final String? videoUrl;
  final List<Map<String, String>> visitorTips;
  final Map<String, String> whatToExpect;
  final List<String> images;
  final double entryFee;
  final int dailyVisitorLimit;
  final bool hasGuide;
  final bool isFamilyFriendly;
  final bool isFeatured;
  final bool isActive;
  final Map<String, String> bestTimeToVisit;
  final bool hasWifi;
  final bool hasParking;
  final bool hasPaidParking;
  final int viewsCount;
  final int bookmarksCount;
  final int sharesCount;
  final String? categoryId;
  final CoordinateEntity? coordinate;
  final OperatingHourEntity? operatingHour;
  final ContactInfoEntity? contactInfo;
  final double averageRating;
  final int reviewsCount;
  final bool isBookmarked;

  const PlaceEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.location,
    required this.description,
    required this.shortDescription,
    required this.historicalBackground,
    required this.culturalInsights,
    required this.highlights,
    this.videoUrl,
    required this.visitorTips,
    required this.whatToExpect,
    required this.images,
    required this.entryFee,
    required this.dailyVisitorLimit,
    required this.hasGuide,
    required this.isFamilyFriendly,
    required this.isFeatured,
    required this.isActive,
    required this.bestTimeToVisit,
    required this.hasWifi,
    required this.hasParking,
    required this.hasPaidParking,
    required this.viewsCount,
    required this.bookmarksCount,
    required this.sharesCount,
    this.categoryId,
    this.coordinate,
    this.operatingHour,
    this.contactInfo,
    required this.averageRating,
    required this.reviewsCount,
    required this.isBookmarked,
  });

  String getName(String lang) => name[lang] ?? name['en'] ?? '';
  String getLocation(String lang) => location[lang] ?? location['en'] ?? '';
  String getDescription(String lang) => description[lang] ?? description['en'] ?? '';
  String getShortDescription(String lang) => shortDescription[lang] ?? shortDescription['en'] ?? '';

  @override
  List<Object?> get props => [id, name, slug, location];
}

/// Coordinate Entity - Location
class CoordinateEntity extends Equatable {
  final String id;
  final double latitude;
  final double longitude;
  final Map<String, String> address;
  final String? city;
  final String? country;
  final String? postalCode;

  const CoordinateEntity({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.address,
    this.city,
    this.country,
    this.postalCode,
  });

  String getAddress(String lang) => address[lang] ?? address['en'] ?? '';

  @override
  List<Object?> get props => [id, latitude, longitude];
}

/// Operating Hours Entity
class OperatingHourEntity extends Equatable {
  final String id;
  final Map<String, String>? monday;
  final Map<String, String>? tuesday;
  final Map<String, String>? wednesday;
  final Map<String, String>? thursday;
  final Map<String, String>? friday;
  final Map<String, String>? saturday;
  final Map<String, String>? sunday;
  final String? timezone;
  final bool is24Hours;

  const OperatingHourEntity({
    required this.id,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
    this.timezone,
    required this.is24Hours,
  });

  @override
  List<Object?> get props => [id, is24Hours];
}

/// Contact Info Entity
class ContactInfoEntity extends Equatable {
  final String id;
  final String? primaryPhone;
  final String? secondaryPhone;
  final String? whatsapp;
  final String? email;
  final String? website;
  final String? facebook;
  final String? instagram;
  final String? twitter;
  final String? linkedin;
  final String? youtube;
  final String? tiktok;

  const ContactInfoEntity({
    required this.id,
    this.primaryPhone,
    this.secondaryPhone,
    this.whatsapp,
    this.email,
    this.website,
    this.facebook,
    this.instagram,
    this.twitter,
    this.linkedin,
    this.youtube,
    this.tiktok,
  });

  @override
  List<Object?> get props => [id, primaryPhone, email];
}

/// Category Entity
class CategoryEntity extends Equatable {
  final String id;
  final Map<String, String> name;
  final Map<String, String> description;
  final String? icon;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.description,
    this.icon,
  });

  String getName(String lang) => name[lang] ?? name['en'] ?? '';
  String getDescription(String lang) => description[lang] ?? description['en'] ?? '';

  @override
  List<Object?> get props => [id, name];
}
