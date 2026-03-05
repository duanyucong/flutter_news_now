import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';
import 'hot_screen.dart';
import 'live_screen.dart';
import 'follow_screen.dart';
import 'profile_screen.dart';

final currentNavIndexProvider = StateProvider<int>((ref) => 0);

// 记录每个导航项上次点击的时间
final lastTapTimeProvider = StateProvider<Map<int, DateTime>>((ref) => {});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentNavIndexProvider);

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          LiveScreen(),
          HotScreen(),
          FollowScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => _handleTap(context, ref, index, currentIndex),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time_outlined),
              activeIcon: Icon(Icons.access_time_filled),
              label: '实时',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.whatshot_outlined),
              activeIcon: Icon(Icons.whatshot),
              label: '热点',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              activeIcon: Icon(Icons.favorite),
              label: '关注',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: '个人',
            ),
          ],
        ),
      ),
    );
  }

  void _handleTap(BuildContext context, WidgetRef ref, int index, int currentIndex) {
    final lastTapTimes = ref.read(lastTapTimeProvider);
    final lastTapTime = lastTapTimes[index];
    final now = DateTime.now();

    // 检测双击（500ms内再次点击同一导航项）
    if (lastTapTime != null && now.difference(lastTapTime).inMilliseconds < 500) {
      // 双击：重置点击时间，跳转到对应页面并刷新数据
      ref.read(lastTapTimeProvider.notifier).state = {...lastTapTimes, index: DateTime(0)};
      
      // 如果不在当前页面，先切换页面
      if (index != currentIndex) {
        ref.read(currentNavIndexProvider.notifier).state = index;
      }
      
      // 刷新页面数据
      _refreshPage(ref, index);
      
      // 滚动到顶部
      _scrollToTop(ref, index);
    } else {
      // 单击：记录点击时间
      ref.read(lastTapTimeProvider.notifier).state = {...lastTapTimes, index: now};
      
      if (index != currentIndex) {
        // 切换到其他页面
        ref.read(currentNavIndexProvider.notifier).state = index;
      } else {
        // 在当前页面，滚动到顶部
        _scrollToTop(ref, index);
      }
    }
  }

  void _refreshPage(WidgetRef ref, int index) {
    switch (index) {
      case 0: // LiveScreen
        ref.read(liveNewsProvider.notifier).refresh();
        break;
      case 1: // HotScreen
        ref.read(hotNewsProvider.notifier).refresh();
        break;
      case 2: // FollowScreen
        ref.read(followNewsProvider.notifier).refresh();
        break;
      case 3: // ProfileScreen
        // 个人页面不需要刷新数据
        break;
    }
  }

  void _scrollToTop(WidgetRef ref, int index) {
    final scrollController = ref.read(scrollControllersProvider)[index];
    if (scrollController != null && scrollController.hasClients) {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
