import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.primary,
                    child: Text('P', style: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    AppStrings.yourLibrary,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildFilterChip('Playlists'),
                  _buildFilterChip('Artists'),
                  _buildFilterChip('Albums'),
                  _buildFilterChip('Podcasts & Shows'),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Library Items List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _libraryItems.length,
                itemBuilder: (context, index) {
                  return _buildLibraryItem(_libraryItems[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(label),
        backgroundColor: AppColors.surface,
        labelStyle: const TextStyle(color: AppColors.textPrimary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildLibraryItem(Map<String, dynamic> item) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: item['color'] as Color? ?? AppColors.surface,
          borderRadius:
              BorderRadius.circular(item['isArtist'] == true ? 28 : 4),
        ),
        child: Icon(
          item['icon'] as IconData? ?? Icons.music_note,
          color: item['iconColor'] as Color? ?? AppColors.textMuted,
        ),
      ),
      title: Text(
        item['title'] as String,
        style: const TextStyle(color: AppColors.textPrimary),
      ),
      subtitle: Text(
        item['subtitle'] as String,
        style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
      ),
      onTap: () {
        // TODO: Navigate to playlist/album/artist
      },
    );
  }
}

// temp data
final List<Map<String, dynamic>> _libraryItems = [
  {
    'title': 'Liked Songs',
    'subtitle': 'Playlist • 50 songs',
    'icon': Icons.favorite,
    'color': const Color(0xFF4A3BF5),
    'iconColor': Colors.white,
  },
  {
    'title': 'Your Episodes',
    'subtitle': 'Saved & downloaded episodes',
    'icon': Icons.bookmark,
    'color': const Color(0xFF006450),
    'iconColor': Colors.white,
  },
  {
    'title': 'Chill Mix',
    'subtitle': 'Playlist • Spotify',
    'icon': Icons.music_note,
  },
  {
    'title': 'Daily Mix 1',
    'subtitle': 'Playlist • Spotify',
    'icon': Icons.music_note,
  },
  {
    'title': 'Arijit Singh',
    'subtitle': 'Artist',
    'icon': Icons.person,
    'isArtist': true,
  },
  {
    'title': 'Bollywood Hits',
    'subtitle': 'Playlist • 100 songs',
    'icon': Icons.music_note,
  },
  {
    'title': 'Workout Mix',
    'subtitle': 'Playlist • 25 songs',
    'icon': Icons.fitness_center,
  },
];
