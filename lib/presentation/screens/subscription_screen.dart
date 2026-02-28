import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/sources.dart';
import '../../providers/providers.dart';

class SubscriptionScreen extends ConsumerWidget {
  const SubscriptionScreen({super.key});

  static const Map<String, String> columnNames = {
    'tech': '科技',
    'china': '国内',
    'world': '国际',
    'finance': '财经',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final allSources = ref.watch(followSourcesProvider);

    final groupedSources = <String, List<FollowSourceState>>{};
    for (final source in allSources) {
      final sourceConfig = Sources.getSource(source.id);
      final column = sourceConfig?.column ?? 'china';
      groupedSources.putIfAbsent(column, () => []).add(source);
    }

    final sortedKeys = ['tech', 'china', 'world', 'finance']
        .where((k) => groupedSources.containsKey(k))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('订阅管理'),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              ref.read(followSourcesProvider.notifier).selectAll();
            },
            child: const Text('全选'),
          ),
          TextButton(
            onPressed: () {
              ref.read(followSourcesProvider.notifier).deselectAll();
            },
            child: const Text('全不选'),
          ),
        ],
      ),
      body: ListView(
        children: [
          for (final key in sortedKeys) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                columnNames[key] ?? key,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ...groupedSources[key]!.map((source) => _buildSourceItem(context, ref, source)),
          ],
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSourceItem(BuildContext context, WidgetRef ref, FollowSourceState source) {
    final theme = Theme.of(context);
    final sourceConfig = Sources.getSource(source.id);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: theme.dividerColor, width: 0.5),
        ),
      ),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: sourceConfig?.iconColor.withValues(alpha: 0.1) ?? theme.dividerColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: sourceConfig?.icon ?? Icon(Icons.rss_feed, size: 20, color: sourceConfig?.iconColor),
          ),
        ),
        title: Text(source.name),
        subtitle: Text(
          sourceConfig?.title ?? '',
          style: theme.textTheme.bodySmall,
        ),
        trailing: Switch(
          value: source.isSubscribed,
          onChanged: (_) {
            ref.read(followSourcesProvider.notifier).toggleSubscription(source.id);
          },
        ),
      ),
    );
  }
}
