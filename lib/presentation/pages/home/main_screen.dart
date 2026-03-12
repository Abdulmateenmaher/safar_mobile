import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import 'home_tab.dart';
import '../search/search_tab.dart';
import '../favorites/favorites_tab.dart';
import '../profile/profile_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeTab(),
    SearchTab(),
    FavoritesTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.obsidian.withOpacity(0.95),
          border: Border(
            top: BorderSide(
              color: AppColors.glassBorder,
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.neonBlue.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.spacing8,
              vertical: AppDimens.spacing8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Icons.home_outlined, Icons.home, 'Home'),
                _buildNavItem(1, Icons.search_outlined, Icons.search, 'Search'),
                _buildNavItem(2, Icons.favorite_outline, Icons.favorite, 'Favorites'),
                _buildNavItem(3, Icons.person_outline, Icons.person, 'Profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, IconData activeIcon, String label) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? AppDimens.spacing16 : AppDimens.spacing12,
          vertical: AppDimens.spacing8,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.neonBlue.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(AppDimens.radiusXXLarge),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              color: isSelected ? AppColors.neonBlue : AppColors.silver,
              size: 24,
            ),
            if (isSelected) ...[
              const SizedBox(width: AppDimens.spacing8),
              Text(
                label,
                style: TextStyle(
                  color: AppColors.neonBlue,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
