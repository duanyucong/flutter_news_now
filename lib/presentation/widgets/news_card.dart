import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/news.dart';
import '../../data/models/sources.dart';
import '../../providers/providers.dart';

class NewsCard extends ConsumerWidget {
  final News news;
  final VoidCallback onTap;

  const NewsCard({
    super.key,
    required this.news,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBookmarked = ref.watch(bookmarksProvider).any((n) => n.id == news.id);
    final theme = Theme.of(context);
    final sourceConfig = Sources.getSource(news.sourceId);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: theme.dividerColor,
          ),
        ),
        child: _buildCardContent(context, ref, isBookmarked, theme, sourceConfig),
      ),
    );
  }

  Widget _buildCardContent(BuildContext context, WidgetRef ref, bool isBookmarked, ThemeData theme, SourceConfig? sourceConfig) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSourceIcon(sourceConfig, theme),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                _buildFooter(ref, isBookmarked, theme, sourceConfig),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSourceIcon(SourceConfig? sourceConfig, ThemeData theme) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: sourceConfig?.iconColor.withOpacity(0.1) ?? theme.dividerColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: sourceConfig?.icon ?? Icon(Icons.rss_feed, size: 22, color: sourceConfig?.iconColor ?? AppColors.accentColor),
      ),
    );
  }

  Widget _buildFooter(WidgetRef ref, bool isBookmarked, ThemeData theme, SourceConfig? sourceConfig) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (news.formattedLikes != '0') ...[
              _buildStat(Icons.favorite_border, news.formattedLikes, theme),
              const SizedBox(width: 12),
            ],
            if (news.formattedComments != '0')
              _buildStat(Icons.chat_bubble_outline, news.formattedComments, theme),
            if (news.formattedLikes == '0' && news.formattedComments == '0')
              Text(
                sourceConfig?.name ?? news.source,
                style: theme.textTheme.bodySmall,
              ),
          ],
        ),
        GestureDetector(
          onTap: () {
            ref.read(bookmarksProvider.notifier).toggleBookmark(news);
          },
          child: Icon(
            isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            size: 20,
            color: isBookmarked ? AppColors.warningColor : AppColors.darkTextTertiary,
          ),
        ),
      ],
    );
  }

  Widget _buildStat(IconData icon, String value, ThemeData theme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: AppColors.darkTextTertiary),
        const SizedBox(width: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.darkTextTertiary,
          ),
        ),
      ],
    );
  }

  Widget _buildBookmarkButton(WidgetRef ref, bool isBookmarked) {
    return GestureDetector(
      onTap: () {
        ref.read(bookmarksProvider.notifier).toggleBookmark(news);
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: isBookmarked 
              ? AppColors.warningColor.withOpacity(0.1)
              : AppColors.darkBgTertiary,
          shape: BoxShape.circle,
        ),
        child: Icon(
          isBookmarked ? Icons.bookmark : Icons.bookmark_border,
          size: 20,
          color: isBookmarked ? AppColors.warningColor : AppColors.darkTextTertiary,
        ),
      ),
    );
  }
}
