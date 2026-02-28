class NewsItem {
  final dynamic id;
  final String title;
  final String url;
  final String? mobileUrl;
  final dynamic pubDate;
  final NewsItemExtra? extra;

  NewsItem({
    required this.id,
    required this.title,
    required this.url,
    this.mobileUrl,
    this.pubDate,
    this.extra,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      id: json['id'],
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      mobileUrl: json['mobileUrl'],
      pubDate: json['pubDate'],
      extra: json['extra'] != null ? NewsItemExtra.fromJson(json['extra']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'url': url,
      'mobileUrl': mobileUrl,
      'pubDate': pubDate,
      'extra': extra?.toJson(),
    };
  }

  String get newsId => id.toString();
  
  String get displayUrl => mobileUrl ?? url;
  
  String? get hoverText => extra?.hover;
  
  String? get dateText => extra?.date?.toString();
}

class NewsItemExtra {
  final String? hover;
  final dynamic date;
  final dynamic info;
  final int? diff;
  final dynamic icon;

  NewsItemExtra({
    this.hover,
    this.date,
    this.info,
    this.diff,
    this.icon,
  });

  factory NewsItemExtra.fromJson(Map<String, dynamic> json) {
    return NewsItemExtra(
      hover: json['hover'],
      date: json['date'],
      info: json['info'],
      diff: json['diff'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hover': hover,
      'date': date,
      'info': info,
      'diff': diff,
      'icon': icon,
    };
  }
}

class SourceResponse {
  final String status;
  final String id;
  final dynamic updatedTime;
  final List<NewsItem> items;

  SourceResponse({
    required this.status,
    required this.id,
    required this.updatedTime,
    required this.items,
  });

  factory SourceResponse.fromJson(Map<String, dynamic> json) {
    return SourceResponse(
      status: json['status'] ?? '',
      id: json['id'] ?? '',
      updatedTime: json['updatedTime'],
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => NewsItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'id': id,
      'updatedTime': updatedTime,
      'items': items.map((e) => e.toJson()).toList(),
    };
  }
}
