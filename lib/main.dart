import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'providers/providers.dart';
import 'presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 初始化屏幕旋转设置
  final container = ProviderContainer();
  await container.read(screenRotationProvider.notifier).initialized;
  
  runApp(
    ProviderScope(
      parent: container,
      child: const NewsNowApp(),
    ),
  );
}

class NewsNowApp extends ConsumerWidget {
  const NewsNowApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    
    return MaterialApp(
      title: 'NewsNow',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode == AppThemeMode.light 
          ? ThemeMode.light 
          : themeMode == AppThemeMode.dark 
              ? ThemeMode.dark 
              : ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
