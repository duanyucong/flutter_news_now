import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/news.dart';
import '../../data/models/sources.dart';
import '../../providers/providers.dart';
import '../widgets/news_card.dart';
import 'webview_screen.dart';

class BookmarksScreen extends ConsumerWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final bookmarkedNews = ref.watch(bookmarksProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('我的收藏'),
        elevation: 0,
        actions: [
          if (bookmarkedNews.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              tooltip: '清空收藏',
              onPressed: () => _showClearDialog(context, ref),
            ),
        ],
      ),
      body: _buildBookmarksList(context, ref, theme, bookmarkedNews),
    );
  }

  Widget _buildBookmarksList(
    BuildContext context,
    WidgetRef ref,
    ThemeData theme,
    List<News> bookmarkedNews,
  ) {
    if (bookmarkedNews.isEmpty) {
      return const Center(
        child: Text('暂无收藏'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: bookmarkedNews.length + 1,
      itemBuilder: (context, index) {
        if (index == bookmarkedNews.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: Text('没有更多了')),
          );
        }
        final item = bookmarkedNews[index];
        final sourceConfig = Sources.getSource(item.sourceId);
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Dismissible(
            key: Key(item.id),
            direction: DismissDirection.endToStart,
            onDismissed: (_) {
              ref.read(bookmarksProvider.notifier).toggleBookmark(item);
            },
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: NewsCard(
              news: item,
              onTap: () => _openWebView(context, item, sourceConfig),
            ),
          ),
        );
      },
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
        title: const Text('清空收藏'),
        content: const Text('确定要清空所有收藏吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              ref.read(bookmarksProvider.notifier).clearAll();
              Navigator.pop(context);
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }
}
