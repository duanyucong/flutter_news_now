import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/news.dart';
import '../../data/models/sources.dart';
import '../../providers/providers.dart';
import '../widgets/news_card.dart';
import 'webview_screen.dart';

class ReadHistoryScreen extends ConsumerWidget {
  const ReadHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final history = ref.watch(readHistoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('阅读历史'),
        elevation: 0,
        actions: [
          if (history.isNotEmpty)
            TextButton(
              onPressed: () => _showClearDialog(context, ref),
              child: const Text('清空'),
            ),
        ],
      ),
      body: history.isEmpty
          ? const Center(child: Text('暂无阅读历史'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: history.length + 1,
              itemBuilder: (context, index) {
                if (index == history.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: Text('没有更多了')),
                  );
                }
                final item = history[index];
                final sourceConfig = Sources.getSource(item.sourceId);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: NewsCard(
                    news: item,
                    onTap: () => _openWebView(context, item, sourceConfig),
                  ),
                );
              },
            ),
    );
  }

  void _openWebView(BuildContext context, dynamic item, SourceConfig? sourceConfig) {
    final url = item.url;
    if (url != null && url.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebViewScreen(
            url: url,
            title: sourceConfig?.name ?? item.source,
          ),
        ),
      );
    }
  }

  void _showClearDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('清空阅读历史'),
        content: const Text('确定要清空所有阅读历史吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              ref.read(readHistoryProvider.notifier).clearHistory();
              Navigator.pop(context);
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }
}
