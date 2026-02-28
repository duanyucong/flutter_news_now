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
    final bookmarkedIds = ref.watch(bookmarksProvider);
    final hotNewsAsync = ref.watch(hotNewsProvider);
    final liveNewsAsync = ref.watch(liveNewsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('我的收藏'),
        elevation: 0,
      ),
      body: _buildBookmarksList(context, ref, theme, bookmarkedIds, hotNewsAsync, liveNewsAsync),
    );
  }

  Widget _buildBookmarksList(
    BuildContext context,
    WidgetRef ref,
    ThemeData theme,
    Set<String> bookmarkedIds,
    AsyncValue<List<News>> hotNewsAsync,
    AsyncValue<List<News>> liveNewsAsync,
  ) {
    final List<News> allNews = [];
    
    hotNewsAsync.whenData((news) {
      allNews.addAll(news);
    });
    liveNewsAsync.whenData((news) {
      allNews.addAll(news);
    });
    
    final bookmarkedNews = allNews.where((news) => bookmarkedIds.contains(news.id)).toList();

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
              ref.read(bookmarksProvider.notifier).toggleBookmark(item.id);
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
}
