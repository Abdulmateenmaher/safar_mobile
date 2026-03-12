import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

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
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppDimens.spacing16),
                  decoration: BoxDecoration(
                    color: AppColors.charcoal,
                    borderRadius: BorderRadius.circular(AppDimens.radiusXXLarge),
                    border: Border.all(color: AppColors.darkGray),
                  ),
                  child: const TextField(
                    style: TextStyle(color: AppColors.white),
                    decoration: InputDecoration(
                      hintText: 'Search places, hotels...',
                      hintStyle: TextStyle(color: AppColors.silver),
                      icon: Icon(Icons.search, color: AppColors.silver),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: AppDimens.spacing24),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _chip('All', true),
                      _chip('Places', false),
                      _chip('Hotels', false),
                      _chip('Restaurants', false),
                      _chip('ATMs', false),
                    ],
                  ),
                ),
                const SizedBox(height: AppDimens.spacing24),
                const Align(alignment: Alignment.centerLeft, child: Text('Recent', style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold))),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(leading: const Icon(Icons.history, color: AppColors.silver), title: const Text('Bamyan', style: TextStyle(color: AppColors.white))),
                      ListTile(leading: const Icon(Icons.history, color: AppColors.silver), title: const Text('Kabul', style: TextStyle(color: AppColors.white))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _chip(String label, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(label, style: TextStyle(color: selected ? AppColors.white : AppColors.silver)),
        backgroundColor: selected ? AppColors.neonBlue : AppColors.charcoal,
      ),
    );
  }
}
