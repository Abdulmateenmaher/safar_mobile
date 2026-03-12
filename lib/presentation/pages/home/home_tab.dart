import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../place_detail/place_detail_screen.dart';
import '../search/search_tab.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  // Place images - vertical/cinematic for hero cards
  static const List<Map<String, String>> popularPlaces = [
    {
      'id': '1',
      'name': 'Band-e-Amir',
      'location': 'Bamyan, Afghanistan',
      'rating': '4.9',
      'reviews': '2.5K',
      'image': 'https://images.unsplash.com/photo-1527549993586-dff825b37782?q=80&w=1200',
    },
    {
      'id': '2',
      'name': 'Blue Mosque',
      'location': 'Mazar-i-Sharif, Afghanistan',
      'rating': '4.8',
      'reviews': '3.2K',
      'image': 'https://images.unsplash.com/photo-1548013146-72479768bbaa?q=80&w=1200',
    },
    {
      'id': '3',
      'name': 'Hindu Kush',
      'location': 'Northern Afghanistan',
      'rating': '4.7',
      'reviews': '1.8K',
      'image': 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?q=80&w=1200',
    },
    {
      'id': '4',
      'name': 'Bamyan Valley',
      'location': 'Bamyan, Afghanistan',
      'rating': '4.8',
      'reviews': '2.1K',
      'image': 'https://images.unsplash.com/photo-1518391846015-55a9cc003b25?q=80&w=1200',
    },
    {
      'id': '5',
      'name': 'Panjshir Valley',
      'location': 'Panjshir, Afghanistan',
      'rating': '4.6',
      'reviews': '1.5K',
      'image': 'https://images.unsplash.com/photo-1527549993586-dff825b37782?q=80&w=1200',
    },
  ];

  static const List<Map<String, String>> allPlaces = [
    {
      'id': '1',
      'name': 'Buddhas of Bamyan',
      'location': 'Bamyan, Afghanistan',
      'rating': '4.8',
      'reviews': '120',
      'image': 'https://images.unsplash.com/photo-1527549993586-dff825b37782?q=80&w=1200',
    },
    {
      'id': '2',
      'name': 'Mazar-i-Sharif Mosque',
      'location': 'Mazar-i-Sharif, Afghanistan',
      'rating': '4.9',
      'reviews': '250',
      'image': 'https://images.unsplash.com/photo-1548013146-72479768bbaa?q=80&w=1200',
    },
    {
      'id': '3',
      'name': 'Koh-i-Noor Mountain',
      'location': 'Central Afghanistan',
      'rating': '4.5',
      'reviews': '85',
      'image': 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?q=80&w=1200',
    },
    {
      'id': '4',
      'name': 'Salang Pass',
      'location': 'Parwan, Afghanistan',
      'rating': '4.7',
      'reviews': '95',
      'image': 'https://images.unsplash.com/photo-1518391846015-55a9cc003b25?q=80&w=1200',
    },
    {
      'id': '5',
      'name': 'Stupa of Gandhara',
      'location': 'Gandhara, Afghanistan',
      'rating': '4.6',
      'reviews': '110',
      'image': 'https://images.unsplash.com/photo-1527549993586-dff825b37782?q=80&w=1200',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.obsidian, AppColors.darkBlack],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppDimens.spacing16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.person, color: AppColors.white),
                    ),
                    const SizedBox(width: AppDimens.spacing12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Welcome Back', style: TextStyle(fontSize: 12, color: AppColors.silver)),
                          Text('Explorer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.white)),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search, color: AppColors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SearchTab()),
                        );
                      },
                    ),
                    Stack(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.notifications_outlined, color: AppColors.white),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Notifications coming soon!')),
                            );
                          },
                        ),
                        const Positioned(right: 8, top: 8, child: CircleAvatar(radius: 4, backgroundColor: AppColors.neonRose)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: AppDimens.spacing24),

                // Popular Places Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Popular Places', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.white)),
                    TextButton(
                      onPressed: () {},
                      child: const Text('See All', style: TextStyle(color: AppColors.neonBlue)),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimens.spacing12),

                // Popular Places - Cinematic Vertical Cards (4:5 aspect ratio)
                SizedBox(
                  height: 320,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularPlaces.length,
                    itemBuilder: (context, index) {
                      final place = popularPlaces[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceDetailScreen(placeId: place['id']!),
                            ),
                          );
                        },
                        child: Container(
                          width: 180,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.neonBlue.withValues(alpha: 0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              // Image with gradient
                              ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: CachedNetworkImage(
                                  imageUrl: place['image']!,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    color: AppColors.charcoal,
                                    child: const Center(child: CircularProgressIndicator(color: AppColors.neonBlue)),
                                  ),
                                  errorWidget: (context, url, error) => Container(
                                    color: AppColors.charcoal,
                                    child: const Icon(Icons.image, color: AppColors.silver, size: 50),
                                  ),
                                ),
                              ),
                              // Gradient overlay
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.transparent,
                                      AppColors.obsidian.withValues(alpha: 0.3),
                                      AppColors.obsidian.withValues(alpha: 0.9),
                                    ],
                                    stops: const [0.0, 0.3, 0.6, 1.0],
                                  ),
                                ),
                              ),
                              // Floating glass tag
                              Positioned(
                                top: 12,
                                left: 12,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: AppColors.glassWhite,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: AppColors.glassBorder),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.star, size: 12, color: AppColors.neonYellow),
                                      const SizedBox(width: 4),
                                      Text(
                                        place['rating']!,
                                        style: const TextStyle(
                                          color: AppColors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Content
                              Positioned(
                                bottom: 16,
                                left: 16,
                                right: 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      place['name']!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.white,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(Icons.location_on, size: 12, color: AppColors.neonEmerald),
                                        const SizedBox(width: 4),
                                        Expanded(
                                          child: Text(
                                            place['location']!,
                                            style: const TextStyle(fontSize: 11, color: AppColors.silver),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
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
                    },
                  ),
                ),
                const SizedBox(height: AppDimens.spacing24),

                // Services - Tactical Utility Grid
                const Text('Services', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.white)),
                const SizedBox(height: AppDimens.spacing12),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  mainAxisSpacing: AppDimens.spacing12,
                  crossAxisSpacing: AppDimens.spacing12,
                  children: [
                    _buildService(Icons.hotel, 'Hotels', AppColors.neonPurple),
                    _buildService(Icons.restaurant, 'Food', AppColors.neonOrange),
                    _buildService(Icons.atm, 'ATMs', AppColors.neonBlue),
                    _buildService(Icons.local_hospital, 'Medical', AppColors.neonRose),
                    _buildService(Icons.directions_bus, 'Transport', AppColors.neonEmerald),
                    _buildService(Icons.account_balance, 'Banks', AppColors.neonCyan),
                    _buildService(Icons.flight, 'Travel', AppColors.neonPurple),
                    _buildService(Icons.more_horiz, 'More', AppColors.silver),
                  ],
                ),
                const SizedBox(height: AppDimens.spacing24),

                // All Places Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('All Places', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.white)),
                    TextButton(
                      onPressed: () {},
                      child: const Text('See All', style: TextStyle(color: AppColors.neonBlue)),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimens.spacing12),

                // Places List
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allPlaces.length,
                  itemBuilder: (context, index) {
                    final place = allPlaces[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlaceDetailScreen(placeId: place['id']!),
                          ),
                        );
                      },
                      child: Container(
                        height: 100,
                        margin: const EdgeInsets.only(bottom: AppDimens.spacing12),
                        decoration: BoxDecoration(
                          color: AppColors.charcoal,
                          borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
                          border: Border.all(color: AppColors.glassBorder),
                        ),
                        child: Row(
                          children: [
                            // Place image - smaller than hero cards (2:1 ratio)
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(AppDimens.radiusLarge),
                                bottomLeft: Radius.circular(AppDimens.radiusLarge),
                              ),
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: CachedNetworkImage(
                                  imageUrl: place['image']!,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    color: AppColors.darkGray,
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.neonBlue,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => Container(
                                    color: AppColors.darkGray,
                                    child: const Icon(Icons.image, color: AppColors.silver),
                                  ),
                                ),
                              ),
                            ),
                            // Place info
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(AppDimens.spacing12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      place['name']!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.white,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(Icons.location_on, size: 12, color: AppColors.neonEmerald),
                                        const SizedBox(width: 4),
                                        Expanded(
                                          child: Text(
                                            place['location']!,
                                            style: const TextStyle(fontSize: 12, color: AppColors.silver),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(Icons.star, size: 14, color: AppColors.neonYellow),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${place['rating']} (${place['reviews']} reviews)',
                                          style: const TextStyle(fontSize: 12, color: AppColors.silver),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Bookmark button
                            IconButton(
                              icon: const Icon(Icons.bookmark_border, color: AppColors.white),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildService(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
            border: Border.all(color: color.withValues(alpha: 0.3)),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 10, color: AppColors.silver)),
      ],
    );
  }
}
