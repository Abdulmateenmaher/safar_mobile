import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';

class ServiceDetailScreen extends StatefulWidget {
  final String serviceId;
  final String serviceType; // 'hotel', 'restaurant', 'atm', 'hospital', 'agency', 'bank'

  const ServiceDetailScreen({
    super.key,
    required this.serviceId,
    required this.serviceType,
  });

  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  int _currentImageIndex = 0;

  // Mock data for hotels/services
  final Map<String, dynamic> _serviceData = {
    'id': 'h1',
    'name': 'Bamyan Luxury Hotel',
    'type': 'hotel',
    'location': 'Bamyan Province, Afghanistan',
    'description': 'Experience luxury in the heart of Afghanistan. Our hotel offers world-class amenities, stunning mountain views, and exceptional service.',
    'short_description': '5-star luxury hotel with mountain views',
    'address': 'Main Road, Bamyan City',
    'phone': '+93 123 456 789',
    'email': 'info@bamyanhotel.af',
    'website': 'www.bamyanhotel.af',
    'price_range': '\$150-300',
    'check_in': '14:00',
    'check_out': '12:00',
    'is_bookmarked': false,
    'is_featured': true,
    'is_operational': true,
    'average_rating': 4.7,
    'total_reviews': 328,
    'views_count': 5200,
    'bookmarks_count': 450,
    'shares_count': 180,
    'images': [
      'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?q=80&w=800',
      'https://images.unsplash.com/photo-1566073771259-6a8506099945?q=80&w=800',
      'https://images.unsplash.com/photo-1582719508461-905c673771fd?q=80&w=800',
    ],
    // Flags/Amenities
    'flags': {
      'has_wifi': true,
      'has_parking': true,
      'has_pool': true,
      'has_gym': true,
      'has_spa': true,
      'has_restaurant': true,
      'has_room_service': true,
      'has_air_conditioning': true,
      'has_bar': true,
      'has_concierge': true,
      'has_laundry': true,
      'has_meeting_room': true,
      'pets_allowed': false,
      'smoking_allowed': false,
    },
    // Foods
    'foods': [
      {
        'id': 'f1',
        'name': 'Kabuli Pulao',
        'description': 'Traditional Afghan rice dish with lamb, carrots, and raisins',
        'price': '\$25',
        'image': 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=400',
        'is_available': true,
        'category': 'Main Course',
      },
      {
        'id': 'f2',
        'name': 'Mantu Dumplings',
        'description': 'Steamed dumplings filled with spiced lamb and onions',
        'price': '\$15',
        'image': 'https://images.unsplash.com/photo-1496116218417-1a781b1c416c?q=80&w=400',
        'is_available': true,
        'category': 'Appetizer',
      },
      {
        'id': 'f3',
        'name': 'Afghan Kebabs',
        'description': 'Grilled skewers of marinated lamb or chicken',
        'price': '\$20',
        'image': 'https://images.unsplash.com/photo-1603360946369-dc9bb6258143?q=80&w=400',
        'is_available': true,
        'category': 'Main Course',
      },
    ],
    // Rooms
    'rooms': [
      {
        'id': 'r1',
        'name': 'Deluxe Mountain View',
        'description': 'Spacious room with stunning mountain views, king bed, and modern amenities',
        'price_per_night': '\$150',
        'capacity': 2,
        'bed_type': 'King',
        'size': '45 sqm',
        'image': 'https://images.unsplash.com/photo-1590490360182-c33d57733427?q=80&w=400',
        'amenities': ['WiFi', 'TV', 'Mini Bar', 'Safe', 'Air Conditioning'],
        'is_available': true,
      },
      {
        'id': 'r2',
        'name': 'Executive Suite',
        'description': 'Luxurious suite with separate living area, panoramic views, and premium amenities',
        'price_per_night': '\$250',
        'capacity': 3,
        'bed_type': 'King + Sofa',
        'size': '75 sqm',
        'image': 'https://images.unsplash.com/photo-1587985064135-0366536eab42?q=80&w=400',
        'amenities': ['WiFi', 'TV', 'Mini Bar', 'Safe', 'Air Conditioning', 'Jacuzzi', 'Butler Service'],
        'is_available': true,
      },
      {
        'id': 'r3',
        'name': 'Presidential Suite',
        'description': 'Ultimate luxury with multiple rooms, private terrace, and exclusive services',
        'price_per_night': '\$500',
        'capacity': 4,
        'bed_type': '2 King Beds',
        'size': '150 sqm',
        'image': 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?q=80&w=400',
        'amenities': ['WiFi', 'TV', 'Mini Bar', 'Safe', 'Air Conditioning', 'Jacuzzi', 'Private Pool', 'Chef Service'],
        'is_available': false,
      },
    ],
    'coordinate': {
      'latitude': 34.8186,
      'longitude': 67.8292,
    },
    'reviews': [
      {'user': 'Ahmed Khan', 'rating': 5.0, 'comment': 'Amazing hotel with breathtaking views!', 'created_at': '2024-01-15'},
      {'user': 'Sarah Johnson', 'rating': 4.5, 'comment': 'Great service and comfortable rooms.', 'created_at': '2024-01-10'},
      {'user': 'Michael Chen', 'rating': 4.8, 'comment': 'Best hotel in Bamyan. Highly recommended!', 'created_at': '2024-01-05'},
    ],
  };

  IconData _getServiceTypeIcon() {
    switch (widget.serviceType) {
      case 'hotel': return Icons.hotel;
      case 'restaurant': return Icons.restaurant;
      case 'atm': return Icons.atm;
      case 'hospital': return Icons.local_hospital;
      case 'agency': return Icons.flight;
      case 'bank': return Icons.account_balance;
      default: return Icons.place;
    }
  }

  Color _getServiceTypeColor() {
    switch (widget.serviceType) {
      case 'hotel': return AppColors.neonPurple;
      case 'restaurant': return AppColors.neonOrange;
      case 'atm': return AppColors.neonBlue;
      case 'hospital': return AppColors.neonRose;
      case 'agency': return AppColors.neonEmerald;
      case 'bank': return AppColors.neonCyan;
      default: return AppColors.neonBlue;
    }
  }

  String _getServiceTypeName() {
    switch (widget.serviceType) {
      case 'hotel': return 'Hotel';
      case 'restaurant': return 'Restaurant';
      case 'atm': return 'ATM';
      case 'hospital': return 'Hospital';
      case 'agency': return 'Travel Agency';
      case 'bank': return 'Bank';
      default: return 'Service';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final images = _serviceData['images'] as List<dynamic>;
    final serviceColor = _getServiceTypeColor();

    return Scaffold(
      backgroundColor: isDark ? AppColors.obsidian : AppColors.offWhite,
      body: CustomScrollView(
        slivers: [
          // Image Slider with Glass AppBar
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            pinned: true,
            stretch: true,
            backgroundColor: AppColors.obsidian,
            leading: Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.4),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.4),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                ),
                child: IconButton(
                  icon: Icon(
                    _serviceData['is_bookmarked'] == true ? Icons.favorite : Icons.favorite_border,
                    color: _serviceData['is_bookmarked'] == true ? AppColors.neonRose : Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.4),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                ),
                child: IconButton(
                  icon: const Icon(Icons.share, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.5,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() => _currentImageIndex = index);
                      },
                    ),
                    items: images.map<Widget>((imageUrl) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(imageUrl.toString()),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  // Glass Gradient Overlay
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            AppColors.obsidian.withValues(alpha: 0.3),
                            AppColors.obsidian.withValues(alpha: 0.9),
                          ],
                          stops: const [0.0, 0.4, 0.7, 1.0],
                        ),
                      ),
                    ),
                  ),
                  // Image Indicators
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: images.asMap().entries.map<Widget>((entry) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: _currentImageIndex == entry.key ? 24 : 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: _currentImageIndex == entry.key
                                ? serviceColor
                                : Colors.white.withValues(alpha: 0.5),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  // Service Type Badge
                  Positioned(
                    top: 100,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: serviceColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: serviceColor.withValues(alpha: 0.5),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(_getServiceTypeIcon(), color: Colors.white, size: 14),
                          const SizedBox(width: 4),
                          Text(
                            _getServiceTypeName(),
                            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Operational Status
                  Positioned(
                    top: 100,
                    left: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: _serviceData['is_operational'] == true
                            ? AppColors.neonEmerald
                            : AppColors.neonRose,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withValues(alpha: 0.5),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _serviceData['is_operational'] == true ? 'Open' : 'Closed',
                            style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Service Info Section
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.charcoal.withValues(alpha: 0.9),
                    AppColors.darkBlack.withValues(alpha: 0.95),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: serviceColor.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: serviceColor.withValues(alpha: 0.5)),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(_getServiceTypeIcon(), color: serviceColor, size: 14),
                                  const SizedBox(width: 4),
                                  Text(
                                    _getServiceTypeName(),
                                    style: TextStyle(color: serviceColor, fontSize: 12, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: AppColors.neonBlue.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.star, color: AppColors.neonYellow, size: 18),
                                  const SizedBox(width: 4),
                                  Text(
                                    _serviceData['average_rating'].toString(),
                                    style: const TextStyle(color: AppColors.neonYellow, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '(${_serviceData['total_reviews']})',
                                    style: const TextStyle(color: AppColors.silver, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _serviceData['name'] ?? '',
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: serviceColor, size: 16),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                _serviceData['location'] ?? '',
                                style: const TextStyle(color: AppColors.silver, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        if (_serviceData['price_range'] != null) ...[
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.attach_money, color: AppColors.neonEmerald, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                'Price: ${_serviceData['price_range']}',
                                style: const TextStyle(color: AppColors.neonEmerald, fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),

                  // Stats Row
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.glassWhite,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.glassBorder),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStat(Icons.visibility, '${_serviceData['views_count']}', 'Views'),
                        _buildStat(Icons.bookmark, '${_serviceData['bookmarks_count']}', 'Saved'),
                        _buildStat(Icons.share, '${_serviceData['shares_count']}', 'Shared'),
                      ],
                    ),
                  ),

                  // Description
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('About', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                        const SizedBox(height: 12),
                        Text(
                          _serviceData['description'] ?? '',
                          style: const TextStyle(color: AppColors.silver, height: 1.6, fontSize: 14),
                        ),
                      ],
                    ),
                  ),

                  // Contact Info
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Contact', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                        const SizedBox(height: 12),
                        _buildContactRow(Icons.phone, _serviceData['phone'] ?? ''),
                        const SizedBox(height: 8),
                        _buildContactRow(Icons.email, _serviceData['email'] ?? ''),
                        const SizedBox(height: 8),
                        _buildContactRow(Icons.language, _serviceData['website'] ?? ''),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Amenities/Flags Section
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.charcoal,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: AppColors.primaryGradient,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.flag, color: Colors.white, size: 20),
                        ),
                        const SizedBox(width: 12),
                        const Text('Amenities', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _buildAmenityChips(),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Food Menu Section (for hotels/restaurants)
          if (widget.serviceType == 'hotel' || widget.serviceType == 'restaurant')
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.neonOrange.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.restaurant_menu, color: AppColors.neonOrange, size: 20),
                        ),
                        const SizedBox(width: 12),
                        Text('Menu (${_serviceData['foods'].length} items)', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: (_serviceData['foods'] as List).length,
                      itemBuilder: (context, index) {
                        final food = _serviceData['foods'][index];
                        return _buildFoodCard(food);
                      },
                    ),
                  ),
                ],
              ),
            ),

          // Rooms Section (for hotels)
          if (widget.serviceType == 'hotel')
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.neonPurple.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.bed, color: AppColors.neonPurple, size: 20),
                        ),
                        const SizedBox(width: 12),
                        Text('Rooms (${_serviceData['rooms'].length})', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                      ],
                    ),
                  ),
                  ...(_serviceData['rooms'] as List).map<Widget>((room) {
                    return _buildRoomCard(room);
                  }).toList(),
                ],
              ),
            ),

          // Map Section
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.charcoal,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.neonEmerald.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.map, color: AppColors.neonEmerald, size: 20),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(child: Text('Location', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white))),
                        const SizedBox(width: 8),
                        Container(
                          width: 120,
                          height: 36,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.directions, size: 16),
                            label: const Text('Directions', style: TextStyle(fontSize: 12)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.neonEmerald,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 180,
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    decoration: BoxDecoration(
                      color: AppColors.darkGray,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.glassBorder),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppColors.neonEmerald.withValues(alpha: 0.1),
                                  AppColors.neonBlue.withValues(alpha: 0.1),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on, color: serviceColor, size: 50),
                                const SizedBox(height: 8),
                                Text(
                                  '${_serviceData['coordinate']['latitude']}, ${_serviceData['coordinate']['longitude']}',
                                  style: const TextStyle(color: AppColors.silver),
                                ),
                                Text(
                                  _serviceData['address'] ?? '',
                                  style: const TextStyle(color: AppColors.silver, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Reviews Section
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.charcoal,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.neonRose.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.rate_review, color: AppColors.neonRose, size: 20),
                        ),
                        const SizedBox(width: 12),
                        Text('Reviews (${_serviceData['reviews'].length})', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                      ],
                    ),
                  ),
                  ...(_serviceData['reviews'] as List).map<Widget>((review) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.darkGray,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: serviceColor.withValues(alpha: 0.2),
                                backgroundImage: const CachedNetworkImageProvider(
                                  'https://api.dicebear.com/7.x/avataaars/svg?seed=Sharif',
                                ),
                                child: Text(
                                  (review['user'] as String?)?.substring(0, 1).toUpperCase() ?? 'U',
                                  style: TextStyle(color: serviceColor, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(review['user'] ?? 'User', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                    Text(review['created_at'] ?? '', style: const TextStyle(color: AppColors.silver, fontSize: 12)),
                                  ],
                                ),
                              ),
                              RatingBarIndicator(
                                rating: (review['rating'] as num?)?.toDouble() ?? 0,
                                itemBuilder: (context, _) => const Icon(Icons.star, color: AppColors.neonYellow),
                                itemCount: 5,
                                itemSize: 16,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(review['comment'] ?? '', style: const TextStyle(color: AppColors.silver, height: 1.5)),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),

          // Write Review Button
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: () => _showWriteReviewDialog(context, serviceColor),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: serviceColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.edit),
                      const SizedBox(width: 8),
                      const Text('Write a Review', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildStat(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: AppColors.neonBlue, size: 20),
        const SizedBox(height: 4),
        Text(value.isNotEmpty ? value : '-', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
        Text(label, style: const TextStyle(color: AppColors.silver, fontSize: 10)),
      ],
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppColors.neonBlue, size: 16),
        const SizedBox(width: 8),
        Expanded(
          child: Text(text, style: const TextStyle(color: AppColors.silver, fontSize: 14)),
        ),
      ],
    );
  }

  List<Widget> _buildAmenityChips() {
    final flags = _serviceData['flags'] as Map<String, dynamic>;
    final amenityMap = {
      'has_wifi': {'label': 'WiFi', 'icon': Icons.wifi, 'color': AppColors.neonBlue},
      'has_parking': {'label': 'Parking', 'icon': Icons.local_parking, 'color': AppColors.neonEmerald},
      'has_pool': {'label': 'Pool', 'icon': Icons.pool, 'color': AppColors.neonCyan},
      'has_gym': {'label': 'Gym', 'icon': Icons.fitness_center, 'color': AppColors.neonOrange},
      'has_spa': {'label': 'Spa', 'icon': Icons.spa, 'color': AppColors.neonPurple},
      'has_restaurant': {'label': 'Restaurant', 'icon': Icons.restaurant, 'color': AppColors.neonRose},
      'has_room_service': {'label': 'Room Service', 'icon': Icons.room_service, 'color': AppColors.neonYellow},
      'has_air_conditioning': {'label': 'A/C', 'icon': Icons.ac_unit, 'color': AppColors.neonBlue},
      'has_bar': {'label': 'Bar', 'icon': Icons.local_bar, 'color': AppColors.neonPurple},
      'has_concierge': {'label': 'Concierge', 'icon': Icons.support_agent, 'color': AppColors.neonEmerald},
      'has_laundry': {'label': 'Laundry', 'icon': Icons.local_laundry_service, 'color': AppColors.neonOrange},
      'has_meeting_room': {'label': 'Meeting Room', 'icon': Icons.meeting_room, 'color': AppColors.neonCyan},
      'pets_allowed': {'label': 'Pets', 'icon': Icons.pets, 'color': AppColors.neonRose},
      'smoking_allowed': {'label': 'Smoking', 'icon': Icons.smoking_rooms, 'color': AppColors.neonRose},
    };

    final chips = <Widget>[];
    amenityMap.forEach((key, value) {
      if (flags[key] == true) {
        chips.add(_buildAmenityChip(
          value['label'] as String,
          value['icon'] as IconData,
          value['color'] as Color,
        ));
      }
    });
    return chips;
  }

  Widget _buildAmenityChip(String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildFoodCard(dynamic food) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.charcoal, AppColors.darkBlack],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.neonOrange.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  color: AppColors.neonOrange.withValues(alpha: 0.2),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: CachedNetworkImage(
                    imageUrl: food['image'],
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Icon(Icons.restaurant, color: AppColors.neonOrange, size: 30),
                    errorWidget: (context, url, error) => const Icon(Icons.restaurant, color: AppColors.neonOrange, size: 30),
                  ),
                ),
              ),
              if (food['is_available'] == true)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.neonEmerald,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text('Available', style: TextStyle(color: Colors.white, fontSize: 9)),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food['name'],
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  food['category'],
                  style: const TextStyle(color: AppColors.silver, fontSize: 10),
                ),
                const SizedBox(height: 4),
                Text(
                  food['price'],
                  style: const TextStyle(color: AppColors.neonEmerald, fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoomCard(dynamic room) {
    final isAvailable = room['is_available'] == true;
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.charcoal, AppColors.darkBlack],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isAvailable ? AppColors.neonPurple.withValues(alpha: 0.3) : AppColors.neonRose.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  color: AppColors.neonPurple.withValues(alpha: 0.2),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: CachedNetworkImage(
                    imageUrl: room['image'],
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Icon(Icons.bed, color: AppColors.neonPurple, size: 50),
                    errorWidget: (context, url, error) => const Icon(Icons.bed, color: AppColors.neonPurple, size: 50),
                  ),
                ),
              ),
              if (!isAvailable)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                      color: Colors.black.withValues(alpha: 0.6),
                    ),
                    child: const Center(
                      child: Text(
                        'SOLD OUT',
                        style: TextStyle(color: AppColors.neonRose, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: isAvailable ? AppColors.neonEmerald : AppColors.neonRose,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    isAvailable ? 'Available' : 'Unavailable',
                    style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        room['name'],
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Text(
                      '${room['price_per_night']}/night',
                      style: const TextStyle(color: AppColors.neonEmerald, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  room['description'],
                  style: const TextStyle(color: AppColors.silver, fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildRoomInfo(Icons.person, '${room['capacity']} guests'),
                    const SizedBox(width: 16),
                    _buildRoomInfo(Icons.bed, room['bed_type']),
                    const SizedBox(width: 16),
                    _buildRoomInfo(Icons.square_foot, room['size']),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: (room['amenities'] as List).map<Widget>((amenity) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.neonPurple.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        amenity,
                        style: const TextStyle(color: AppColors.neonPurple, fontSize: 10),
                      ),
                    );
                  }).toList(),
                ),
                if (isAvailable) ...[
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.neonPurple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Book Now'),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoomInfo(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.silver, size: 14),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(color: AppColors.silver, fontSize: 12)),
      ],
    );
  }

  void _showWriteReviewDialog(BuildContext context, Color serviceColor) {
    double rating = 5.0;
    final reviewController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            decoration: const BoxDecoration(
              color: AppColors.charcoal,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.silver,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text('Write a Review', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Text('Rating: ', style: TextStyle(color: Colors.white)),
                      RatingBar.builder(
                        initialRating: rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 32,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 2),
                        itemBuilder: (context, _) => const Icon(Icons.star, color: AppColors.neonYellow),
                        unratedColor: AppColors.neonYellow.withValues(alpha: 0.3),
                        onRatingUpdate: (newRating) => setModalState(() => rating = newRating),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: reviewController,
                    maxLines: 4,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Share your experience...',
                      hintStyle: const TextStyle(color: AppColors.silver),
                      filled: true,
                      fillColor: AppColors.darkGray,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: serviceColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Review submitted!'),
                            backgroundColor: serviceColor,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: serviceColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: const Text('Submit Review', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
