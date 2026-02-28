import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class NewsSource {
  final String id;
  final String name;
  final String category;
  final bool isSubscribed;
  final int unreadCount;

  NewsSource({
    required this.id,
    required this.name,
    required this.category,
    this.isSubscribed = false,
    this.unreadCount = 0,
  });

  factory NewsSource.fromJson(Map<String, dynamic> json) {
    return NewsSource(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      category: json['category'] ?? '',
      isSubscribed: json['is_subscribed'] ?? false,
      unreadCount: json['unread_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'is_subscribed': isSubscribed,
      'unread_count': unreadCount,
    };
  }

  NewsSource copyWith({
    String? id,
    String? name,
    String? category,
    bool? isSubscribed,
    int? unreadCount,
  }) {
    return NewsSource(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      isSubscribed: isSubscribed ?? this.isSubscribed,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }

  Color get color {
    switch (id) {
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

  String get shortName {
    if (name.length > 2) {
      return name.substring(0, 2);
    }
    return name;
  }
}
