import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class SourceIcons {
  static String? getIconPath(String sourceId) {
    final iconMap = {
      'zhihu': 'zhihu.png',
      'weibo': 'weibo.png',
      'baidu': 'baidu.png',
      'toutiao': 'toutiao.png',
      'douyin': 'douyin.png',
      'thepaper': 'thepaper.png',
      'ifeng': 'ifeng.png',
      'bilibili-hot-search': 'bilibili.png',
      'tieba': 'tieba.png',
      'douban': 'douban.png',
      'hupu': 'hupu.png',
      'ithome': 'ithome.png',
      '36kr-quick': '36kr.png',
      '36kr-renqi': '36kr.png',
      '36kr': '36kr.png',
      'github-trending-today': 'github.png',
      'github': 'github.png',
      'hackernews': 'hackernews.png',
      'v2ex-share': 'v2ex.png',
      'v2ex': 'v2ex.png',
      'sspai': 'sspai.png',
      'juejin': 'juejin.png',
      'coolapk': 'coolapk.png',
      'wallstreetcn-quick': 'wallstreetcn.png',
      'wallstreetcn': 'wallstreetcn.png',
      'wallstreetcn-news': 'wallstreetcn.png',
      'wallstreetcn-hot': 'wallstreetcn.png',
      'cls-telegraph': 'cls.png',
      'cls': 'cls.png',
      'cls-depth': 'cls.png',
      'cls-hot': 'cls.png',
      'xueqiu-hotstock': 'xueqiu.png',
      'xueqiu': 'xueqiu.png',
      'jin10': 'jin10.png',
      'gelonghui': 'gelonghui.png',
      'zaobao': 'zaobao.png',
      'pcbeta-windows11': 'pcbeta.png',
      'pcbeta': 'pcbeta.png',
      'steam': 'steam.png',
      'kuaishou': 'kuaishou.png',
      'nowcoder': 'nowcoder.png',
      'freebuf': 'freebuf.png',
      'solidot': 'solidot.png',
      'fastbull': 'fastbull.png',
      'fastbull-express': 'fastbull.png',
      'fastbull-news': 'fastbull.png',
      'mktnews': 'mktnews.png',
      'mktnews-flash': 'mktnews.png',
      'kaopu': 'kaopu.png',
      'chongbuluo': 'chongbuluo.png',
      'chongbuluo-latest': 'chongbuluo.png',
      'chongbuluo-hot': 'chongbuluo.png',
      'cankaoxiaoxi': 'cankaoxiaoxi.png',
      'sputniknewscn': 'sputniknewscn.png',
      'producthunt': 'producthunt.png',
      'bilibili': 'bilibili.png',
      'bilibili-hot-video': 'bilibili.png',
      'bilibili-ranking': 'bilibili.png',
      'smzdm': 'smzdm.png',
      'acfun': 'acfun.png',
      'iqiyi': 'iqiyi.png',
      'tencent': 'tencent.png',
      'tencent-hot': 'tencent.png',
      'qqvideo': 'qqvideo.png',
      'linuxdo': 'linuxdo.png',
      'jianshu': 'jianshu.png',
      'weread': 'weread.png',
      'aljazeeracn': 'aljazeeracn.png',
      'peopledaily': 'peopledaily.png',
    };
    return iconMap[sourceId] ?? 'default.png';
  }

  static Widget getIcon(String sourceId, {double size = 24}) {
    final iconPath = getIconPath(sourceId);
    if (iconPath != null) {
      return Image.asset(
        'assets/icons/$iconPath',
        width: size,
        height: size,
        errorBuilder: (context, error, stackTrace) => _getDefaultIcon(sourceId, size),
      );
    }
    return _getDefaultIcon(sourceId, size);
  }

  static Widget _getDefaultIcon(String sourceId, double size) {
    return Icon(_getIconData(sourceId), size: size);
  }

  static IconData _getIconData(String sourceId) {
    switch (sourceId) {
      case 'zhihu':
        return Icons.help_outline;
      case 'weibo':
        return Icons.alternate_email;
      case 'baidu':
        return Icons.search;
      case 'toutiao':
        return Icons.article;
      case 'douyin':
        return Icons.play_circle_filled;
      case 'thepaper':
        return Icons.newspaper;
      case 'ifeng':
        return Icons.public;
      case 'bilibili-hot-search':
        return Icons.smart_display;
      case 'tieba':
        return Icons.forum;
      case 'douban':
        return Icons.movie;
      case 'hupu':
        return Icons.sports_basketball;
      case 'ithome':
        return Icons.computer;
      case '36kr-quick':
        return Icons.flash_on;
      case 'github-trending-today':
        return Icons.code;
      case 'hackernews':
        return Icons.new_releases;
      case 'v2ex-share':
        return Icons.developer_mode;
      case 'sspai':
        return Icons.bolt;
      case 'juejin':
        return Icons.diamond;
      case 'coolapk':
        return Icons.android;
      case 'wallstreetcn-quick':
        return Icons.trending_up;
      case 'cls-telegraph':
        return Icons.telegram;
      case 'xueqiu-hotstock':
        return Icons.show_chart;
      case 'jin10':
        return Icons.analytics;
      case 'gelonghui':
        return Icons.insights;
      default:
        return Icons.rss_feed;
    }
  }

  static Color getColor(String colorName) {
    switch (colorName) {
      case 'blue':
        return AppColors.sourceZhihu;
      case 'red':
        return AppColors.sourceWeibo;
      case 'green':
        return AppColors.sourceDouban;
      case 'orange':
        return AppColors.warningColor;
      case 'gray':
        return AppColors.darkTextSecondary;
      case 'teal':
        return Colors.teal;
      case 'purple':
        return Colors.purple;
      default:
        return AppColors.accentColor;
    }
  }
}

class SourceConfig {
  final String id;
  final String name;
  final String? title;
  final String? type;
  final String column;
  final String color;
  final String? home;
  final int interval;

  const SourceConfig({
    required this.id,
    required this.name,
    this.title,
    this.type,
    required this.column,
    required this.color,
    this.home,
    required this.interval,
  });

  Widget get icon => SourceIcons.getIcon(id);
  Color get iconColor => SourceIcons.getColor(color);
}

class Sources {
  static const Map<String, SourceConfig> sources = {
    'zhihu': SourceConfig(
      id: 'zhihu',
      name: '知乎',
      type: 'hottest',
      column: 'china',
      color: 'blue',
      home: 'https://www.zhihu.com',
      interval: 600000,
    ),
    'weibo': SourceConfig(
      id: 'weibo',
      name: '微博',
      title: '实时热搜',
      type: 'hottest',
      column: 'china',
      color: 'red',
      home: 'https://weibo.com',
      interval: 120000,
    ),
    'baidu': SourceConfig(
      id: 'baidu',
      name: '百度热搜',
      type: 'hottest',
      column: 'china',
      color: 'blue',
      home: 'https://www.baidu.com',
      interval: 600000,
    ),
    'toutiao': SourceConfig(
      id: 'toutiao',
      name: '今日头条',
      type: 'hottest',
      column: 'china',
      color: 'red',
      home: 'https://www.toutiao.com',
      interval: 600000,
    ),
    'douyin': SourceConfig(
      id: 'douyin',
      name: '抖音',
      type: 'hottest',
      column: 'china',
      color: 'gray',
      home: 'https://www.douyin.com',
      interval: 600000,
    ),
    'thepaper': SourceConfig(
      id: 'thepaper',
      name: '澎湃新闻',
      title: '热榜',
      type: 'hottest',
      column: 'china',
      color: 'gray',
      home: 'https://www.thepaper.cn',
      interval: 1800000,
    ),
    'ifeng': SourceConfig(
      id: 'ifeng',
      name: '凤凰网',
      title: '热点资讯',
      type: 'hottest',
      column: 'china',
      color: 'red',
      home: 'https://www.ifeng.com',
      interval: 600000,
    ),
    'bilibili-hot-search': SourceConfig(
      id: 'bilibili-hot-search',
      name: '哔哩哔哩',
      title: '热搜',
      type: 'hottest',
      column: 'china',
      color: 'blue',
      home: 'https://www.bilibili.com',
      interval: 600000,
    ),
    'tieba': SourceConfig(
      id: 'tieba',
      name: '百度贴吧',
      title: '热议',
      type: 'hottest',
      column: 'china',
      color: 'blue',
      home: 'https://tieba.baidu.com',
      interval: 600000,
    ),
    'douban': SourceConfig(
      id: 'douban',
      name: '豆瓣',
      title: '热门电影',
      type: 'hottest',
      column: 'china',
      color: 'green',
      home: 'https://www.douban.com',
      interval: 600000,
    ),
    'hupu': SourceConfig(
      id: 'hupu',
      name: '虎扑',
      title: '主干道热帖',
      type: 'hottest',
      column: 'china',
      color: 'red',
      home: 'https://hupu.com',
      interval: 600000,
    ),
    'ithome': SourceConfig(
      id: 'ithome',
      name: 'IT 之家',
      type: 'realtime',
      column: 'tech',
      color: 'red',
      home: 'https://www.ithome.com',
      interval: 600000,
    ),
    '36kr-quick': SourceConfig(
      id: '36kr-quick',
      name: '36 氪',
      title: '快讯',
      type: 'realtime',
      column: 'tech',
      color: 'blue',
      home: 'https://36kr.com',
      interval: 600000,
    ),
    'github-trending-today': SourceConfig(
      id: 'github-trending-today',
      name: 'Github',
      title: 'Today',
      type: 'hottest',
      column: 'tech',
      color: 'gray',
      home: 'https://github.com/',
      interval: 600000,
    ),
    'hackernews': SourceConfig(
      id: 'hackernews',
      name: 'Hacker News',
      type: 'hottest',
      column: 'tech',
      color: 'orange',
      home: 'https://news.ycombinator.com/',
      interval: 600000,
    ),
    '36kr-renqi': SourceConfig(
      id: '36kr-renqi',
      name: '36 氪',
      title: '人气榜',
      type: 'hottest',
      column: 'tech',
      color: 'blue',
      home: 'https://36kr.com',
      interval: 600000,
    ),
    'solidot': SourceConfig(
      id: 'solidot',
      name: 'Solidot',
      type: 'hottest',
      column: 'tech',
      color: 'gray',
      home: 'https://www.solidot.org/',
      interval: 600000,
    ),
    'v2ex-share': SourceConfig(
      id: 'v2ex-share',
      name: 'V2EX',
      title: '最新分享',
      column: 'tech',
      color: 'blue',
      home: 'https://v2ex.com/',
      interval: 600000,
    ),
    'sspai': SourceConfig(
      id: 'sspai',
      name: '少数派',
      type: 'hottest',
      column: 'tech',
      color: 'blue',
      home: 'https://sspai.com',
      interval: 600000,
    ),
    'juejin': SourceConfig(
      id: 'juejin',
      name: '稀土掘金',
      type: 'hottest',
      column: 'tech',
      color: 'orange',
      home: 'https://juejin.cn',
      interval: 600000,
    ),
    'coolapk': SourceConfig(
      id: 'coolapk',
      name: '酷安',
      title: '今日最热',
      type: 'hottest',
      column: 'tech',
      color: 'green',
      home: 'https://coolapk.com',
      interval: 600000,
    ),
    'wallstreetcn-quick': SourceConfig(
      id: 'wallstreetcn-quick',
      name: '华尔街见闻',
      title: '快讯',
      type: 'realtime',
      column: 'finance',
      color: 'red',
      home: 'https://wallstreetcn.com/',
      interval: 300000,
    ),
    'cls-telegraph': SourceConfig(
      id: 'cls-telegraph',
      name: '财联社',
      title: '电报',
      type: 'realtime',
      column: 'finance',
      color: 'red',
      home: 'https://www.cls.cn',
      interval: 300000,
    ),
    'xueqiu-hotstock': SourceConfig(
      id: 'xueqiu-hotstock',
      name: '雪球',
      title: '热门股票',
      type: 'hottest',
      column: 'finance',
      color: 'red',
      home: 'https://xueqiu.com',
      interval: 120000,
    ),
    'jin10': SourceConfig(
      id: 'jin10',
      name: '金十数据',
      type: 'realtime',
      column: 'finance',
      color: 'red',
      home: 'https://www.jin10.com',
      interval: 600000,
    ),
    'gelonghui': SourceConfig(
      id: 'gelonghui',
      name: '格隆汇',
      title: '事件',
      type: 'realtime',
      column: 'finance',
      color: 'green',
      home: 'https://www.gelonghui.com',
      interval: 120000,
    ),
    'zaobao': SourceConfig(
      id: 'zaobao',
      name: '联合早报',
      type: 'realtime',
      column: 'world',
      color: 'red',
      home: 'https://www.zaobao.com',
      interval: 1800000,
    ),
    'pcbeta-windows11': SourceConfig(
      id: 'pcbeta-windows11',
      name: '远景论坛',
      title: 'Win11',
      type: 'realtime',
      column: 'tech',
      color: 'blue',
      home: 'https://bbs.pcbeta.com',
      interval: 300000,
    ),
    'steam': SourceConfig(
      id: 'steam',
      name: 'Steam',
      type: 'hottest',
      column: 'tech',
      color: 'blue',
      home: 'https://store.steampowered.com',
      interval: 600000,
    ),
    'kuaishou': SourceConfig(
      id: 'kuaishou',
      name: '快手',
      type: 'hottest',
      column: 'tech',
      color: 'orange',
      home: 'https://www.kuaishou.com',
      interval: 600000,
    ),
    'nowcoder': SourceConfig(
      id: 'nowcoder',
      name: '牛客',
      type: 'hottest',
      column: 'tech',
      color: 'blue',
      home: 'https://www.nowcoder.com',
      interval: 600000,
    ),
    'freebuf': SourceConfig(
      id: 'freebuf',
      name: 'FreeBuf',
      type: 'hottest',
      column: 'tech',
      color: 'green',
      home: 'https://www.freebuf.com',
      interval: 600000,
    ),
    'xueqiu': SourceConfig(
      id: 'xueqiu',
      name: '雪球',
      type: 'hottest',
      column: 'finance',
      color: 'red',
      home: 'https://xueqiu.com',
      interval: 120000,
    ),
    'cls': SourceConfig(
      id: 'cls',
      name: '财联社',
      type: 'hottest',
      column: 'finance',
      color: 'red',
      home: 'https://www.cls.cn',
      interval: 300000,
    ),
  };

  static List<String> get hottestSources =>
      sources.entries
          .where((e) => e.value.type == 'hottest')
          .map((e) => e.key)
          .toList();

  static List<String> get realtimeSources =>
      sources.entries
          .where((e) => e.value.type == 'realtime')
          .map((e) => e.key)
          .toList();

  static List<String> getSourcesByColumn(String column) =>
      sources.entries
          .where((e) => e.value.column == column)
          .map((e) => e.key)
          .toList();

  static SourceConfig? getSource(String id) => sources[id];
}
