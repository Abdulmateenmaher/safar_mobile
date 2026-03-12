import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

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
              children: [
                const SizedBox(height: AppDimens.spacing24),
                // Profile Header
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person, size: 50, color: AppColors.white),
                ),
                const SizedBox(height: AppDimens.spacing16),
                const Text('Guest User', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.white)),
                const SizedBox(height: AppDimens.spacing32),
                // Settings
                _buildSettingItem(Icons.language, 'Language', 'English'),
                _buildSettingItem(Icons.dark_mode, 'Theme', 'Dark'),
                _buildSettingItem(Icons.notifications, 'Notifications', 'On'),
                _buildSettingItem(Icons.help, 'Help & Support', ''),
                _buildSettingItem(Icons.privacy_tip, 'Privacy Policy', ''),
                _buildSettingItem(Icons.info, 'About', ''),
                const SizedBox(height: AppDimens.spacing24),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.neonRose),
                  child: const Text('Sign Out'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimens.spacing12),
      padding: const EdgeInsets.all(AppDimens.spacing16),
      decoration: BoxDecoration(
        color: AppColors.charcoal,
        borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.neonBlue),
          const SizedBox(width: AppDimens.spacing16),
          Expanded(child: Text(title, style: const TextStyle(color: AppColors.white, fontSize: 16))),
          if (value.isNotEmpty) Text(value, style: TextStyle(color: AppColors.silver)),
          const Icon(Icons.chevron_right, color: AppColors.silver),
        ],
      ),
    );
  }
}
