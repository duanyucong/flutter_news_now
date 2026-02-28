import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';

class FollowNav extends ConsumerWidget {
  final List<FollowSourceState> sources;
  final String selectedSource;
  final Function(String) onSourceSelected;

  const FollowNav({
    super.key,
    required this.sources,
    required this.selectedSource,
    required this.onSourceSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final subscribedSources = sources.where((s) => s.isSubscribed).toList();
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: theme.dividerColor),
        ),
      ),
      child: SizedBox(
        height: 36,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: subscribedSources.length,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            final source = subscribedSources[index];
            final isSelected = selectedSource == source.id;
            
            return GestureDetector(
              onTap: () => onSourceSelected(source.id),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: isSelected 
                      ? theme.colorScheme.primary 
                      : theme.dividerColor.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: Text(
                    source.name,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: isSelected 
                          ? Colors.white 
                          : theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
