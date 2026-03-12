import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

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
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.spacing16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Favorites', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.white)),
                const SizedBox(height: AppDimens.spacing24),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite_border, size: 80, color: AppColors.silver),
                        const SizedBox(height: AppDimens.spacing16),
                        Text('No favorites yet', style: TextStyle(fontSize: 18, color: AppColors.silver)),
                        const SizedBox(height: AppDimens.spacing8),
                        Text('Start exploring and save your favorite places', style: TextStyle(color: AppColors.silver)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
