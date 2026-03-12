import 'package:equatable/equatable.dart';

/// User Entity
class UserEntity extends Equatable {
  final String id;
  final String? name;
  final String? username;
  final String? email;
  final String? phone;
  final String? image;
  final String? bio;
  final bool isVerified;
  final DateTime? createdAt;
  final int reviewCount;
  final int wishlistCount;

  const UserEntity({
    required this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.image,
    this.bio,
    required this.isVerified,
    this.createdAt,
    required this.reviewCount,
    required this.wishlistCount,
  });

  @override
  List<Object?> get props => [id, email];
}

/// Auth Result Entity
class AuthResultEntity extends Equatable {
  final UserEntity user;
  final String token;
  final String? refreshToken;

  const AuthResultEntity({
    required this.user,
    required this.token,
    this.refreshToken,
  });

  @override
  List<Object?> get props => [user, token];
}

/// Review Entity
class ReviewEntity extends Equatable {
  final String id;
  final String? userId;
  final String? userName;
  final String? userImage;
  final Map<String, String>? comment;
  final double rating;
  final bool isVerified;
  final bool isApproved;
  final bool isFeatured;
  final DateTime? visitDate;
  final String? deviceType;
  final DateTime createdAt;

  const ReviewEntity({
    required this.id,
    this.userId,
    this.userName,
    this.userImage,
    this.comment,
    required this.rating,
    required this.isVerified,
    required this.isApproved,
    required this.isFeatured,
    this.visitDate,
    this.deviceType,
    required this.createdAt,
  });

  String getComment(String lang) => comment?[lang] ?? comment?['en'] ?? '';

  @override
  List<Object?> get props => [id, userId, rating];
}

/// Notification Entity
class NotificationEntity extends Equatable {
  final String id;
  final String title;
  final String body;
  final String? imageUrl;
  final String? type;
  final String? dataId;
  final bool isRead;
  final DateTime createdAt;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.body,
    this.imageUrl,
    this.type,
    this.dataId,
    required this.isRead,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, isRead, createdAt];
}

/// Bookmark Entity
class BookmarkEntity extends Equatable {
  final String id;
  final String userId;
  final String bookmarkableType;
  final String bookmarkableId;
  final DateTime createdAt;

  const BookmarkEntity({
    required this.id,
    required this.userId,
    required this.bookmarkableType,
    required this.bookmarkableId,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, bookmarkableType, bookmarkableId];
}
