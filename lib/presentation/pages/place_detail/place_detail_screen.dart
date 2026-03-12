import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../service_detail/service_detail_screen.dart';

class PlaceDetailScreen extends StatefulWidget {
  final String placeId;

  const PlaceDetailScreen({
    super.key,
    required this.placeId,
  });

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  int _currentImageIndex = 0;

  // Mock data matching backend API structure
  final Map<String, dynamic> _placeData = {
    'id': '1',
    'name': 'Bamyan Valley',
    'slug': 'bamyan-valley',
    'location': 'Bamyan Province, Afghanistan',
    'description': 'The Bamyan Valley is a historic site in central Afghanistan, known for its colossal Buddha statues that once stood tall against the mountainside. This UNESCO World Heritage Site offers breathtaking views and rich cultural history.',
    'short_description': 'Ancient Buddhist heritage site with stunning mountain views',
    'historical_background': 'The Bamyan Valley has been inhabited since ancient times and was once a major Buddhist center.',
    'cultural_insights': 'The valley is home to the famous Buddha statues carved into the cliffs.',
    'highlights': ['Giant Buddha Statues', 'Shahr-i Gohar', 'Band-e Amir'],
    'visitor_tips': ['Best visited in spring and autumn', 'Hire a local guide'],
    'what_to_expect': 'Breathtaking views, rich history, and cultural immersion',
    'images': [
      'https://images.unsplash.com/photo-1527549993586-dff825b37782?q=80&w=1200',
      'https://images.unsplash.com/photo-1548013146-72479768bbaa?q=80&w=1200',
      'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?q=80&w=1200',
    ],
    'video_url': null,
    'is_bookmarked': false,
    'entry_fee': 0,
    'daily_visitor_limit': 0,
    'has_guide': false,
    'is_family_friendly': true,
    'is_featured': true,
    'is_active': true,
    'best_time_to_visit': 'Spring and Autumn',
    'amenities': ['Parking', 'Guide Available'],
    'has_wifi': false,
    'has_parking': true,
    'has_paid_parking': false,
    'views_count': 1500,
    'bookmarks_count': 250,
    'shares_count': 100,
    'category': 'Historical',
    'average_rating': 4.8,
    'coordinate': {
      'latitude': 34.8186,
      'longitude': 67.8292,
      'address': 'Bamyan Province',
      'city': 'Bamyan',
      'country': 'Afghanistan',
    },
    'operating_hour': {
      'is_24_hours': true,
      'monday': 'Open 24 hours',
      'tuesday': 'Open 24 hours',
      'wednesday': 'Open 24 hours',
      'thursday': 'Open 24 hours',
      'friday': 'Open 24 hours',
      'saturday': 'Open 24 hours',
      'sunday': 'Open 24 hours',
    },
    'reviews': [
      {'user': 'Ahmed Khan', 'rating': 5.0, 'comment': 'Absolutely stunning!', 'created_at': '2024-01-10'},
      {'user': 'Sarah Johnson', 'rating': 4.5, 'comment': 'Great place to visit!', 'created_at': '2024-01-05'},
    ],
    'nearest_locations': {
      'nearest_atm': {
        'id': 'a1',
        'name': 'Afghanistan Bank ATM',
        'distance': '0.5 km',
        'category': 'atm',
        'image': 'https://images.unsplash.com/photo-1563013544-824ae1b704d3?q=80&w=800',
        'is_operational': true,
      },
      'nearest_hotel': {
        'id': 'h1',
        'name': 'Bamyan Hotel',
        'distance': '1.2 km',
        'category': 'hotel',
        'price_range': '\$50-100',
        'image': 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?q=80&w=800',
        'average_rating': 4.5,
      },
      'nearest_restaurant': {
        'id': 'r1',
        'name': 'Valley Restaurant',
        'distance': '0.8 km',
        'category': 'restaurant',
        'cuisine_type': 'Afghani',
        'image': 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?q=80&w=800',
        'average_rating': 4.3,
      },
      'nearest_hospital': {
        'id': 'ho1',
        'name': 'Bamyan Hospital',
        'distance': '2.0 km',
        'category': 'hospital',
        'specialty': 'General',
        'image': 'https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?q=80&w=800',
        'has_emergency': true,
        'average_rating': 4.0,
      },
      'nearest_travel_agency': {
        'id': 't1',
        'name': 'Bamyan Tours',
        'distance': '1.5 km',
        'category': 'agency',
        'image': 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?q=80&w=800',
        'offers_international_tours': true,
        'average_rating': 4.7,
      },
    },
  };

  List<dynamic> get _allNearbyServices {
    final List<dynamic> services = [];
    final nearest = _placeData['nearest_locations'] as Map<String, dynamic>;
    
    if (nearest['nearest_atm'] != null) services.add(nearest['nearest_atm']);
    if (nearest['nearest_hotel'] != null) services.add(nearest['nearest_hotel']);
    if (nearest['nearest_restaurant'] != null) services.add(nearest['nearest_restaurant']);
    if (nearest['nearest_hospital'] != null) services.add(nearest['nearest_hospital']);
    if (nearest['nearest_travel_agency'] != null) services.add(nearest['nearest_travel_agency']);
    
    return services;
  }

  IconData _getServiceIcon(String category) {
    switch (category) {
      case 'atm': return Icons.atm;
      case 'hotel': return Icons.hotel;
      case 'restaurant': return Icons.restaurant;
      case 'hospital': return Icons.local_hospital;
      case 'agency': return Icons.flight;
      default: return Icons.place;
    }
  }

  Color _getServiceColor(String category) {
    switch (category) {
      case 'atm': return AppColors.neonBlue;
      case 'hotel': return AppColors.neonPurple;
      case 'restaurant': return AppColors.neonOrange;
      case 'hospital': return AppColors.neonRose;
      case 'agency': return AppColors.neonEmerald;
      default: return AppColors.neonBlue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final images = _placeData['images'] as List<dynamic>;
    
    return Scaffold(
      backgroundColor: isDark ? AppColors.obsidian : AppColors.offWhite,
      body: CustomScrollView(
        slivers: [
          // Cyber-Luxury Image Slider with Glass AppBar
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.45,
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
                    _placeData['is_bookmarked'] == true ? Icons.favorite : Icons.favorite_border,
                    color: _placeData['is_bookmarked'] == true ? AppColors.neonRose : Colors.white,
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
                  // Image Carousel
                  CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.55,
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
                                ? AppColors.neonBlue
                                : Colors.white.withValues(alpha: 0.5),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  // Featured Badge
                  if (_placeData['is_featured'] == true)
                    Positioned(
                      top: 100,
                      right: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.neonBlue.withValues(alpha: 0.5),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: Colors.white, size: 14),
                            SizedBox(width: 4),
                            Text('Featured', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          
          // Place Info Section - Cyber-Luxury Glass Card
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
                border: Border.all(
                  color: AppColors.glassBorder,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.neonBlue.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category & Rating
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
                                color: AppColors.neonPurple.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: AppColors.neonPurple.withValues(alpha: 0.5)),
                              ),
                              child: Text(
                                _placeData['category'] ?? 'Place',
                                style: const TextStyle(
                                  color: AppColors.neonPurple,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
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
                                    _placeData['average_rating'].toString(),
                                    style: const TextStyle(
                                      color: AppColors.neonYellow,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Title - Editorial Style
                        Text(
                          _placeData['name'] ?? '',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Location with icon
                        Row(
                          children: [
                            Icon(Icons.location_on, color: AppColors.neonEmerald, size: 16),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                _placeData['location'] ?? '',
                                style: TextStyle(color: AppColors.silver, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  // Stats Row - Glass Effect
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
                        _buildStat(Icons.visibility, '${_placeData['views_count']}', 'Views'),
                        _buildStat(Icons.bookmark, '${_placeData['bookmarks_count']}', 'Saved'),
                        _buildStat(Icons.share, '${_placeData['shares_count']}', 'Shared'),
                        _buildStat(Icons.schedule, _placeData['best_time_to_visit'] ?? '', 'Best Time'),
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
                          _placeData['description'] ?? '',
                          style: TextStyle(color: AppColors.silver, height: 1.6, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  
                  // Amenities - Tactical Grid
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Amenities', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            if (_placeData['has_parking'] == true)
                              _buildAmenityChip('Parking', Icons.local_parking, AppColors.neonEmerald),
                            if (_placeData['has_guide'] == true)
                              _buildAmenityChip('Guide', Icons.person, AppColors.neonBlue),
                            if (_placeData['is_family_friendly'] == true)
                              _buildAmenityChip('Family Friendly', Icons.family_restroom, AppColors.neonPurple),
                            _buildAmenityChip(_placeData['best_time_to_visit'] ?? '', Icons.calendar_today, AppColors.neonOrange),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Nearby Services Section - Mixed Horizontal Scroll
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
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.near_me, color: Colors.white, size: 20),
                      ),
                      const SizedBox(width: 12),
                      const Text('Nearby Services', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _allNearbyServices.length,
                    itemBuilder: (context, index) {
                      final service = _allNearbyServices[index];
                      return _buildServiceCard(service);
                    },
                  ),
                ),
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
                  // Map Placeholder
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
                                Icon(Icons.location_on, color: AppColors.neonEmerald, size: 50),
                                const SizedBox(height: 8),
                                Text(
                                  '${_placeData['coordinate']['latitude']}, ${_placeData['coordinate']['longitude']}',
                                  style: TextStyle(color: AppColors.silver),
                                ),
                                Text(
                                  _placeData['coordinate']['address'] ?? '',
                                  style: TextStyle(color: AppColors.silver, fontSize: 12),
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
                        Text('Reviews (${_placeData['reviews'].length})', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                      ],
                    ),
                  ),
                  ...(_placeData['reviews'] as List).map<Widget>((review) {
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
                                backgroundColor: AppColors.neonBlue.withValues(alpha: 0.2),
                                backgroundImage: const CachedNetworkImageProvider(
                                  'https://api.dicebear.com/7.x/avataaars/svg?seed=Sharif',
                                ),
                                child: Text(
                                  (review['user'] as String?)?.substring(0, 1).toUpperCase() ?? 'U',
                                  style: const TextStyle(color: AppColors.neonBlue, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(review['user'] ?? 'User', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                    Text(review['created_at'] ?? '', style: TextStyle(color: AppColors.silver, fontSize: 12)),
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
                          Text(review['comment'] ?? '', style: TextStyle(color: AppColors.silver, height: 1.5)),
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
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _showWriteReviewDialog(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.neonBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 0,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit),
                      SizedBox(width: 8),
                      Text('Write a Review', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
        Text(label, style: TextStyle(color: AppColors.silver, fontSize: 10)),
      ],
    );
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

  Widget _buildServiceCard(dynamic service) {
    final category = service['category'] as String? ?? 'place';
    final color = _getServiceColor(category);
    final icon = _getServiceIcon(category);
    
    return GestureDetector(
      onTap: () {
        // Navigate to service detail based on category
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServiceDetailScreen(
              serviceId: service['id'] ?? '',
              serviceType: category,
            ),
          ),
        );
      },
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.charcoal,
              AppColors.darkBlack,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withValues(alpha: 0.3)),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.2),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with overlay
            Stack(
              children: [
                Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    color: color.withValues(alpha: 0.2),
                  ),
                  child: service['image'] != null
                      ? ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                          child: CachedNetworkImage(
                            imageUrl: service['image'],
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Icon(icon, color: color, size: 30),
                            errorWidget: (context, url, error) => Icon(icon, color: color, size: 30),
                          ),
                        )
                      : Icon(icon, color: color, size: 30),
                ),
                // Category badge
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: Colors.white, size: 12),
                  ),
                ),
                // Operational status indicator
                if (service['is_operational'] != null)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: service['is_operational'] == true ? AppColors.neonEmerald : AppColors.neonRose,
                        boxShadow: [
                          BoxShadow(
                            color: (service['is_operational'] == true ? AppColors.neonEmerald : AppColors.neonRose).withValues(alpha: 0.5),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            // Info
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service['name'] ?? '',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.near_me, color: color, size: 12),
                      const SizedBox(width: 4),
                      Text(
                        service['distance'] ?? '',
                        style: TextStyle(color: AppColors.silver, fontSize: 11),
                      ),
                    ],
                  ),
                  if (service['average_rating'] != null)
                    Row(
                      children: [
                        const Icon(Icons.star, color: AppColors.neonYellow, size: 12),
                        const SizedBox(width: 2),
                        Text(
                          service['average_rating'].toString(),
                          style: TextStyle(color: AppColors.silver, fontSize: 11),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showWriteReviewDialog(BuildContext context) {
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
                      hintStyle: TextStyle(color: AppColors.silver),
                      filled: true,
                      fillColor: AppColors.darkGray,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.neonBlue),
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
                          const SnackBar(
                            content: Text('Review submitted!'),
                            backgroundColor: AppColors.neonBlue,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.neonBlue,
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
