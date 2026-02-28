import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class CategoryTabs extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const CategoryTabs({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  String _getCategoryId(String category) {
    switch (category) {
      case '全部':
        return 'all';
      case '科技':
        return 'tech';
      case '财经':
        return 'finance';
      case '娱乐':
        return 'entertainment';
      case '体育':
        return 'sports';
      default:
        return 'all';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = _getCategoryId(selectedCategory) == _getCategoryId(category);
          
          return GestureDetector(
            onTap: () => onCategorySelected(_getCategoryId(category)),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected 
                    ? AppColors.accentColor 
                    : theme.cardTheme.color,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected 
                      ? AppColors.accentColor 
                      : theme.dividerColor,
                ),
              ),
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isSelected 
                      ? Colors.white 
                      : theme.textTheme.bodyMedium?.color,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
