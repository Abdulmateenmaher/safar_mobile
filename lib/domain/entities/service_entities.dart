import 'package:equatable/equatable.dart';

/// Hotel Entity
class HotelEntity extends Equatable {
  final String id;
  final Map<String, String> name;
  final Map<String, String> description;
  final Map<String, String> shortDescription;
  final List<String> images;
  final bool isFeatured;
  final bool isVerified;
  final double averageRating;
  final int reviewsCount;
  final bool hasWifi;
  final bool hasPool;
  final bool hasParking;
  final bool hasGym;
  final bool hasSpa;
  final int totalRooms;
  final double? latitude;
  final double? longitude;
  final bool isBookmarked;

  const HotelEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.shortDescription,
    required this.images,
    required this.isFeatured,
    required this.isVerified,
    required this.averageRating,
    required this.reviewsCount,
    required this.hasWifi,
    required this.hasPool,
    required this.hasParking,
    required this.hasGym,
    required this.hasSpa,
    required this.totalRooms,
    this.latitude,
    this.longitude,
    required this.isBookmarked,
  });

  String getName(String lang) => name[lang] ?? name['en'] ?? '';
  String getDescription(String lang) => description[lang] ?? description['en'] ?? '';

  @override
  List<Object?> get props => [id, name];
}

/// Restaurant Entity
class RestaurantEntity extends Equatable {
  final String id;
  final Map<String, String> name;
  final Map<String, String> description;
  final Map<String, String> cuisineType;
  final List<String> images;
  final bool isFeatured;
  final double averageRating;
  final int reviewsCount;
  final bool offersDelivery;
  final int seatingCapacity;
  final double? latitude;
  final double? longitude;
  final bool isBookmarked;

  const RestaurantEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.cuisineType,
    required this.images,
    required this.isFeatured,
    required this.averageRating,
    required this.reviewsCount,
    required this.offersDelivery,
    required this.seatingCapacity,
    this.latitude,
    this.longitude,
    required this.isBookmarked,
  });

  String getName(String lang) => name[lang] ?? name['en'] ?? '';
  String getCuisineType(String lang) => cuisineType[lang] ?? cuisineType['en'] ?? '';

  @override
  List<Object?> get props => [id, name];
}

/// ATM Entity
class AtmEntity extends Equatable {
  final String id;
  final Map<String, String> name;
  final Map<String, String>? bankName;
  final String? image;
  final bool isOperational;
  final bool is24Hours;
  final bool hasCash;
  final bool hasSecurityCamera;
  final double? latitude;
  final double? longitude;
  final String? address;
  final String? workingHours;

  const AtmEntity({
    required this.id,
    required this.name,
    this.bankName,
    this.image,
    required this.isOperational,
    required this.is24Hours,
    required this.hasCash,
    required this.hasSecurityCamera,
    this.latitude,
    this.longitude,
    this.address,
    this.workingHours,
  });

  String getName(String lang) => name[lang] ?? name['en'] ?? '';
  String getBankName(String lang) => bankName?[lang] ?? bankName?['en'] ?? '';

  @override
  List<Object?> get props => [id, name];
}

/// Hospital Entity
class HospitalEntity extends Equatable {
  final String id;
  final Map<String, String> name;
  final Map<String, String> description;
  final Map<String, String>? specialty;
  final List<String> images;
  final bool isOperational;
  final bool hasEmergency;
  final bool hasAmbulance;
  final bool hasPharmacy;
  final int bedCapacity;
  final double averageRating;
  final int reviewsCount;
  final double? latitude;
  final double? longitude;
  final bool isBookmarked;

  const HospitalEntity({
    required this.id,
    required this.name,
    required this.description,
    this.specialty,
    required this.images,
    required this.isOperational,
    required this.hasEmergency,
    required this.hasAmbulance,
    required this.hasPharmacy,
    required this.bedCapacity,
    required this.averageRating,
    required this.reviewsCount,
    this.latitude,
    this.longitude,
    required this.isBookmarked,
  });

  String getName(String lang) => name[lang] ?? name['en'] ?? '';
  String getDescription(String lang) => description[lang] ?? description['en'] ?? '';

  @override
  List<Object?> get props => [id, name];
}

/// Bank Entity
class BankEntity extends Equatable {
  final String id;
  final Map<String, String> name;
  final Map<String, String>? description;
  final List<String> images;
  final bool isOperational;
  final bool hasAtm;
  final bool hasForeignExchange;
  final String? workingHours;
  final String? address;
  final double? latitude;
  final double? longitude;

  const BankEntity({
    required this.id,
    required this.name,
    this.description,
    required this.images,
    required this.isOperational,
    required this.hasAtm,
    required this.hasForeignExchange,
    this.workingHours,
    this.address,
    this.latitude,
    this.longitude,
  });

  String getName(String lang) => name[lang] ?? name['en'] ?? '';

  @override
  List<Object?> get props => [id, name];
}
