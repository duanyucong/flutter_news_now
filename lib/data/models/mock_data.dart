import '../models/news.dart';
import '../models/source.dart';

class MockData {
  static List<News> getHotNews() {
    return [
      News(
        id: '1',
        title: '雷军宣布小米汽车SU7将于4月正式交付，售价21.59万元起',
        description: '小米汽车官方今日宣布，SU7系列车型将于4月开始交付，订单已突破10万台。',
        content: '小米汽车官方今日宣布，SU7系列车型将于4月开始交付，订单已突破10万台。这是小米汽车首款量产车型，自发布以来备受关注。\n\n雷军在发布会上表示，小米汽车将坚持"为发烧而生"的理念，为用户提供高品质、高性价比的智能电动汽车。',
        source: '知乎',
        sourceId: 'zhihu',
        time: '2分钟前',
        timestamp: DateTime.now().millisecondsSinceEpoch - 120000,
        likes: 125000,
        comments: 8234,
        category: 'tech',
      ),
      News(
        id: '2',
        title: 'ChatGPT推出全新语音模式，支持实时对话和情感识别',
        description: 'OpenAI今日发布GPT-4o语音模式升级版，用户可体验更自然的语音交互。',
        content: 'OpenAI今日发布GPT-4o语音模式升级版，用户可体验更自然的语音交互。新版本支持实时对话、情感识别和多语言翻译等功能。\n\n据官方介绍，新版本的响应速度提升了两倍，能够更准确地理解用户的情感和意图。',
        source: '微博',
        sourceId: 'weibo',
        time: '5分钟前',
        timestamp: DateTime.now().millisecondsSinceEpoch - 300000,
        likes: 89000,
        comments: 5672,
        category: 'tech',
      ),
      News(
        id: '3',
        title: '苹果发布iOS 18.3更新，带来全新AI功能和隐私保护',
        description: '苹果今日推送iOS 18.3正式版，新增多项AI功能和增强的隐私保护机制。',
        content: '苹果今日推送iOS 18.3正式版，新增多项AI功能和增强的隐私保护机制。\n\n本次更新主要包括：智能摘要生成、AI写作助手增强、隐私权限管理优化等。',
        source: 'IT之家',
        sourceId: 'ithome',
        time: '8分钟前',
        timestamp: DateTime.now().millisecondsSinceEpoch - 480000,
        imageUrl: 'https://picsum.photos/400/300',
        likes: 63000,
        comments: 3891,
        category: 'tech',
      ),
      News(
        id: '4',
        title: '《流浪地球3》定档2026年春节，吴京回归主演',
        description: '导演郭帆今日宣布《流浪地球3》将于2026年大年初一上映，吴京将继续饰演刘培强。',
        content: '导演郭帆今日宣布《流浪地球3》将于2026年大年初一上映，吴京将继续饰演刘培强。\n\n据官方透露，第三部将延续前作的宏大叙事风格，探索更深层的科幻主题。',
        source: '豆瓣',
        sourceId: 'douban',
        time: '12分钟前',
        timestamp: DateTime.now().millisecondsSinceEpoch - 720000,
        likes: 152000,
        comments: 12567,
        category: 'entertainment',
      ),
      News(
        id: '5',
        title: 'Vue 3.5正式发布，带来响应式系统重大升级',
        description: '尤雨溪今日宣布Vue 3.5正式版发布，响应式性能提升50%，新增多项开发者友好功能。',
        content: '尤雨溪今日宣布Vue 3.5正式版发布，响应式性能提升50%，新增多项开发者友好功能。\n\n主要更新包括：响应式系统重构、更好的TypeScript支持、新的编译器优化等。',
        source: 'GitHub',
        sourceId: 'github',
        time: '15分钟前',
        timestamp: DateTime.now().millisecondsSinceEpoch - 900000,
        likes: 48000,
        comments: 2345,
        category: 'tech',
      ),
    ];
  }

  static List<News> getLiveNews() {
    return [
      News(
        id: 'live1',
        title: 'SpaceX星舰第四次试飞成功完成，所有目标达成！',
        description: 'SpaceX星舰第四次试飞圆满成功，所有预定目标均已达成。',
        content: 'SpaceX星舰第四次试飞圆满成功，所有预定目标均已达成。\n\n本次试飞验证了星舰的多项关键技术，包括热分离、太空机动和返回着陆等。',
        source: '@elonmusk',
        sourceId: 'twitter',
        time: '刚刚',
        timestamp: DateTime.now().millisecondsSinceEpoch,
        likes: 23000,
        comments: 1892,
        category: 'live',
      ),
      News(
        id: 'live2',
        title: '比特币突破72000美元，创历史新高',
        description: '比特币价格今日突破72000美元，创下历史新高。',
        content: '比特币价格今日突破72000美元，创下历史新高。\n\n市场分析师认为，这一涨势主要受机构投资者入场和现货ETF获批等因素推动。',
        source: '财经频道',
        sourceId: 'telegram',
        time: '1分钟前',
        timestamp: DateTime.now().millisecondsSinceEpoch - 60000,
        likes: 5678,
        comments: 892,
        category: 'live',
      ),
      News(
        id: 'live3',
        title: '央行宣布降准0.5个百分点，释放长期资金约1万亿元',
        description: '中国人民银行今日宣布，决定于2024年2月5日起下调金融机构存款准备金率0.5个百分点。',
        content: '中国人民银行今日宣布，决定于2024年2月5日起下调金融机构存款准备金率0.5个百分点。\n\n此举预计将释放长期资金约1万亿元，支持实体经济发展。',
        source: '界面新闻',
        sourceId: 'jiemian',
        time: '3分钟前',
        timestamp: DateTime.now().millisecondsSinceEpoch - 180000,
        likes: 8234,
        comments: 1567,
        category: 'live',
      ),
      News(
        id: 'live4',
        title: '詹姆斯连续三场砍下三双，湖人客场战胜勇士',
        description: '在刚刚结束的NBA常规赛中，湖人客场以128-121战胜勇士。',
        content: '在刚刚结束的NBA常规赛中，湖人客场以128-121战胜勇士。\n\n詹姆斯贡献32分11篮板12助攻，连续第三场比赛砍下三双数据。',
        source: 'NBA吧',
        sourceId: 'tieba',
        time: '5分钟前',
        timestamp: DateTime.now().millisecondsSinceEpoch - 300000,
        likes: 56000,
        comments: 3234,
        category: 'live',
      ),
      News(
        id: 'live5',
        title: 'TypeScript 5.6正式发布，支持更严格的类型检查',
        description: '微软今日发布TypeScript 5.6正式版，新增多项功能和改进。',
        content: '微软今日发布TypeScript 5.6正式版，新增多项功能和改进。\n\n主要更新包括：更严格的类型检查、更好的性能优化和新的编译器选项。',
        source: '程序员',
        sourceId: 'v2ex',
        time: '8分钟前',
        timestamp: DateTime.now().millisecondsSinceEpoch - 480000,
        likes: 3456,
        comments: 567,
        category: 'live',
      ),
    ];
  }

  static List<News> getFollowNews(String sourceId) {
    return List.generate(10, (index) => News(
      id: 'follow_${sourceId}_$index',
      title: '$sourceId 新闻标题 ${index + 1}',
      description: '根据数据源选择 Item ${index + 1}',
      content: '这是来自 $sourceId 的详细内容 ${index + 1}',
      source: _getSourceName(sourceId),
      sourceId: sourceId,
      time: '${index + 1}分钟前',
      timestamp: DateTime.now().millisecondsSinceEpoch - index * 60000,
      likes: 1000 + index * 100,
      comments: 100 + index * 10,
      category: 'follow',
    ));
  }

  static String _getSourceName(String sourceId) {
    switch (sourceId) {
      case 'zhihu':
        return '知乎';
      case 'weibo':
        return '微博';
      case 'fenghuang':
        return '凤凰网';
      case 'baidu':
        return '百度热搜';
      default:
        return sourceId;
    }
  }

  static List<NewsSource> getFollowSources() {
    return [
      NewsSource(id: 'zhihu', name: '知乎', category: 'tech', isSubscribed: true, unreadCount: 5),
      NewsSource(id: 'weibo', name: '微博', category: 'social', isSubscribed: true, unreadCount: 12),
      NewsSource(id: 'fenghuang', name: '凤凰网', category: 'news', isSubscribed: true, unreadCount: 3),
      NewsSource(id: 'baidu', name: '百度热搜', category: 'search', isSubscribed: true, unreadCount: 8),
      NewsSource(id: 'ithome', name: 'IT之家', category: 'tech', isSubscribed: false, unreadCount: 0),
      NewsSource(id: 'douban', name: '豆瓣', category: 'social', isSubscribed: false, unreadCount: 0),
      NewsSource(id: 'hupu', name: '虎扑', category: 'sports', isSubscribed: false, unreadCount: 0),
      NewsSource(id: 'sspai', name: '少数派', category: 'tech', isSubscribed: false, unreadCount: 0),
    ];
  }

  static List<String> getCategoryTabs() {
    return ['全部', '科技', '财经', '娱乐', '体育'];
  }

  static String getCategoryId(String category) {
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
}
