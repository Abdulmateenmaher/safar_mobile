import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../home/main_screen.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.obsidian,
              AppColors.darkBlack,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.spacing24),
            child: Column(
              children: [
                const Spacer(),
                // Logo and App Name
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(AppDimens.radiusXLarge),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.neonBlue.withOpacity(0.4),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.explore,
                    size: 50,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: AppDimens.spacing24),
                ShaderMask(
                  shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
                  child: const Text(
                    'SAFAR',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      letterSpacing: 6,
                    ),
                  ),
                ),
                const SizedBox(height: AppDimens.spacing8),
                Text(
                  'Discover the beauty of Afghanistan',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.silver,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                // Features
                _buildFeatureRow(
                  icon: Icons.place_outlined,
                  title: 'Explore Places',
                  description: 'Discover amazing destinations',
                ),
                const SizedBox(height: AppDimens.spacing16),
                _buildFeatureRow(
                  icon: Icons.local_hospital_outlined,
                  title: 'Services',
                  description: 'Hotels, ATMs, Hospitals & more',
                ),
                const SizedBox(height: AppDimens.spacing16),
                _buildFeatureRow(
                  icon: Icons.bookmark_border,
                  title: 'Save Favorites',
                  description: 'Bookmark your favorite places',
                ),
                const Spacer(),
                // Buttons
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                  child: const Text('Sign In'),
                ),
                const SizedBox(height: AppDimens.spacing12),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterScreen()),
                    );
                  },
                  child: const Text('Create Account'),
                ),
                const SizedBox(height: AppDimens.spacing24),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const MainScreen()),
                    );
                  },
                  child: Text(
                    'Skip for now',
                    style: TextStyle(color: AppColors.silver),
                  ),
                ),
                const SizedBox(height: AppDimens.spacing24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureRow({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.glassWhite,
            borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
            border: Border.all(color: AppColors.glassBorder),
          ),
          child: Icon(icon, color: AppColors.neonBlue),
        ),
        const SizedBox(width: AppDimens.spacing16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.silver,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
