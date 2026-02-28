import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/mock_data.dart';
import '../../data/models/news.dart';
import '../../providers/providers.dart';
import '../widgets/source_badge.dart';

class ArticleDetailScreen extends ConsumerWidget {
  final String newsId;

  const ArticleDetailScreen({
    super.key,
    required this.newsId,
  });

  News? _findNews(List<News> newsList) {
    try {
      return newsList.firstWhere((n) => n.id == newsId);
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotNews = ref.watch(hotNewsProvider);
    final liveNews = ref.watch(liveNewsProvider);
    final bookmarks = ref.watch(bookmarksProvider);
    final isBookmarked = bookmarks.contains(newsId);
    final theme = Theme.of(context);

    News? news;
    hotNews.whenData((list) {
      news ??= _findNews(list);
    });
    liveNews.whenData((list) {
      news ??= _findNews(list);
    });

    if (news == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('文章详情')),
        body: const Center(child: Text('文章不存在')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('文章详情'),
        actions: [
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: isBookmarked ? AppColors.warningColor : null,
            ),
            onPressed: () {
              ref.read(bookmarksProvider.notifier).toggleBookmark(newsId);
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SourceBadge(
                  sourceId: news!.sourceId,
                  sourceName: news!.source,
                ),
                const Spacer(),
                Text(
                  news!.time,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              news!.title,
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              news!.content,
              style: theme.textTheme.bodyLarge?.copyWith(
                height: 1.8,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                _buildStatItem(
                  context,
                  Icons.favorite,
                  news!.formattedLikes,
                  AppColors.errorColor,
                ),
                const SizedBox(width: 24),
                _buildStatItem(
                  context,
                  Icons.chat_bubble_outline,
                  news!.formattedComments,
                  AppColors.accentColor,
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, IconData icon, String value, Color color) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
      ],
    );
  }
}
