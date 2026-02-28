import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/news.dart';
import 'source_badge.dart';

class TimelineItem extends StatelessWidget {
  final News news;
  final VoidCallback onTap;

  const TimelineItem({
    super.key,
    required this.news,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 45,
                child: Text(
                  news.time,
                  style: TextStyle(
                    fontSize: 11,
                    color: theme.textTheme.bodySmall?.color,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: AppColors.accentColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: theme.scaffoldBackgroundColor,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.accentColor.withOpacity(0.3),
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 2,
                      color: theme.dividerColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.cardTheme.color,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: theme.dividerColor),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SourceBadge(
                        sourceId: news.sourceId,
                        sourceName: news.source,
                        showTime: false,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        news.title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          height: 1.5,
                        ),
                      ),
                      if (news.likes > 0 || news.comments > 0) ...[
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            if (news.likes > 0) ...[
                              Icon(
                                Icons.favorite,
                                size: 14,
                                color: theme.textTheme.bodySmall?.color,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                news.formattedLikes,
                                style: theme.textTheme.bodySmall,
                              ),
                              const SizedBox(width: 12),
                            ],
                            if (news.comments > 0) ...[
                              Icon(
                                Icons.chat_bubble_outline,
                                size: 14,
                                color: theme.textTheme.bodySmall?.color,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                news.formattedComments,
                                style: theme.textTheme.bodySmall,
                              ),
                            ],
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
