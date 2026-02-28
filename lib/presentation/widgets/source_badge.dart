import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class SourceBadge extends StatelessWidget {
  final String sourceId;
  final String sourceName;
  final String? time;
  final bool showTime;

  const SourceBadge({
    super.key,
    required this.sourceId,
    required this.sourceName,
    this.time,
    this.showTime = true,
  });

  Color get sourceColor {
    switch (sourceId.toLowerCase()) {
      case 'zhihu':
        return AppColors.sourceZhihu;
      case 'weibo':
        return AppColors.sourceWeibo;
      case 'github':
        return AppColors.sourceGithub;
      case 'ithome':
        return AppColors.sourceIthome;
      case 'douban':
        return AppColors.sourceDouban;
      case 'twitter':
        return AppColors.sourceTwitter;
      case 'telegram':
        return AppColors.sourceTelegram;
      case 'jiemian':
        return AppColors.sourceJiemian;
      case 'tieba':
        return AppColors.sourceTieba;
      case 'v2ex':
        return AppColors.sourceV2ex;
      case 'hupu':
        return AppColors.sourceHupu;
      case 'sspai':
        return AppColors.sourceSspai;
      default:
        return AppColors.accentColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: sourceColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            _getShortName(sourceName),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        if (showTime && time != null) ...[
          const SizedBox(width: 8),
          Text(
            time!,
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).textTheme.bodySmall?.color,
            ),
          ),
        ],
      ],
    );
  }

  String _getShortName(String name) {
    if (name.length > 2) {
      return name.substring(0, 2);
    }
    return name;
  }
}
