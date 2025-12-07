import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                AppStrings.search,
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              const SizedBox(height: 16),

              // Search Bar
              GestureDetector(
                onTap: () {
                  // TODO: Navigate to search results page
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.textPrimary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: AppColors.background),
                      SizedBox(width: 12),
                      Text(
                        'What do you want to listen to?',
                        style: TextStyle(
                          color: AppColors.background,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Browse All Title
              Text(
                'Browse all',
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              const SizedBox(height: 16),

              // Categories Grid
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.8,
                  ),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    return _buildCategoryCard(_categories[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(Map<String, dynamic> category) {
    return Container(
      decoration: BoxDecoration(
        color: category['color'] as Color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              category['name'] as String,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // image to be added later
        ],
      ),
    );
  }
}

// sample data
final List<Map<String, dynamic>> _categories = [
  {'name': 'Music', 'color': const Color(0xFFE13300)},
  {'name': 'Podcasts', 'color': const Color(0xFF006450)},
  {'name': 'Live Events', 'color': const Color(0xFF8400E7)},
  {'name': 'Made For You', 'color': const Color(0xFF1E3264)},
  {'name': 'New Releases', 'color': const Color(0xFFE8115B)},
  {'name': 'Hindi', 'color': const Color(0xFF148A08)},
  {'name': 'Punjabi', 'color': const Color(0xFFE1118B)},
  {'name': 'Tamil', 'color': const Color(0xFF537AA1)},
  {'name': 'Telugu', 'color': const Color(0xFFDC148C)},
  {'name': 'Pop', 'color': const Color(0xFF8D67AB)},
  {'name': 'Hip-Hop', 'color': const Color(0xFFBA5D07)},
  {'name': 'Rock', 'color': const Color(0xFFE91429)},
  {'name': 'Indie', 'color': const Color(0xFF608108)},
  {'name': 'Workout', 'color': const Color(0xFF777777)},
  {'name': 'Chill', 'color': const Color(0xFF537AA1)},
  {'name': 'Sleep', 'color': const Color(0xFF1E3264)},
];
