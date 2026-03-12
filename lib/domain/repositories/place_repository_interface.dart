import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../entities/place_entity.dart';
import '../entities/service_entities.dart';
import '../entities/user_entity.dart';

/// Place Repository Interface
abstract class PlaceRepository {
  /// Get all places with language
  Future<Either<Failure, List<PlaceEntity>>> getPlaces(String lang);
  
  /// Get place details by ID
  Future<Either<Failure, PlaceEntity>> getPlaceDetails(String lang, String id);
  
  /// Get featured/popular places
  Future<Either<Failure, List<PlaceEntity>>> getFeaturedPlaces(String lang);
  
  /// Get nearby places
  Future<Either<Failure, List<PlaceEntity>>> getNearbyPlaces(
    String lang,
    double latitude,
    double longitude,
    double radius,
  );
  
  /// Get places by category
  Future<Either<Failure, List<PlaceEntity>>> getPlacesByCategory(
    String lang,
    String categoryId,
  );
  
  /// Search places
  Future<Either<Failure, List<PlaceEntity>>> searchPlaces(
    String lang,
    String query, {
    String? categoryId,
    double? minRating,
    double? maxDistance,
  });
  
  /// Get categories
  Future<Either<Failure, List<CategoryEntity>>> getCategories(String lang);
  
  /// Toggle bookmark
  Future<Either<Failure, bool>> toggleBookmark(String placeId);
  
  /// Get bookmarks
  Future<Either<Failure, List<PlaceEntity>>> getBookmarks(String lang);
  
  /// Create review
  Future<Either<Failure, ReviewEntity>> createReview({
    required String placeId,
    required double rating,
    required String comment,
  });
  
  /// Get reviews
  Future<Either<Failure, List<ReviewEntity>>> getReviews(String placeId);
}

/// Service Repository Interface
abstract class ServiceRepository {
  /// Get hotels
  Future<Either<Failure, List<HotelEntity>>> getHotels(String lang);
  
  /// Get hotel details
  Future<Either<Failure, HotelEntity>> getHotelDetails(String lang, String id);
  
  /// Get restaurants
  Future<Either<Failure, List<RestaurantEntity>>> getRestaurants(String lang);
  
  /// Get restaurant details
  Future<Either<Failure, RestaurantEntity>> getRestaurantDetails(String lang, String id);
  
  /// Get ATMs
  Future<Either<Failure, List<AtmEntity>>> getAtms(String lang);
  
  /// Get ATM details
  Future<Either<Failure, AtmEntity>> getAtmDetails(String lang, String id);
  
  /// Get hospitals
  Future<Either<Failure, List<HospitalEntity>>> getHospitals(String lang);
  
  /// Get hospital details
  Future<Either<Failure, HospitalEntity>> getHospitalDetails(String lang, String id);
  
  /// Get travel agencies
  // Future<Either<Failure, List<TravelAgencyEntity>>> getTravelAgencies(String lang);
  
  /// Get travel agency details
  // Future<Either<Failure, TravelAgencyEntity>> getTravelAgencyDetails(String lang, String id);
  
  /// Get nearby services
  Future<Either<Failure, Map<String, List<dynamic>>>> getNearbyServices(
    String lang,
    double latitude,
    double longitude,
    double radius,
  );
}

/// Auth Repository Interface
abstract class AuthRepository {
  /// Login with email and password
  Future<Either<Failure, AuthResultEntity>> login(String email, String password);
  
  /// Register new user
  Future<Either<Failure, AuthResultEntity>> register({
    required String name,
    required String email,
    required String password,
  });
  
  /// Login with Google
  Future<Either<Failure, AuthResultEntity>> googleLogin(String idToken);
  
  /// Login with Firebase
  Future<Either<Failure, AuthResultEntity>> firebaseLogin(String firebaseToken);
  
  /// Logout
  Future<Either<Failure, void>> logout();
  
  /// Get current user
  Future<Either<Failure, UserEntity>> getCurrentUser();
  
  /// Update profile
  Future<Either<Failure, UserEntity>> updateProfile({
    String? name,
    String? username,
    String? phone,
    String? bio,
  });
  
  /// Update password
  Future<Either<Failure, void>> updatePassword({
    required String currentPassword,
    required String newPassword,
  });
  
  /// Update profile image
  Future<Either<Failure, String>> updateProfileImage(String imagePath);
  
  /// Check if logged in
  Future<bool> isLoggedIn();
  
  /// Get auth token
  Future<String?> getAuthToken();
}

/// Notification Repository Interface
abstract class NotificationRepository {
  /// Get notifications
  Future<Either<Failure, List<NotificationEntity>>> getNotifications(String lang);
  
  /// Get unread count
  Future<Either<Failure, int>> getUnreadCount();
  
  /// Mark as read
  Future<Either<Failure, void>> markAsRead(String notificationId);
  
  /// Mark all as read
  Future<Either<Failure, void>> markAllAsRead();
  
  /// Delete notification
  Future<Either<Failure, void>> deleteNotification(String notificationId);
}

/// Search Repository Interface
abstract class SearchRepository {
  /// Search all
  Future<Either<Failure, Map<String, dynamic>>> search(
    String lang,
    String query, {
    String? type,
    double? latitude,
    double? longitude,
    double? radius,
    int? page,
    int? limit,
  });
  
  /// Get filters
  Future<Either<Failure, Map<String, dynamic>>> getFilters(String lang);
}

/// User Profile Repository Interface
abstract class UserProfileRepository {
  /// Get profile
  Future<Either<Failure, UserEntity>> getProfile();
  
  /// Update profile
  Future<Either<Failure, UserEntity>> updateProfile({
    String? name,
    String? username,
    String? phone,
    String? bio,
  });
  
  /// Update password
  Future<Either<Failure, void>> updatePassword({
    required String currentPassword,
    required String newPassword,
  });
  
  /// Update image
  Future<Either<Failure, String>> updateImage(String imagePath);
  
  /// Get review count
  Future<Either<Failure, int>> getReviewCount();
  
  /// Get wishlist count
  Future<Either<Failure, int>> getWishlistCount();
}
